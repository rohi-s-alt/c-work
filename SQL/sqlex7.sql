
SQL> CREATE TABLE student (
  2  roll_no INT PRIMARY KEY,
  3  name VARCHAR(10) UNIQUE,
  4  address VARCHAR(10),
  5  phone INT,
  6  age INT NOT NULL);

Table created.

SQL> CREATE TABLE course (
  2  course_id INT PRIMARY KEY,
  3  c_name VARCHAR(5));

Table created.

SQL> CREATE TABLE studentcourse (
  2  course_id INT,
  3  roll_no INT);

Table created.

SQL> DESC student;
 Name                          Null?    Type
 ----------------------------- -------- --------------------
 ROLL_NO                       NOT NULL NUMBER(38)
 NAME                                   VARCHAR2(10)
 ADDRESS                                VARCHAR2(10)
 PHONE                                  NUMBER(38)
 AGE                           NOT NULL NUMBER(38)

SQL> DESC course;
 Name                          Null?    Type
 ----------------------------- -------- --------------------
 COURSE_ID                     NOT NULL NUMBER(38)
 C_NAME                                 VARCHAR2(5)

SQL> DESC studentcourse;
 Name                          Null?    Type
 ----------------------------- -------- -------------------
 COURSE_ID                              NUMBER(38)
 ROLL_NO                                NUMBER(38)

SQL> INSERT INTO student VALUES(1, 'Harsh', 'Delhi', 9876543210, 18);
1 row created.

SQL> INSERT INTO student VALUES(2, 'Pratik', 'Bihar', 9422543210, 19);
1 row created.

SQL> INSERT INTO student VALUES(3, 'Riyanka', 'Siliguri', 7568184452, 20);
1 row created.

SQL> INSERT INTO student VALUES(4, 'Deep', 'Ramnagar', 9273874628, 18);
1 row created.

SQL> INSERT INTO student VALUES(5, 'Saptarhi', 'Kolkata', 8368747729, 19);
1 row created.

SQL> INSERT INTO student VALUES(6, 'Dhanraj', 'Barabajar', 9687477234, 20);
1 row created.

SQL> INSERT INTO student VALUES(7, 'Rohit', 'Balurghat', 7988924429, 18);
1 row created.

SQL> INSERT INTO student VALUES(8, 'Niraj', 'Alipur', 9382098430, 19);
1 row created.

SQL> INSERT INTO course VALUES(1, 'AIML');
1 row created.

SQL> INSERT INTO course VALUES(2, 'AIDS');
1 row created.

SQL> INSERT INTO course VALUES(3, 'IIOT');
1 row created.

SQL> INSERT INTO course VALUES(4, 'CSE');
1 row created.

SQL> INSERT INTO course VALUES(5, 'IT');
1 row created.

SQL> INSERT INTO studentcourse VALUES(1,1);
1 row created.

SQL> INSERT INTO studentcourse VALUES(2,2);
1 row created.

SQL> INSERT INTO studentcourse VALUES(2,3);
1 row created.

SQL> INSERT INTO studentcourse VALUES(3,4);
1 row created.

SQL> INSERT INTO studentcourse VALUES(1,5);
1 row created.

SQL> INSERT INTO studentcourse VALUES(4,9);
1 row created.

SQL> INSERT INTO studentcourse VALUES(5,10);
1 row created.

SQL> INSERT INTO studentcourse VALUES(4,11);
1 row created.

SQL> SELECT * FROM student;

   ROLL_NO NAME       ADDRESS         PHONE        AGE
---------- ---------- ---------- ---------- ----------
         1 Harsh      Delhi      9876543210         18
         2 Pratik     Bihar      9422543210         19
         3 Riyanka    Siliguri   7568184452         20
         4 Deep       Ramnagar   9273874628         18
         5 Saptarhi   Kolkata    8368747729         19
         6 Dhanraj    Barabajar  9687477234         20
         7 Rohit      Balurghat  7988924429         18
         8 Niraj      Alipur     9382098430         19

8 rows selected.

SQL> SELECT * FROM course;

 COURSE_ID C_NAM
---------- -----
         1 AIML
         2 AIDS
         3 IIOT
         4 CSE
         5 IT

SQL> SELECT * FROM studentcourse;

 COURSE_ID    ROLL_NO
---------- ----------
         1          1
         2          2
         2          3
         3          4
         1          5
         4          9
         5         10
         4         11

8 rows selected.

SQL>


SQL> SELECT studentcourse.course_id, student.name, student.age FROM student INNER JOIN studentcourse ON student.roll_no = studentcourse.roll_no;

 COURSE_ID NAME              AGE
---------- ---------- ----------
         1 Harsh              18
         2 Pratik             19
         2 Riyanka            20
         3 Deep               18
         1 Saptarhi           19

SQL> SELECT student.name, studentcourse.course_id FROM student LEFT JOIN studentcourse ON studentcourse.
roll_no = student.roll_no;

NAME        COURSE_ID
---------- ----------
Harsh               1
Pratik              2
Riyanka             2
Deep                3
Saptarhi            1
Dhanraj
Rohit
Niraj

8 rows selected.

SQL> SELECT student.name, studentcourse.course_id FROM student RIGHT JOIN studentcourse ON studentcourse
.roll_no = student.roll_no;

NAME        COURSE_ID
---------- ----------
Harsh               1
Pratik              2
Riyanka             2
Deep                3
Saptarhi            1
                    4
                    5
                    4

8 rows selected.

SQL> SELECT student.name, studentcourse.course_id FROM student FULL JOIN studentcourse ON studentcourse.
roll_no = student.roll_no;

NAME        COURSE_ID
---------- ----------
Harsh               1
Pratik              2
Riyanka             2
Deep                3
Saptarhi            1
                    4
                    5
                    4
Dhanraj
Rohit
Niraj

11 rows selected.


SQL> SELECT a.name, a.address FROM student a, studentcourse b WHERE a.roll_no = b.roll_no AND b.course_i
d = 3;

NAME       ADDRESS
---------- ----------
Deep       Ramnagar



SQL> SELECT a.name, a.phone FROM student a, studentcourse b WHERE a.roll_no = b.roll_no AND b.course_id = 2 AND a.age = 20;

NAME            PHONE
---------- ----------
Riyanka    7568184452


SQL> SELECT s.name, s.age, c.course_id, c.c_name FROM student s, studentcourse sc, course c WHERE s.r
oll_no = sc.roll_no AND sc.course_id = c.course_id;

NAME              AGE  COURSE_ID C_NAM
---------- ---------- ---------- -----
Harsh              18          1 AIML
Pratik             19          2 AIDS
Riyanka            20          2 AIDS
Deep               18          3 IIOT
Saptarhi           19          1 AIML

SQL>


SQL> SELECT s.name, s.age, c.course_id, c.c_name FROM student s, studentcourse sc, course c where s.r
oll_no = sc.roll_no AND sc.course_id = c.course_id AND c.c_name = 'AIDS';

NAME              AGE  COURSE_ID C_NAM
---------- ---------- ---------- -----
Pratik             19          2 AIDS
Riyanka            20          2 AIDS

SQL>

