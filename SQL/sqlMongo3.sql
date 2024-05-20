Database Schema:

Users Table:
user_id (Primary Key)
username
password
role (e.g., admin, librarian, member)

Books Table:
book_id (Primary Key)
title
author
isbn
publication_year
quantity_available

Book Issues Table:
issue_id (Primary Key)
user_id (Foreign Key referencing Users Table)
book_id (Foreign Key referencing Books Table)
issue_date
return_date
status (e.g., issued, returned)

Fines Table:
fine_id (Primary Key)
user_id (Foreign Key referencing Users Table)
issue_id (Foreign Key referencing Book Issues Table)
fine_amount
fine_reason
fine_date



Entity Descriptions:
Users: Represents users of the library system. Each user has a unique user_id, username, password, and role (e.g., admin, librarian, member).
Books: Represents books available in the library. Each book has a unique book_id, title, author, isbn, publication_year, and quantity_available.
BookIssues: Represents the issuance of books to users. Each issue has a unique issue_id, references a user_id from the Users table, and a book_id from the Books table. It also includes issue_date, return_date, and status (issued or returned).
Fines: Represents fines imposed on users for late returns. Each fine has a unique fine_id, references a user_id and issue_id, and includes fine_amount, fine_reason, and fine_date.
Relationship Descriptions:
Users - Books: One-to-Many relationship where a user can issue multiple books, but each book can be issued to multiple users.
Books - BookIssues: One-to-Many relationship where each book can have multiple issues, but each issue is associated with only one book.
Users - BookIssues: One-to-Many relationship where each user can have multiple issued books, but each issue is associated with only one user.
BookIssues - Fines: One-to-One relationship where each issue can have only one fine, but each fine is associated with only one issue.




   +-----------------+        +---------------+        +---------------+
   |     Users       |        |     Books     |        |  BookIssues   |
   +-----------------+        +---------------+        +---------------+
   | user_id (PK)    |<-------| book_id (PK)  |        | issue_id (PK) |
   | username        |        | title         |        | user_id (FK)  |
   | password        |        | author        |<-------| book_id (FK)  |
   | role            |        | isbn          |        | issue_date    |
   +-----------------+        | publication_yr|        | return_date   |
                              | qty_available |        | status        |
                              +---------------+        +---------------+
                                    |
                                    |
                              +---------------+
                              |     Fines     |
                              +---------------+
                              | fine_id (PK)  |
                              | user_id (FK)  |
                              | issue_id (FK) |
                              | fine_amount   |
                              | fine_reason   |
                              | fine_date     |
                              +---------------+



Trigger 1: This trigger updates the quantity_available column in the Books table after a book is issued (inserted into the BookIssues table).
Trigger 2: This trigger updates the quantity_available column in the Books table before a book is returned (deleted from the BookIssues table).
Trigger 3: This trigger calculates fines for late returns. It calculates the number of days between the issue date and return date, and if the return date is more than 15 days after the issue date, it inserts a fine record into the Fines table.



mysql> CREATE DATABASE LibraryDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE LibraryDB;
Database changed
mysql> -- Create Users Table
mysql> CREATE TABLE Users (
    ->     user_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     username VARCHAR(255) NOT NULL UNIQUE,
    ->     password VARCHAR(255) NOT NULL,
    ->     role ENUM('admin', 'librarian', 'member') NOT NULL
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql>
mysql> -- Create Books Table
mysql> CREATE TABLE Books (
    ->     book_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(255) NOT NULL,
    ->     author VARCHAR(255) NOT NULL,
    ->     isbn VARCHAR(20) NOT NULL UNIQUE,
    ->     publication_year YEAR NOT NULL,
    ->     quantity_available INT NOT NULL
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql>
mysql> -- Create Book Issues Table
mysql> CREATE TABLE BookIssues (
    ->     issue_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     user_id INT,
    ->     book_id INT,
    ->     issue_date DATE NOT NULL,
    ->     return_date DATE,
    ->     status ENUM('issued', 'returned') NOT NULL,
    ->     FOREIGN KEY (user_id) REFERENCES Users(user_id),
    ->     FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql>
mysql> -- Create Fines Table
mysql> CREATE TABLE Fines (
    ->     fine_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     user_id INT,
    ->     issue_id INT,
    ->     fine_amount DECIMAL(10, 2) NOT NULL,
    ->     fine_reason VARCHAR(255) NOT NULL,
    ->     fine_date DATE NOT NULL,
    ->     FOREIGN KEY (user_id) REFERENCES Users(user_id),
    ->     FOREIGN KEY (issue_id) REFERENCES BookIssues(issue_id)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> -- Sample data for Users Table
mysql> INSERT INTO Users (username, password, role) VALUES
    -> ('admin', 'admin123', 'admin'),
    -> ('librarian', 'librarian123', 'librarian'),
    -> ('user1', 'user123', 'member'),
    -> ('user2', 'user456', 'member');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Sample data for Books Table
mysql> INSERT INTO Books (title, author, isbn, publication_year, quantity_available) VALUES
    -> ('Book1', 'Author1', '978-3-16-148410-0', '2020', 5),
    -> ('Book2', 'Author2', '978-3-16-148411-0', '2019', 3),
    -> ('Book3', 'Author3', '978-3-16-148412-0', '2021', 7);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Sample data for BookIssues Table
mysql> INSERT INTO BookIssues (user_id, book_id, issue_date, return_date, status) VALUES
    -> (3, 1, '2024-04-01', '2024-04-15', 'returned'),
    -> (4, 2, '2024-04-05', NULL, 'issued');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Sample data for Fines Table
mysql> INSERT INTO Fines (user_id, issue_id, fine_amount, fine_reason, fine_date) VALUES
    -> (3, 1, 5.00, 'Late return', '2024-04-20'),
    -> (4, 2, 2.50, 'Pending return', '2024-04-16');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0




mysql> CREATE TRIGGER update_quantity_available AFTER INSERT ON BookIssues
    -> FOR EACH ROW
    -> BEGIN
    ->     UPDATE Books
    ->     SET quantity_available = quantity_available - 1
    ->     WHERE book_id = NEW.book_id;
    -> END;
    -> //
Query OK, 0 rows affected (0.03 sec)



mysql> DELIMITER //
mysql> CREATE TRIGGER calculate_fine AFTER INSERT ON BookIssues
    -> FOR EACH ROW
    -> BEGIN
    ->     DECLARE fine_days INT;
    ->     DECLARE fine_amount DECIMAL(10, 2);
    ->
    ->     IF NEW.return_date IS NOT NULL AND NEW.return_date > NEW.issue_date THEN
    ->         SET fine_days = DATEDIFF(NEW.return_date, NEW.issue_date);
    ->         IF fine_days > 15 THEN
    ->             SET fine_amount = (fine_days - 15) * 0.5;
    ->             INSERT INTO Fines (user_id, issue_id, fine_amount, fine_reason, fine_date)
    ->             VALUES (NEW.user_id, NEW.issue_id, fine_amount, 'Late return', NOW());
    ->         END IF;
    ->     END IF;
    -> END;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER ;


mysql>
mysql> CREATE TRIGGER update_quantity_available_return BEFORE DELETE ON BookIssues
    -> FOR EACH ROW
    -> BEGIN
    ->     UPDATE Books
    ->     SET quantity_available = quantity_available + 1
    ->     WHERE book_id = OLD.book_id;
    -> END;
    -> //
Query OK, 0 rows affected (0.04 sec)

mysql>



mysql>
mysql> DESC users;
+----------+------------------------------------+------+-----+---------+----------------+
| Field    | Type                               | Null | Key | Default | Extra          |
+----------+------------------------------------+------+-----+---------+----------------+
| user_id  | int                                | NO   | PRI | NULL    | auto_increment |
| username | varchar(255)                       | NO   | UNI | NULL    |                |
| password | varchar(255)                       | NO   |     | NULL    |                |
| role     | enum('admin','librarian','member') | NO   |     | NULL    |                |
+----------+------------------------------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> DESC books;
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| book_id            | int          | NO   | PRI | NULL    | auto_increment |
| title              | varchar(255) | NO   |     | NULL    |                |
| author             | varchar(255) | NO   |     | NULL    |                |
| isbn               | varchar(20)  | NO   | UNI | NULL    |                |
| publication_year   | year         | NO   |     | NULL    |                |
| quantity_available | int          | NO   |     | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> DESC BookIssues;
+-------------+---------------------------+------+-----+---------+----------------+
| Field       | Type                      | Null | Key | Default | Extra          |
+-------------+---------------------------+------+-----+---------+----------------+
| issue_id    | int                       | NO   | PRI | NULL    | auto_increment |
| user_id     | int                       | YES  | MUL | NULL    |                |
| book_id     | int                       | YES  | MUL | NULL    |                |
| issue_date  | date                      | NO   |     | NULL    |                |
| return_date | date                      | YES  |     | NULL    |                |
| status      | enum('issued','returned') | NO   |     | NULL    |                |
+-------------+---------------------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> DESC Fines;
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| fine_id     | int           | NO   | PRI | NULL    | auto_increment |
| user_id     | int           | YES  | MUL | NULL    |                |
| issue_id    | int           | YES  | MUL | NULL    |                |
| fine_amount | decimal(10,2) | NO   |     | NULL    |                |
| fine_reason | varchar(255)  | NO   |     | NULL    |                |
| fine_date   | date          | NO   |     | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql>


Example 1: Retrieve Books by Author
To retrieve books by a specific author, you can use a SELECT query:

SELECT title, publication_year
FROM Books
WHERE author = 'Author Name';

This query will return the title and publication year of all books written by 'Author Name'.


Example 2: Issue a Book to a User
To issue a book to a user, you need to insert a new record into the BookIssues table:

INSERT INTO BookIssues (user_id, book_id, issue_date, return_date, status)
VALUES (user_id_value, book_id_value, '2024-04-27', NULL, 'issued');

Replace user_id_value and book_id_value with the actual IDs of the user and book you want to issue.





mysql> SELECT * FROM users;
+---------+-----------+--------------+-----------+
| user_id | username  | password     | role      |
+---------+-----------+--------------+-----------+
|       1 | admin     | admin123     | admin     |
|       2 | librarian | librarian123 | librarian |
|       3 | user1     | user123      | member    |
|       4 | user2     | user456      | member    |
+---------+-----------+--------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM books;
+---------+-------+---------+-------------------+------------------+--------------------+
| book_id | title | author  | isbn              | publication_year | quantity_available |
+---------+-------+---------+-------------------+------------------+--------------------+
|       1 | Book1 | Author1 | 978-3-16-148410-0 |             2020 |                  5 |
|       2 | Book2 | Author2 | 978-3-16-148411-0 |             2019 |                  3 |
|       3 | Book3 | Author3 | 978-3-16-148412-0 |             2021 |                  7 |
+---------+-------+---------+-------------------+------------------+--------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM BookIssues;
+----------+---------+---------+------------+-------------+----------+
| issue_id | user_id | book_id | issue_date | return_date | status   |
+----------+---------+---------+------------+-------------+----------+
|        1 |       3 |       1 | 2024-04-01 | 2024-04-15  | returned |
|        2 |       4 |       2 | 2024-04-05 | NULL        | issued   |
+----------+---------+---------+------------+-------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Fines;
+---------+---------+----------+-------------+----------------+------------+
| fine_id | user_id | issue_id | fine_amount | fine_reason    | fine_date  |
+---------+---------+----------+-------------+----------------+------------+
|       1 |       3 |        1 |        5.00 | Late return    | 2024-04-20 |
|       2 |       4 |        2 |        2.50 | Pending return | 2024-04-16 |
+---------+---------+----------+-------------+----------------+------------+
2 rows in set (0.00 sec)



mysql> select * from users;
+---------+-----------+--------------+-----------+
| user_id | username  | password     | role      |
+---------+-----------+--------------+-----------+
|       1 | admin     | admin123     | admin     |
|       2 | librarian | librarian123 | librarian |
|       3 | user1     | user123      | member    |
|       4 | user2     | user456      | member    |
+---------+-----------+--------------+-----------+
4 rows in set (0.00 sec)

mysql> select * from books;
+---------+-------+---------+-------------------+------------------+--------------------+
| book_id | title | author  | isbn              | publication_year | quantity_available |
+---------+-------+---------+-------------------+------------------+--------------------+
|       1 | Book1 | Author1 | 978-3-16-148410-0 |             2020 |                  6 |
|       2 | Book2 | Author2 | 978-3-16-148411-0 |             2019 |                  4 |
|       3 | Book3 | Author3 | 978-3-16-148412-0 |             2021 |                  7 |
+---------+-------+---------+-------------------+------------------+--------------------+
3 rows in set (0.00 sec)

mysql> select * from bookissues;
Empty set (0.01 sec)

mysql> select * from fines;
Empty set (0.00 sec)




mysql> INSERT INTO BookIssues (user_id, book_id, issue_date, return_date, status)
    -> VALUES
    -> (4, 2, '2024-04-05', NULL, 'issued');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO BookIssues (user_id, book_id, issue_date, return_date, status)
    -> VALUES
    -> (3, 3, '2024-04-01', '2024-04-11', 'returned');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO BookIssues (user_id, book_id, issue_date, return_date, status)
    -> VALUES
    -> (3, 1, '2024-04-02', '2024-04-20', 'returned');
Query OK, 1 row affected (0.01 sec)



mysql> SELECT * FROM BookIssues;
+----------+---------+---------+------------+-------------+----------+
| issue_id | user_id | book_id | issue_date | return_date | status   |
+----------+---------+---------+------------+-------------+----------+
|        8 |       4 |       2 | 2024-04-05 | NULL        | issued   |
|        9 |       3 |       3 | 2024-04-01 | 2024-04-11  | returned |
|       10 |       3 |       1 | 2024-04-02 | 2024-04-20  | returned |
+----------+---------+---------+------------+-------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT book_id, title, quantity_available FROM books;
+---------+-------+--------------------+
| book_id | title | quantity_available |
+---------+-------+--------------------+
|       1 | Book1 |                  5 |
|       2 | Book2 |                  3 |
|       3 | Book3 |                  6 |
+---------+-------+--------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM fines;
+---------+---------+----------+-------------+-------------+------------+
| fine_id | user_id | issue_id | fine_amount | fine_reason | fine_date  |
+---------+---------+----------+-------------+-------------+------------+
|       1 |       3 |       10 |        1.50 | Late return | 2024-04-27 |
+---------+---------+----------+-------------+-------------+------------+
1 row in set (0.00 sec)



mysql> DELETE FROM BookIssues
    -> WHERE issue_id = 8;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM BookIssues;
+----------+---------+---------+------------+-------------+----------+
| issue_id | user_id | book_id | issue_date | return_date | status   |
+----------+---------+---------+------------+-------------+----------+
|        9 |       3 |       3 | 2024-04-01 | 2024-04-11  | returned |
|       10 |       3 |       1 | 2024-04-02 | 2024-04-20  | returned |
+----------+---------+---------+------------+-------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT book_id, title, quantity_available FROM books;
+---------+-------+--------------------+
| book_id | title | quantity_available |
+---------+-------+--------------------+
|       1 | Book1 |                  5 |
|       2 | Book2 |                  4 |
|       3 | Book3 |                  6 |
+---------+-------+--------------------+
3 rows in set (0.00 sec)

mysql>