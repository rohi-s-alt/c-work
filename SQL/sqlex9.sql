
SQL> CREATE TABLE employee (
  2  empNo INT,
  3  name VARCHAR(15),
  4  salary INT,
  5  designation VARCHAR(15),
  6  deptID INT);

Table created.

SQL> DESC employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(38)
 NAME                                               VARCHAR2(15)
 SALARY                                             NUMBER(38)
 DESIGNATION                                        VARCHAR2(15)
 DEPTID                                             NUMBER(38)

SQL> INSERT INTO employee VALUES (1, 'abc', 10000, 'jr engineer', 101);

1 row created.

SQL> INSERT INTO employee VALUES (2, 'def', 12000, 'database engg', 120);

1 row created.

SQL> INSERT INTO employee VALUES (3, 'ghi', 9000, 'personal asst', 111);

1 row created.

SQL> INSERT INTO employee VALUES (4, 'jkl', 20000, 'sr engineer', 105);

1 row created.

SQL> INSERT INTO employee VALUES (5, 'mno', 24000, 'sr engineer', 105);

1 row created.

SQL> INSERT INTO employee VALUES (6, 'pqr', 13000, 'jr engineer', 101);

1 row created.

SQL> INSERT INTO employee VALUES (7, 'stu', 30000, 'manager', 002);

1 row created.

SQL> INSERT INTO employee VALUES (8, 'vwx', 5000, 'helper', 111);

1 row created.

SQL>


SQL> SELECT * FROM employee;

     EMPNO NAME                SALARY DESIGNATION         DEPTID
---------- --------------- ---------- --------------- ----------
         1 abc                  10000 jr engineer            101
         2 def                  12000 database engg          120
         3 ghi                   9000 personal asst          111
         4 jkl                  20000 sr engineer            105
         5 mno                  24000 sr engineer            105
         6 pqr                  13000 jr engineer            101
         7 stu                  30000 manager                  2
         8 vwx                   5000 helper                 111

8 rows selected.

SQL>





SQL> CREATE TABLE temp_new (
  2  salary INT,
  3  empNo INT,
  4  name VARCHAR(15)
  5  );

Table created.

SQL> DESC temp_new;
 Name                      Null?    Type
 ------------------------- -------- --------------------
 SALARY                             NUMBER(38)
 EMPNO                              NUMBER(38)
 NAME                               VARCHAR2(15)



SQL> DECLARE
  2  CURSOR c1 IS
  3  SELECT name, empNo, salary FROM employee
  4  ORDER BY salary DESC;
  5  my_ename employee.name%type;
  6  my_empno employee.empNo%type;
  7  my_sal employee.salary%type;
  8  BEGIN
  9  OPEN c1;
 10  FOR i IN 1..5 LOOP
 11  FETCH c1 INTO my_ename, my_empno, my_sal;
 12  EXIT WHEN c1%NOTFOUND;
 13  INSERT INTO temp_new VALUES (my_sal, my_empno, my_ename);
 14  COMMIT;
 15  END LOOP;
 16  CLOSE c1;
 17  END;
 18  /

PL/SQL procedure successfully completed.



SQL> SELECT * FROM temp_new;

    SALARY      EMPNO NAME
---------- ---------- ---------------
     30000          7 stu
     24000          5 mno
     20000          4 jkl
     13000          6 pqr
     12000          2 def

SQL>