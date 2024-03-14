SQL> CREATE TABLE faculty (
  2  f_id INT PRIMARY KEY,
  3  name VARCHAR(20),
  4  dob DATE,
  5  exp INT,
  6  no_of_awards INT,
  7  d_no INT,
  8  sal INT,
  9  address VARCHAR(30),
 10  phone INT);

Table created.

SQL> DESC faculty;
 Name              Null?    Type
 ----------------- -------- --------------
 F_ID              NOT NULL NUMBER(38)
 NAME                       VARCHAR2(20)
 DOB                        DATE
 EXP                        NUMBER(38)
 NO_OF_AWARDS               NUMBER(38)
 D_NO                       NUMBER(38)
 SAL                        NUMBER(38)
 ADDRESS                    VARCHAR2(30)
 PHONE                      NUMBER(38)

SQL> INSERT INTO faculty VALUES (1, 'fac1', '12-MAR-1992', 6, 3, 1, 60000, 'dwarka', 9876567871);
1 row created.

SQL> INSERT INTO faculty VALUES (2, 'fac2', '23-MAR-1995', 3, 2, 1, 50000, 'sector 1 delhi', 9327859812);
1 row created.

SQL> INSERT INTO faculty VALUES (3, 'fac3', '25-FEB-1990', 7, 5, 1, 65000, 'sector 2 delhi', 9327842812);
1 row created.

SQL> INSERT INTO faculty VALUES (4, 'fac4', '14-AUG-1997', 2, 2, 2, 40000, 'sector 1 delhi', 9352845312);
1 row created.

SQL> INSERT INTO faculty VALUES (5, 'fac5', '12-SEP-1996', 2, 1, 2, 35000, 'sector 4 delhi', 8562335415);
1 row created.

SQL> INSERT INTO faculty VALUES (6, 'fac6', '10-OCT-1989', 6, 3, 2, 60000, 'sector 2 delhi', 8542345215);
1 row created.

SQL> INSERT INTO faculty VALUES (7, 'fac7', '17-MAR-1992', 4, 2, 3, 25000, 'sector 1 delhi', 7923345235);
1 row created.

SQL> INSERT INTO faculty VALUES (8, 'fac8', '16-JAN-1994', 2, 1, 3, 28000, 'sector 4 delhi', 7923345433);
1 row created.

SQL> INSERT INTO faculty VALUES (9, 'fac9', '06-DEC-1990', 4, 2, 3, 24000, 'sector 3 delhi', 8564345733);
1 row created.

SQL> INSERT INTO faculty VALUES (10, 'fac10', '19-DEC-1990', 4, 4, 4, 87000, 'sector 2 delhi', 9939932231);
1 row created.

SQL> INSERT INTO faculty VALUES (11, 'fac11', '31-DEC-1991', 3, 1, 4, 85000, 'sector 5 delhi', 9559935535);
1 row created.

SQL> INSERT INTO faculty VALUES (12, 'fac12', '11-FEB-1989', 5, 3, 4, 90000, 'sector 1 delhi', 8845365535);
1 row created.

SQL> SELECT * FROM faculty;

 F_ID NAME   DOB        EXP NO_OF_AWARDS  D_NO    SAL ADDRESS              PHONE
----- ------ --------- ---- ------------ ----- ------ --------------- ----------
    1 fac1   12-MAR-92    6            3     1  60000 dwarka          9876567871
    2 fac2   23-MAR-95    3            2     1  50000 sector 1 delhi  9327859812
    3 fac3   25-FEB-90    7            5     1  65000 sector 2 delhi  9327842812
    4 fac4   14-AUG-97    2            2     2  40000 sector 1 delhi  9352845312
    5 fac5   12-SEP-96    2            1     2  35000 sector 4 delhi  8562335415
    6 fac6   10-OCT-89    6            3     2  60000 sector 2 delhi  8542345215
    7 fac7   17-MAR-92    4            2     3  25000 sector 1 delhi  7923345235
    8 fac8   16-JAN-94    2            1     3  28000 sector 4 delhi  7923345433
    9 fac9   06-DEC-90    4            2     3  24000 sector 3 delhi  8564345733
   10 fac10  19-DEC-90    4            4     4  87000 sector 2 delhi  9939932231
   11 fac11  31-DEC-91    3            1     4  85000 sector 5 delhi  9559935535
   12 fac12  11-FEB-89    5            3     4  90000 sector 1 delhi  8845365535

12 rows selected.


SQL> SELECT SUM(sal) FROM faculty;

  SUM(SAL)
----------
    649000

SQL> SELECT SUM(sal) FROM faculty WHERE d_no=1;

  SUM(SAL)
----------
    175000

SQL> SELECT AVG(sal), MIN(sal), MAX(sal) FROM FACULTY;

  AVG(SAL)   MIN(SAL)   MAX(SAL)
---------- ---------- ----------
54083.3333      24000      90000

SQL> SELECT AVG(sal), MIN(sal), MAX(sal) FROM faculty;

  AVG(SAL)   MIN(SAL)   MAX(SAL)
---------- ---------- ----------
54083.3333      24000      90000

SQL> SELECT AVG(sal), MIN(sal), MAX(sal) FROM faculty WHERE d_no=4;

  AVG(SAL)   MIN(SAL)   MAX(SAL)
---------- ---------- ----------
87333.3333      85000      90000

SQL> SELECT AVG(exp) FROM faculty WHERE d_no=1;

  AVG(EXP)
----------
5.33333333

SQL> SELECT COUNT(f_id) FROM faculty;

COUNT(F_ID)
-----------
         12

SQL> SELECT COUNT(f_id) FROM faculty WHERE d_no=2;

COUNT(F_ID)
-----------
          3

SQL>


SQL> SELECT ASCII(name) FROM faculty;

ASCII(NAME)
-----------
        102
        102
        102
        102
        102
        102
        102
        102
        102
        102
        102
        102

12 rows selected.

SQL> SELECT abs(sal) FROM faculty;

  ABS(SAL)
----------
     60000
     50000
     65000
     40000
     35000
     60000
     25000
     28000
     24000
     87000
     85000

  ABS(SAL)
----------
     90000

12 rows selected.

SQL> SELECT name || ' with ' || exp || ' years of experience, is in department ' || d_no AS faculty_info FROM faculty;

FACULTY_INFO
----------------------------------------------------------
fac1 with 6 years of experience, is in department 1
fac2 with 3 years of experience, is in department 1
fac3 with 7 years of experience, is in department 1
fac4 with 2 years of experience, is in department 2
fac5 with 2 years of experience, is in department 2
fac6 with 6 years of experience, is in department 2
fac7 with 4 years of experience, is in department 3
fac8 with 2 years of experience, is in department 3
fac9 with 4 years of experience, is in department 3
fac10 with 4 years of experience, is in department 4
fac11 with 3 years of experience, is in department 4
fac12 with 5 years of experience, is in department 4

12 rows selected.


SQL> SELECT SUBSTR(address, 1, 8) AS sector FROM faculty;

SECTOR
--------------------------------
dwarka
sector 1
sector 2
sector 1
sector 4
sector 2
sector 1
sector 4
sector 3
sector 2
sector 5
sector 1

12 rows selected.

SQL> SELECT TRIM(address) FROM faculty;

TRIM(ADDRESS)
------------------------------
dwarka
sector 1 delhi
sector 2 delhi
sector 1 delhi
sector 4 delhi
sector 2 delhi
sector 1 delhi
sector 4 delhi
sector 3 delhi
sector 2 delhi
sector 5 delhi
sector 1 delhi

12 rows selected.

SQL> SELECT UPPER(name) FROM faculty;

UPPER(NAME)
--------------------
FAC1
FAC2
FAC3
FAC4
FAC5
FAC6
FAC7
FAC8
FAC9
FAC10
FAC11
FAC12

12 rows selected.

SQL> SELECT LOWER(name) FROM faculty;

LOWER(NAME)
--------------------
fac1
fac2
fac3
fac4
fac5
fac6
fac7
fac8
fac9
fac10
fac11
fac12

12 rows selected.

SQL>


SQL> SELECT COS(exp) FROM faculty;

  COS(EXP)
----------
.960170287
 -.9899925
.753902254
-.41614684
-.41614684
.960170287
-.65364362
-.41614684
-.65364362
-.65364362
 -.9899925

  COS(EXP)
----------
.283662185

12 rows selected.


SQL> CREATE TABLE numbers ( num INT );

Table created.

SQL> INSERT INTO numbers (0);
INSERT INTO numbers (0)
                     *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> INSERT INTO numbers VALUES (0);

1 row created.

SQL> INSERT INTO numbers VALUES (1);

1 row created.

SQL> INSERT INTO numbers VALUES (2);

1 row created.

SQL> INSERT INTO numbers VALUES (3);

1 row created.

SQL> INSERT INTO numbers VALUES (4);

1 row created.

SQL> INSERT INTO numbers VALUES (5);

1 row created.

SQL> INSERT INTO numbers VALUES (6);

1 row created.

SQL> INSERT INTO numbers VALUES (7);

1 row created.

SQL> SELECT COS(num) FROM numbers;

  COS(NUM)
----------
         1
.540302306
-.41614684
 -.9899925
-.65364362
.283662185
.960170287
.753902254

8 rows selected.

SQL> SELECT SIN(num) FROM numbers;

  SIN(NUM)
----------
         0
.841470985
.909297427
.141120008
 -.7568025
-.95892427
 -.2794155
.656986599

8 rows selected.

SQL> SELECT TAN(num) FROM numbers;

  TAN(NUM)
----------
         0
1.55740772
-2.1850399
-.14254654
1.15782128
 -3.380515
-.29100619
.871447983

8 rows selected.



SQL> SELECT LOG(num, 2) FROM numbers WHERE num > 2;

LOG(NUM,2)
----------
.630929754
        .5
.430676558
.386852807
.356207187

SQL> SELECT POWER(num, 2) FROM numbers;

POWER(NUM,2)
------------
           0
           1
           4
           9
          16
          25
          36
          49

8 rows selected.

SQL> SELECT ROUND(num, -1) FROM numbers;

ROUND(NUM,-1)
-------------
            0
            0
            0
            0
            0
           10
           10
           10

8 rows selected.

SQL> SELECT FLOOR(num) FROM numbers;

FLOOR(NUM)
----------
         0
         1
         2
         3
         4
         5
         6
         7

8 rows selected.

SQL> SELECT CEIL(num) FROM numbers;

 CEIL(NUM)
----------
         0
         1
         2
         3
         4
         5
         6
         7

8 rows selected.

SQL> SELECT SQRT(num) FROM numbers;

 SQRT(NUM)
----------
         0
         1
1.41421356
1.73205081
         2
2.23606798
2.44948974
2.64575131

8 rows selected.

SQL>

SQL> SELECT SYSDATE FROM DUAL;

SYSDATE
---------
04-MAR-24



SQL> SELECT TO_DATE('2022-01-10', 'YYYY-MM-DD') FROM DUAL;

TO_DATE('
---------
10-JAN-22


SQL> SELECT MONTHS_BETWEEN('01-JAN-2022', '01-JAN-2021') FROM DUAL;

MONTHS_BETWEEN('01-JAN-2022','01-JAN-2021')
-------------------------------------------
                                         12

SQL> SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

ADD_MONTH
---------
04-JUN-24

SQL> SELECT LAST_DAY('01-JAN-2022') FROM DUAL;

LAST_DAY(
---------
31-JAN-22
