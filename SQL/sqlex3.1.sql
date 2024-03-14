SQL> CREATE TABLE faculty (
  2  fid INT NOT NULL PRIMARY KEY,
  3  name VARCHAR(20) NOT NULL,
  4  dno INT,
  5  sal INT,
  6  address VARCHAR(50),
  7  phone INT,
  8  dob DATE,
  9  exp INT);

Table created.

SQL> CREATE TABLE dept(
  2  dno INT NOT NULL PRIMARY KEY,
  3  dname VARCHAR(20) NOT NULl,
  4  budget INT);

Table created.

SQL> ALTER TABLE faculty ADD FOREIGN KEY (dno) REFERENCES dept(dno);

Table altered.

SQL> CREATE TABLE student (
  2  sid INT NOT NULL PRIMARY KEY,
  3  name VARCHAR(20),
  4  dno INT NOT NULL,
  5  phone INT,
  6  dob DATE,
  7  address VARCHAR(50),
  8  sem INT);

Table created.

SQL> ALTER TABLE STUDENT ADD FOREIGN KEY (dno) REFERENCES dept(dno);

Table altered.

SQL> CREATE TABLE society (
  2  sc_id INT NOT NULL PRIMARY KEY,
  3  name VARCHAR(20) NOT NULL);

Table created.

SQL> CREATE TABLE course (
  2  cid INT NOT NULL PRIMARY KEY,
  3  cname VARCHAR(20) NOT NULL);

Table created.

SQL> CREATE TABLE std_soc (
  2  sid INT NOT NULL,
  3  sc_id INT NOT NULL
  4  );

Table created.

SQL> CREATE TABLE fac_course (
  2  fid INT NOT NULL,
  3  cid INT NOT NULL);

Table created.

SQL> ALTER TABLE std_soc ADD FOREIGN KEY (sid) REFERENCES student(sid);

Table altered.

SQL> ALTER TABLE std_soc ADD FOREIGN KEY (sc_id) REFERENCES society(sc_id);

Table altered.

SQL> ALTER TABLE fac_course ADD FOREIGN KEY (fid) REFERENCES faculty(fid);

Table altered.

SQL> ALTER TABLE fac_course ADD FOREIGN KEY (cid) REFERENCES course(cid);

Table altered.





SQL> CREATE TABLE std_socc (
  2  sid INT NOT NULL,
  3  sc_id INT NOT NULL,
  4  PRIMARY KEY (sid, sc_id),
  5  FOREIGN KEY (sid) REFERENCES student (sid),
  6  FOREIGN KEY (sc_id) REFERENCES society (sc_id) );
Table created.

SQL> CREATE TABLE fac_courses (
  2  fid INT NOT NULL,
  3  cid INT NOT NULL,
  4  PRIMARY KEY (fid, cid),
  5  FOREIGN KEY (fid) REFERENCES faculty (fid),
  6  FOREIGN KEY (cid) REFERENCES course (cid) );
Table created.






SQL> DESC faculty;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 FID                               NOT NULL NUMBER(38)
 NAME                              NOT NULL VARCHAR2(20)
 DNO                                        NUMBER(38)
 SAL                                        NUMBER(38)
 ADDRESS                                    VARCHAR2(50)
 PHONE                                      NUMBER(38)
 DOB                                        DATE
 EXP                                        NUMBER(38)

SQL> DESC dept;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 DNO                               NOT NULL NUMBER(38)
 DNAME                             NOT NULL VARCHAR2(20)
 BUDGET                                     NUMBER(38)

SQL> DESC student;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 SID                               NOT NULL NUMBER(38)
 NAME                                       VARCHAR2(20)
 DNO                               NOT NULL NUMBER(38)
 PHONE                                      NUMBER(38)
 DOB                                        DATE
 ADDRESS                                    VARCHAR2(50)
 SEM                                        NUMBER(38)

SQL> DESC society;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 SC_ID                             NOT NULL NUMBER(38)
 NAME                              NOT NULL VARCHAR2(20)

SQL> DESC std_soc;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 SID                               NOT NULL NUMBER(38)
 SC_ID                             NOT NULL NUMBER(38)

SQL> DESC course;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 CID                               NOT NULL NUMBER(38)
 CNAME                             NOT NULL VARCHAR2(20)

SQL> DESC fac_course;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 FID                               NOT NULL NUMBER(38)
 CID                               NOT NULL NUMBER(38)




SQL> ALTER TABLE faculty ADD no_of_awards INT;

Table altered.

SQL> DESC faculty;
 Name                              Null?    Type
 --------------------------------- -------- ----------------------------
 FID                               NOT NULL NUMBER(38)
 NAME                              NOT NULL VARCHAR2(20)
 DNO                                        NUMBER(38)
 SAL                                        NUMBER(38)
 ADDRESS                                    VARCHAR2(50)
 PHONE                                      NUMBER(38)
 DOB                                        DATE
 EXP                                        NUMBER(38)
 NO_OF_AWARDS                               NUMBER(38)

SQL> INSERT INTO dept VALUES (1, 'CSE', 10000);

1 row created.

SQL> INSERT INTO dept VALUES (2, 'AIDS', 12000);

1 row created.

SQL> INSERT INTO dept VALUES (3, 'AIML', 9000);

1 row created.

SQL> INSERT INTO dept VALUES (4, 'IIOT', 8000);

1 row created.

SQL> INSERT INTO dept VALUES (5, 'VSLI', 6000);

1 row created.

SQL> INSERT INTO society VALUES (1, 'Kalakriti');

1 row created.

SQL> INSERT INTO society VALUES (2, 'Srijan');

1 row created.

SQL> INSERT INTO society VALUES (3, 'EDC Cell');

1 row created.

SQL> INSERT INTO society VALUES (4, 'NSS');

1 row created.

SQL> INSERT INTO society VALUES (5, 'NCC');

1 row created.

SQL> INSERT INTO course VALUES (1, 'Computational Method');

1 row created.

SQL> INSERT INTO course VALUES (2, 'Software Engineering');

1 row created.

SQL> INSERT INTO course VALUES (3, 'Fundamentals of ML');

1 row created.

SQL> INSERT INTO course VALUES (4, 'OOPs');

1 row created.

SQL> INSERT INTO course VALUES (5, 'DBMS');

1 row created.

SQL> INSERT INTO faculty VALUES (1, 'Faculty1', 1, 11000, 'Block 1 Delhi', 9876543210, '1990-01-05', 3, 4);

1 row created.

SQL> INSERT INTO faculty VALUES (2, 'Faculty2', 1, 9000, 'Block 1 Sector 3 Delhi', 9876546330, '1992-10-15', 2, 2);

1 row created.

SQL> INSERT INTO faculty VALUES (3, 'Faculty3', 2, 12000, 'Block 2 Sector 1 Delhi', 8446546330, '1995-06-11', 0, 1);

1 row created.

SQL> INSERT INTO faculty VALUES (4, 'Faculty4', 2, 16000, 'Block 2 Sector 2 Delhi', 7925246330, '1990-08-11', 3,5);

1 row created.

SQL> INSERT INTO faculty VALUES (5, 'Faculty5', 3, 8000, 'Block 1 Sector 2 Delhi', 8435246362, '1993-11-21', 1,3);

1 row created.

SQL> INSERT INTO student VALUES (1, 'Student1', 2, 9876543212, '2004-01-05', 'Block 5 Delhi', 4);

1 row created.

SQL> INSERT INTO student VALUES (2, 'Student2', 3, 8765432167, '2002-10-25', 'Block 2 Sector 1 Delhi', 2);

1 row created.

SQL> INSERT INTO student VALUES (3, 'Student3', 2, 8765787655, '2002-05-11', 'Block 4 Sector 1 Delhi', 2);

1 row created.

SQL> INSERT INTO student VALUES (4, 'Student4', 4, 7898765456, '2004-07-19', 'Block 2 Sector 4 Delhi', 6);

1 row created.

SQL> INSERT INTO student VALUES (5, 'Student5', 1, NULL, '2004-02-29', 'Block 1 Sector 2 Delhi', 4);

1 row created.

SQL> INSERT INTO std_soc VALUES (1,2);

1 row created.

SQL> INSERT INTO std_soc VALUES (3,2);

1 row created.

SQL> INSERT INTO std_soc VALUES (4,1);

1 row created.

SQL> INSERT INTO std_soc VALUES (2,1);

1 row created.

SQL> INSERT INTO std_soc VALUES (2,4);

1 row created.

SQL> INSERT INTO fac_course VALUES (1,2);

1 row created.

SQL> INSERT INTO fac_course VALUES (2,2);

1 row created.

SQL> INSERT INTO fac_course VALUES (3,1);

1 row created.

SQL> INSERT INTO fac_course VALUES (4,4);

1 row created.

SQL> INSERT INTO fac_course VALUES (5,3);

1 row created.




SQL> SELECT * FROM faculty;

 FID NAME       DNO    SAL ADDRESS                       PHONE DOB         EXP NO_OF_AWARDS
---- --------- ---- ------ ------------------------ ---------- ---------- ---- ------------
   1 Faculty1     1  11000 Block 1 Delhi            9876543210 1990-01-05    3            4
   2 Faculty2     1   9000 Block 1 Sector 3 Delhi   9876546330 1992-10-15    2            2
   3 Faculty3     2  12000 Block 2 Sector 1 Delhi   8446546330 1995-06-11    0            1
   4 Faculty4     2  16000 Block 2 Sector 2 Delhi   7925246330 1990-08-11    3            5
   5 Faculty5     3   8000 Block 1 Sector 2 Delhi   8435246362 1993-11-21    1            3
SQL> SELECT * FROM dept;

 DNO DNAME       BUDGET
---- --------- --------
   1 CSE          10000
   2 AIDS         12000
   3 AIML          9000
   4 IIOT          8000
   5 VSLI          6000
SQL> SELECT * FROM student;

 SID NAME        DNO      PHONE DOB        ADDRESS                    SEM
---- ---------- ---- ---------- ---------- ------------------------ -----
   1 Student1      2 9876543212 2004-01-05 Block 5 Delhi                4
   2 Student2      3 8765432167 2002-10-25 Block 2 Sector 1 Delhi       2
   3 Student3      2 8765787655 2002-05-11 Block 4 Sector 1 Delhi       2
   4 Student4      4 7898765456 2004-07-19 Block 2 Sector 4 Delhi       6
   5 Student5      1            2004-02-29 Block 1 Sector 2 Delhi       4

SQL> SELECT * FROM society;

     SC_ID NAME
---------- --------------------
         1 Kalakriti
         2 Srijan
         3 EDC Cell
         4 NSS
         5 NCC

SQL> SELECT * FROM std_soc;

       SID      SC_ID
---------- ----------
         1          2
         3          2
         4          1
         2          1
         2          4

SQL> SELECT * FROM course;

       CID CNAME
---------- --------------------
         1 Computational Method
         2 Software Engineering
         3 Fundamentals of ML
         4 OOPs
         5 DBMS

SQL> SELECT * FROM fac_course;

       FID        CID
---------- ----------
         1          2
         2          2
         3          1
         4          4
         5          3

SQL> SELECT * FROM faculty WHERE exp > 1 AND sal > 10000;

 FID NAME       DNO    SAL ADDRESS                       PHONE DOB         EXP NO_OF_AWARDS
---- --------- ---- ------ ------------------------ ---------- ---------- ---- ------------
   1 Faculty1     1  11000 Block 1 Delhi            9876543210 1990-01-05    3            4
   4 Faculty4     2  16000 Block 2 Sector 2 Delhi   7925246330 1990-08-11    3            5

SQL> SELECT * FROM student WHERE dno = 2 OR sem = 4;

 SID NAME        DNO      PHONE DOB        ADDRESS                    SEM
---- ---------- ---- ---------- ---------- ------------------------- ----
   1 Student1      2 9876543212 2004-01-05 Block 5 Delhi                4
   3 Student3      2 8765787655 2002-05-11 Block 4 Sector 1 Delhi       2

SQL> -- Salary of faculties before updating:
SQL> SELECT name, sal FROM faculty WHERE dno = 1;

NAME                        SAL
-------------------- ----------
Faculty1                  11000
Faculty2                   9000
SQL> -- Increasing the salary by 2000 of faculties in department no. 1
SQL> UPDATE faculty
  2  SET sal = sal + 2000
  3  WHERE dno = 1;
SQL> -- Salary of faculties after updating:
SQL> SELECT name, sal FROM faculty WHERE dno = 1;

NAME                        SAL
-------------------- ----------
Faculty1                  13000
Faculty2                  11000

SQL> -- Budget of CSE department before updating:
SQL> SELECT dname, budget FROM dept WHERE dname = 'CSE';

DNAME                    BUDGET
-------------------- ----------
CSE                       10000
SQL> -- Increasing the budget by 1000 of CSE department:
SQL> UPDATE dept
  2  SET budget = budget + 1000
  3  WHERE dname = 'CSE';
SQL> -- budget of CSE department after updating:
SQL> SELECT dname, budget FROM dept WHERE dname = 'CSE';

DNAME                    BUDGET
-------------------- ----------
CSE                       11000
SQL> -- Phone no. of student with id no. 2 before updating:
SQL> SELECT sid, name, phone FROM student WHERE sid = 2;

       SID NAME                      PHONE
---------- -------------------- ----------
         2 Student2             8765432167
SQL> -- Updating the phone number:
SQL> UPDATE student
  2  SET phone = 7654568654
  3  WHERE sid = 2;
SQL> -- Phone no. of student with id no. 2 after updating:
SQL> SELECT sid, name, phone FROM student WHERE sid = 2;

       SID NAME                      PHONE
---------- -------------------- ----------
         2 Student2             7654568654

SQL> DELETE FROM society WHERE name = 'Kalakriti';
DELETE FROM society WHERE name = 'Kalakriti'
*
ERROR at line 1:
ORA-02292: integrity constraint (ROHIT.SYS_C008373) violated - child record found


SQL> SELECT * FROM society;

     SC_ID NAME
---------- --------------------
         1 Kalakriti
         2 Srijan
         3 EDC Cell
         4 NSS
         5 NCC
SQL> -- SQL doesnt allow deleting as Students are enrolled in the given society:
SQL> SELECT * FROM std_soc;

       SID      SC_ID
---------- ----------
         1          2
         3          2
         4          1
         2          1
         2          4

SQL> DELETE FROM student WHERE phone IS NULL;
SQL> SELECT * FROM student;

 SID NAME       DNO      PHONE DOB        ADDRESS                    SEM
---- --------- ---- ---------- ---------- ------------------------ -----
   1 Student1     2 9876543212 2004-01-05 Block 5 Delhi                4
   2 Student2     3 7654568654 2002-10-25 Block 2 Sector 1 Delhi       2
   3 Student3     2 8765787655 2002-05-11 Block 4 Sector 1 Delhi       2
   4 Student4     4 7898765456 2004-07-19 Block 2 Sector 4 Delhi       6
