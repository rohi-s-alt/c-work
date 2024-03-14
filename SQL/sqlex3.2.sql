SQL> CREATE TABLE acc (
  2  acc_no INT NOT NULL,
  3  name VARCHAR(20) NOT NULL,
  4  phone INT,
  5  PRIMARY KEY(acc_no));

Table created.

SQL> CREATE TABLE trans (
  2  acc_no INT NOT NULL,
  3  c_d CHAR(1) CHECK ( c_d='C' OR c_d='D'),
  4  amount INT,
  5  FOREIGN KEY (acc_no) REFRENCES acc(acc_no));
FOREIGN KEY (acc_no) REFRENCES acc(acc_no))
                     *
ERROR at line 5:
ORA-00905: missing keyword


SQL> CREATE TABLE trans (
  2  acc_no INT NOT NULL,
  3  c_d CHAR(1) CHECK ( c_d='C' OR c_d='D'),
  4  amount INT,
  5  FOREIGN KEY (acc_no) REFERENCES acc(acc_no));

Table created.

SQL> CREATE TABLE loan (
  2  acc_no INT NOT NULL,
  3  interest FLOAT,
  4  time INT,
  5  type VARCHAR(20));

Table created.

SQL> DROP TABLE loan;

Table dropped.

SQL> CREATE TABLE loan (
  2  acc_no INT NOT NULL,
  3  interest FLOAT,
  4  time INT,
  5  type VARCHAR(20),
  6  FOREIGN KEY (acc_no) REFERENCES acc(acc_no));

Table created.

SQL> CREATE TABLE fd (
  2  acc_no INT NOT NULL,
  3  amount INT,
  4  interest FLOAT,
  5  time INT,
  6  FOREIGN KEY (acc_no) REFERENCES acc(acc_no));

Table created.

SQL> CREATE TABLE locker (
  2  acc_no INT NOT NULL,
  3  l_no INT,
  4  FOREIGN KEY (acc_no) REFERENCES acc(acc_no));

Table created.

SQL> DESC acc;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 NAME                                      NOT NULL VARCHAR2(20)
 PHONE                                              NUMBER(38)

SQL> DESC trans;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 C_D                                                CHAR(1)
 AMOUNT                                             NUMBER(38)

SQL> DESC loan;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 INTEREST                                           FLOAT(126)
 TIME                                               NUMBER(38)
 TYPE                                               VARCHAR2(20)

SQL> DESC fd;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 AMOUNT                                             NUMBER(38)
 INTEREST                                           FLOAT(126)
 TIME                                               NUMBER(38)

SQL> DESC locker;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 L_NO                                               NUMBER(38)

SQL> INSERT INTO acc VALUES (1, name1, 9876543223);
INSERT INTO acc VALUES (1, name1, 9876543223)
                           *
ERROR at line 1:
ORA-00984: column not allowed here


SQL> INSERT INTO acc VALUES (1, 'name1', 9876543223);
1 row created.

SQL> INSERT INTO acc VALUES (2, 'name2', 8362543223);
1 row created.

SQL> INSERT INTO acc VALUES (3, 'name3', 7834243647);
1 row created.

SQL> INSERT INTO acc VALUES (4, 'name4', 9544435647);
1 row created.

SQL> INSERT INTO acc VALUES (5, 'name5', 7989239878);
1 row created.

SQL> INSERT INTO trans VALUES (2, 'C', 2000);
1 row created.

SQL> INSERT INTO trans VALUES (5, 'D', 100);
1 row created.

SQL> INSERT INTO trans VALUES (2, 'C', 8000);
1 row created.

SQL> INSERT INTO trans VALUES (3, 'D', 1500);
1 row created.

SQL> INSERT INTO trans VALUES (2, 'D', 10000);
1 row created.

SQL> INSERT INTO trans VALUES (1, 'C', 400);
1 row created.

SQL> INSERT INTO trans VALUES (1, 'C', 3000);
1 row created.

SQL> INSERT INTO trans VALUES (4, 'D', 55000);
1 row created.

SQL> INSERT INTO loan VALUES (4, 3.5, 18, 'education');
1 row created.

SQL> INSERT INTO loan VALUES (2, 10.0, 120, 'personal');
1 row created.

SQL> INSERT INTO loan VALUES (3, 6.5, 36, 'car');
1 row created.

SQL> INSERT INTO fd VALUES (1, 10000, 6.5, 36);
1 row created.

SQL> INSERT INTO fd VALUES (2, 12000, 7.5, 30);
1 row created.

SQL> INSERT INTO fd VALUES (5, 20000, 7.5, 48);
1 row created.

SQL> INSERT INTO locker (1, 101);
INSERT INTO locker (1, 101)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> INSERT INTO locker VALUES (1, 101);
1 row created.

SQL> INSERT INTO locker VALUES (2, 102);
1 row created.

SQL> INSERT INTO locker VALUES (4, 203);
1 row created.

SQL> INSERT INTO locker VALUES (5, 201);
1 row created.

SQL> INSERT INTO acc VALUES (6, 'name6', NULL);
1 row created.

SQL> SELECT * FROM acc;

    ACC_NO NAME                      PHONE
---------- -------------------- ----------
         1 name1                9876543223
         2 name2                8362543223
         3 name3                7834243647
         4 name4                9544435647
         5 name5                7989239878
         6 name6

6 rows selected.

SQL> SELECT * FROM trans;

    ACC_NO C     AMOUNT
---------- - ----------
         2 C       2000
         5 D        100
         2 C       8000
         3 D       1500
         2 D      10000
         1 C        400
         1 C       3000
         4 D      55000

8 rows selected.

SQL> SELECT * FROM loan;

    ACC_NO   INTEREST       TIME TYPE
---------- ---------- ---------- --------------------
         4        3.5         18 education
         2         10        120 personal
         3        6.5         36 car

SQL> SELECT * FROM fd;

    ACC_NO     AMOUNT   INTEREST       TIME
---------- ---------- ---------- ----------
         1      10000        6.5         36
         2      12000        7.5         30
         5      20000        7.5         48

SQL> SELECT * FROM locker;

    ACC_NO       L_NO
---------- ----------
         1        101
         2        102
         4        203
         5        201

SQL> ALTER TABLE loan ADD loan_no INT;

Table altered.

SQL> DESC loan;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ACC_NO                                    NOT NULL NUMBER(38)
 INTEREST                                           FLOAT(126)
 TIME                                               NUMBER(38)
 TYPE                                               VARCHAR2(20)
 LOAN_NO                                            NUMBER(38)

SQL> UPDATE loan
  2  SET loan_no = 1
  3  WHERE acc_no = 4;

1 row updated.

SQL> UPDATE loan
  2  SET loan_no = 2
  3  WHERE acc_no = 2;

1 row updated.

SQL> UPDATE loan
  2  SET loan_no = 3
  3  WHERE acc_no = 3;

1 row updated.

SQL> SELECT * FROM loan;

    ACC_NO   INTEREST       TIME TYPE                    LOAN_NO
---------- ---------- ---------- -------------------- ----------
         4        3.5         18 education                     1
         2         10        120 personal                      2
         3        6.5         36 car                           3

SQL> DELETE FROM acc WHERE phone IS NULL;

1 row deleted.

SQL> SELECT * FROM acc;

    ACC_NO NAME                      PHONE
---------- -------------------- ----------
         1 name1                9876543223
         2 name2                8362543223
         3 name3                7834243647
         4 name4                9544435647
         5 name5                7989239878




 

