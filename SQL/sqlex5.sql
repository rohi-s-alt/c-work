
SQL> CREATE TABLE dept (
  2  dno INT NOT NULL PRIMARY KEY,
  3  dname VARCHAR(5),
  4  budget INT);
Table created.

SQL> CREATE TABLE faculty (
  2  fid INT NOT NULL PRIMARY KEY,
  3  name VARCHAR(10),
  4  dno INT,
  5  sal INT,
  6  address VARCHAR(15),
  7  phone INT,
  8  dob DATE,
  9  exp INT,
 10  FOREIGN KEY (dno) REFERENCES dept(dno));
Table created.

SQL> DESC dept;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(38)
 DNAME                                              VARCHAR2(5)
 BUDGET                                             NUMBER(38)

SQL> DESC faculty;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FID                                       NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(10)
 DNO                                                NUMBER(38)
 SAL                                                NUMBER(38)
 ADDRESS                                            VARCHAR2(15)
 PHONE                                              NUMBER(38)
 DOB                                                DATE
 EXP                                                NUMBER(38)

SQL> INSERT INTO dept VALUES (10, 'AIML', 5000);
1 row created.

SQL> INSERT INTO dept VALUES (20, 'AIDS', 7000);
1 row created.

SQL> INSERT INTO dept VALUES (30, 'IIOT', 8000);
1 row created.

SQL> INSERT INTO dept VALUES (40, 'CSE', 9000);
1 row created.

SQL> INSERT INTO dept VALUES (50, 'IT', 12000);
1 row created.

SQL> INSERT INTO faculty VALUES (1, 'Puneet', 10, 5000, 'Paschim Vihar', 9988203942, '01-mar-85', 14);
1 row created.

SQL> INSERT INTO faculty VALUES (2, 'Ashish', 10, 5000, 'Tilak Nagar', 9648203942, '07-nov-85', 13);
1 row created.

SQL> INSERT INTO faculty VALUES (3, 'Ishleen', 20, 6000, 'Rajouri', 889203942, '08-dec-85', 5);
1 row created.

SQL> INSERT INTO faculty VALUES (4, 'Sonakshi', 30, 2000, 'Pitampura', NULL, '23-jun-85', 8);
1 row created.

SQL> INSERT INTO faculty VALUES (5, 'Suman', 20, 1500, 'ITO', 778203532, '19-apr-85', 19);
1 row created.

SQL> INSERT INTO faculty VALUES (6, 'Gopal', 40, 9000, 'Vikas Puri', 9013203216, '10-mar-85', 12);
1 row created.

SQL> INSERT INTO faculty VALUES (7, 'Archa', 40, 6000, 'Hari Nagar', NULL, '07-mar-85', 9);
1 row created.

SQL> SELECT * FROM dept;

       DNO DNAME     BUDGET
---------- ----- ----------
        10 AIML        5000
        20 AIDS        7000
        30 IIOT        8000
        40 CSE         9000
        50 IT         12000

SQL> SELECT * FROM faculty;

 FID NAME        DNO   SAL ADDRESS              PHONE DOB        EXP
---- ---------- ---- ----- --------------- ---------- --------- ----
   1 Puneet       10  5000 Paschim Vihar   9988203942 01-MAR-85   14
   2 Ashish       10  5000 Tilak Nagar     9648203942 07-NOV-85   13
   3 Ishleen      20  6000 Rajouri          889203942 08-DEC-85    5
   4 Sonakshi     30  2000 Pitampura                  23-JUN-85    8
   5 Suman        20  1500 ITO              778203532 19-APR-85   19
   6 Gopal        40  9000 Vikas Puri      9013203216 10-MAR-85   12
   7 Archa        40  6000 Hari Nagar                 07-MAR-85    9

7 rows selected.

SQL>


SQL> SELECT fid, name, sal FROM faculty ORDER BY sal ASC;

       FID NAME              SAL
---------- ---------- ----------
         5 Suman            1500
         4 Sonakshi         2000
         1 Puneet           5000
         2 Ashish           5000
         3 Ishleen          6000
         7 Archa            6000
         6 Gopal            9000

7 rows selected.

SQL> SELECT fid, name, sal FROM faculty ORDER BY exp DESC;

       FID NAME              SAL
---------- ---------- ----------
         5 Suman            1500
         1 Puneet           5000
         2 Ashish           5000
         6 Gopal            9000
         7 Archa            6000
         4 Sonakshi         2000
         3 Ishleen          6000

7 rows selected.

SQL> SELECT fid, name, sal FROM faculty ORDER BY sal ASC, exp DESC;

       FID NAME              SAL
---------- ---------- ----------
         5 Suman            1500
         4 Sonakshi         2000
         1 Puneet           5000
         2 Ashish           5000
         7 Archa            6000
         3 Ishleen          6000
         6 Gopal            9000

7 rows selected.

SQL> SELECT dno, AVG(exp) FROM faculty GROUP BY dno;

       DNO   AVG(EXP)
---------- ----------
        10       13.5
        20         12
        30          8
        40       10.5

SQL> SELECT dno, MAX(exp) FROM faculty GROUP BY dno;

       DNO   MAX(EXP)
---------- ----------
        10         14
        20         19
        30          8
        40         12

SQL> SELECT dno, AVG(sal) FROM faculty HAVING AVG(sal)>5000 GROUP BY dno;

       DNO   AVG(SAL)
---------- ----------
        40       7500

SQL>


SQL> SELECT * FROM faculty WHERE LOWER(name) LIKE LOWER('s%');

 FID NAME        DNO   SAL ADDRESS         PHONE DOB        EXP
---- ---------- ---- ----- ---------- ---------- --------- ----
   4 Sonakshi     30  2000 Pitampura             23-JUN-85    8
   5 Suman        20  1500 ITO         778203532 19-APR-85   19

SQL> SELECT * FROM faculty WHERE LOWER(name) LIKE LOWER('%n');

 FID NAME      DNO   SAL ADDRESS        PHONE DOB         EXP
---- -------- ---- ----- --------- ---------- --------- -----
   3 Ishleen    20  6000 Rajouri    889203942 08-DEC-85     5
   5 Suman      20  1500 ITO        778203532 19-APR-85    19

SQL> SELECT * FROM faculty WHERE LOWER(name) LIKE LOWER('a%h');

 FID NAME       DNO    SAL ADDRESS           PHONE DOB        EXP
---- -------- ----- ------ ------------ ---------- --------- ----
   2 Ashish      10   5000 Tilak Nagar  9648203942 07-NOV-85   13

SQL> SELECT * FROM faculty WHERE LOWER(name) LIKE LOWER('%a%');

 FID NAME        DNO   SAL ADDRESS            PHONE DOB        EXP
---- ---------- ---- ----- ------------- ---------- --------- ----
   2 Ashish       10  5000 Tilak Nagar   9648203942 07-NOV-85   13
   4 Sonakshi     30  2000 Pitampura                23-JUN-85    8
   5 Suman        20  1500 ITO            778203532 19-APR-85   19
   6 Gopal        40  9000 Vikas Puri    9013203216 10-MAR-85   12
   7 Archa        40  6000 Hari Nagar               07-MAR-85    9

SQL> SELECT * FROM faculty WHERE LOWER(name) LIKE LOWER('g____');

 FID NAME    DNO   SAL ADDRESS          PHONE DOB        EXP
---- ------ ---- ----- ----------- ---------- --------- ----
   6 Gopal    40  9000 Vikas Puri  9013203216 10-MAR-85   12

SQL>

SQL> SELECT name, dno FROM faculty WHERE dno<ANY (SELECT dno FROM dept WHERE budget<10000);

NAME              DNO
---------- ----------
Puneet             10
Ashish             10
Ishleen            20
Suman              20
Sonakshi           30

SQL> SELECT name, dno FROM faculty WHERE dno>ALL (SELECT dno FROM dept WHERE budget<8000);

NAME              DNO
---------- ----------
Sonakshi           30
Gopal              40
Archa              40

SQL>


SQL> SELECT name, dno FROM faculty WHERE EXISTS ( SELECT dno FROM dept WHERE faculty.dno=dept.dno AND budget>7000);

NAME              DNO
---------- ----------
Sonakshi           30
Gopal              40
Archa              40

SQL> SELECT name, dno FROM faculty WHERE NOT EXISTS ( SELECT dno FROM dept WHERE faculty.dno=dept.dno AND budget<7000);

NAME              DNO
---------- ----------
Gopal              40
Archa              40
Sonakshi           30
Ishleen            20
Suman              20

SQL>


SQL> SELECT name FROM faculty WHERE dno = (SELECT dno FROM dept WHERE dname = 'AIML');

NAME
----------
Puneet
Ashish

SQL>