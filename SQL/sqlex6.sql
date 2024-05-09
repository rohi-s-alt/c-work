
SQL> CREATE TABLE section (
  2  course_id VARCHAR(10),
  3  sec_id INT,
  4  semester VARCHAR(10),
  5  year INT,
  6  building VARCHAR(10),
  7  room_number INT,
  8  time_slot_id CHAR(1));

Table created.

SQL> INSERT INTO section VALUES ('BIO-101', 1, 'Summer', 2017, 'Painter', 514, 'B');
1 row created.

SQL> INSERT INTO section VALUES ('BIO-301', 1, 'Summer', 2018, 'Painter', 514, 'A');
1 row created.

SQL> INSERT INTO section VALUES ('CS-101', 1, 'Fall', 2017, 'Packard', 101, 'H');
1 row created.

SQL> INSERT INTO section VALUES ('CS-101', 1, 'Spring', 2018, 'Packard', 101, 'F');
1 row created.

SQL> INSERT INTO section VALUES ('CS-190', 1, 'Spring', 2017, 'Taylor', 3128, 'E');
1 row created.

SQL> INSERT INTO section VALUES ('CS-190', 2, 'Spring', 2017, 'Taylor', 3128, 'A');
1 row created.

SQL> INSERT INTO section VALUES ('CS-315', 1, 'Spring', 2018, 'Watson', 120, 'D');
1 row created.

SQL> INSERT INTO section VALUES ('CS-319', 1, 'Spring', 2018, 'Watson', 100, 'B');
1 row created.

SQL> INSERT INTO section VALUES ('CS-319', 2, 'Spring', 2018, 'Taylor', 3128, 'C');
1 row created.

SQL> INSERT INTO section VALUES ('CS-347', 1, 'Fall', 2017, 'Taylor', 3128, 'A');
1 row created.

SQL> INSERT INTO section VALUES ('EE-181', 1, 'Spring', 2017, 'Taylor', 3128, 'C');
1 row created.

SQL> INSERT INTO section VALUES ('FIN-201', 1, 'Spring', 2018, 'Packard', 101, 'B');
1 row created.

SQL> INSERT INTO section VALUES ('HIS-351', 1, 'Spring', 2018, 'Painter', 514, 'C');
1 row created.

SQL> INSERT INTO section VALUES ('MU-199', 1, 'Spring', 2018, 'Packard', 101, 'D');
1 row created.

SQL> INSERT INTO section VALUES ('PHY-101', 1, 'Fall', 2017, 'Watson', 100, 'A');
1 row created.

SQL> DESC section;
 Name                       Null?    Type
 -------------------------- -------- ---------------------
 COURSE_ID                           VARCHAR2(10)
 SEC_ID                              NUMBER(38)
 SEMESTER                            VARCHAR2(10)
 YEAR                                NUMBER(38)
 BUILDING                            VARCHAR2(10)
 ROOM_NUMBER                         NUMBER(38)
 TIME_SLOT_ID                        CHAR(1)

SQL> SELECT * FROM section;

COURSE_ID      SEC_ID SEMESTER         YEAR BUILDING   ROOM_NUMBER T
---------- ---------- ---------- ---------- ---------- ----------- -
BIO-101             1 Summer           2017 Painter            514 B
BIO-301             1 Summer           2018 Painter            514 A
CS-101              1 Fall             2017 Packard            101 H
CS-101              1 Spring           2018 Packard            101 F
CS-190              1 Spring           2017 Taylor            3128 E
CS-190              2 Spring           2017 Taylor            3128 A
CS-315              1 Spring           2018 Watson             120 D
CS-319              1 Spring           2018 Watson             100 B
CS-319              2 Spring           2018 Taylor            3128 C
CS-347              1 Fall             2017 Taylor            3128 A
EE-181              1 Spring           2017 Taylor            3128 C
FIN-201             1 Spring           2018 Packard            101 B
HIS-351             1 Spring           2018 Painter            514 C
MU-199              1 Spring           2018 Packard            101 D
PHY-101             1 Fall             2017 Watson             100 A

15 rows selected.

SQL>


SQL> SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017;

COURSE_ID
----------
CS-101
CS-347
PHY-101

SQL> SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018;

COURSE_ID
----------
CS-101
CS-315
CS-319
CS-319
FIN-201
HIS-351
MU-199

7 rows selected.


SQL> (SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017) UNION (SELECT course_id FROM section WHERE semester =
'Spring' AND year = 2018);

COURSE_ID
----------
CS-101
CS-347
PHY-101
CS-315
CS-319
FIN-201
HIS-351
MU-199

8 rows selected.


SQL> (SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017) INTERSECT (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018);

COURSE_ID
----------
CS-101

SQL> (SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017) MINUS
(SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018);

COURSE_ID
----------
CS-347
PHY-101

SQL> (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018) MINU
S (SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017);

COURSE_ID
----------
CS-315
CS-319
FIN-201
HIS-351
MU-199

SQL>



SQL> CREATE TABLE employees_dept1 (
  2  employee_id INT,
  3  employee_name VARCHAR(10),
  4  department VARCHAR(10));

Table created.

SQL> CREATE TABLE employees_dept2 (
  2  employee_id INT,
  3  employee_name VARCHAR(10),
  4  department VARCHAR(10));

Table created.

SQL> DESC employees_dept1;
 Name                              Null?    Type
 --------------------------------- -------- ------------------
 EMPLOYEE_ID                                NUMBER(38)
 EMPLOYEE_NAME                              VARCHAR2(10)
 DEPARTMENT                                 VARCHAR2(10)

SQL> DESC employees_dept2;
 Name                             Null?    Type
 -------------------------------- -------- ------------------
 EMPLOYEE_ID                               NUMBER(38)
 EMPLOYEE_NAME                             VARCHAR2(10)
 DEPARTMENT                                VARCHAR2(10)


SQL> INSERT INTO employees_dept1 VALUES (1, 'Alice', 'Finance');
1 row created.

SQL> INSERT INTO employees_dept1 VALUES (2, 'Bob', 'Finance');
1 row created.

SQL> INSERT INTO employees_dept1 VALUES (3, 'Charlie', 'Finance');
1 row created.

SQL> INSERT INTO employees_dept2 VALUES (4, 'David', 'HR');
1 row created.

SQL> INSERT INTO employees_dept2 VALUES (5, 'Emma', 'HR');
1 row created.

SQL> INSERT INTO employees_dept2 VALUES (6, 'Frank', 'HR');
1 row created.

SQL>

SQL> SELECT * from employees_dept1;

EMPLOYEE_ID EMPLOYEE_N DEPARTMENT
----------- ---------- ----------
          1 Alice      Finance
          2 Bob        Finance
          3 Charlie    Finance

SQL> SELECT * from employees_dept2;

EMPLOYEE_ID EMPLOYEE_N DEPARTMENT
----------- ---------- ----------
          4 David      HR
          5 Emma       HR
          6 Frank      HR

SQL>


SQL> SELECT * FROM employees_dept1
  2  UNION
  3  SELECT * FROM employees_dept2;

EMPLOYEE_ID EMPLOYEE_N DEPARTMENT
----------- ---------- ----------
          1 Alice      Finance
          2 Bob        Finance
          3 Charlie    Finance
          4 David      HR
          5 Emma       HR
          6 Frank      HR

6 rows selected.

SQL> SELECT * FROM employees_dept1
  2  UNION ALL
  3  SELECT * FROM employees_dept2;

EMPLOYEE_ID EMPLOYEE_N DEPARTMENT
----------- ---------- ----------
          1 Alice      Finance
          2 Bob        Finance
          3 Charlie    Finance
          4 David      HR
          5 Emma       HR
          6 Frank      HR

6 rows selected.

SQL> SELECT * FROM employees_dept1
  2  INTERSECT
  3  SELECT * FROM employees_dept2;

no rows selected

SQL> SELECT * FROM employees_dept1
  2  EXCEPT
  3  SELECT * FROM employees_dept2;

EMPLOYEE_ID EMPLOYEE_N DEPARTMENT
----------- ---------- ----------
          1 Alice      Finance
          2 Bob        Finance
          3 Charlie    Finance

SQL>