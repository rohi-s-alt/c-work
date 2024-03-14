SQL> CREATE TABLE employee (
  2  s_no INT,
  3  name CHAR(30),
  4  designation CHAR(30),
  5  branch CHAR(30) );
Table created.

SQL> DESC employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 S_NO                                               NUMBER(38)
 NAME                                               CHAR(30)
 DESIGNATION                                        CHAR(30)
 BRANCH                                             CHAR(30)

SQL> CREATE TABLE emp AS SELECT * FROM employee;
Table created.

SQL> DESC emp;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 S_NO                                               NUMBER(38)
 NAME                                               CHAR(30)
 DESIGNATION                                        CHAR(30)
 BRANCH                                             CHAR(30)


SQL> DROP TABLE emp;
Table dropped.

SQL> DESC emp;
ERROR:
ORA-04043: object emp does not exist


SQL> ALTER TABLE employee ADD salary INT;
Table altered.

SQL> DESC employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 S_NO                                               NUMBER(38)
 NAME                                               CHAR(30)
 DESIGNATION                                        CHAR(30)
 BRANCH                                             CHAR(30)
 SALARY                                             NUMBER(38)

SQL> ALTER TABLE employee RENAME COLUMN branch TO branch_city;
Table altered.

SQL> DESC employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 S_NO                                               NUMBER(38)
 NAME                                               CHAR(30)
 DESIGNATION                                        CHAR(30)
 BRANCH_CITY                                        CHAR(30)
 SALARY                                             NUMBER(38)


SQL> SELECT * FROM employee;
  S_NO NAME              DESIGNATION          BRANCH_CITY
------ ----------------- -------------------- --------------------
     1 ABC               Manager              Chennai
     2 ABD               Designmer            Chennai
     3 BCG               Analyst              Delhi
     4 HEF               Assistant            Delhi
     5 GHI               Supervisor           Madurai

SQL> TRUNCATE TABLE employee;
Table truncated.

SQL> SELECT * FROM employee;
no rows selected




SQL> INSERT INTO employee VALUES(1, 'ABC', 'Manager', 'Chennai');
1 row created.

SQL> INSERT INTO employee VALUES(2, 'ABD', 'Designmer', 'Chennai');
1 row created.

SQL> INSERT INTO employee VALUES(3, 'BCG', 'Analyst', 'Delhi');
1 row created.

SQL> INSERT INTO employee VALUES(4, 'HEF', 'Assistant', 'Delhi');
1 row created.

SQL> INSERT INTO employee VALUES(5, 'GHI', 'Supervisor', 'Madurai');
1 row created.

SQL> SELECT * FROM employee;
  S_NO NAME              DESIGNATION          BRANCH_CITY
------ ----------------- -------------------- --------------------
     1 ABC               Manager              Chennai
     2 ABD               Designmer            Chennai
     3 BCG               Analyst              Delhi
     4 HEF               Assistant            Delhi
     5 GHI               Supervisor           Madurai

SQL> UPDATE employee
  2  SET designation = 'Senior Manager'
  3  WHERE s_no = 1;
1 row updated.

SQL> SELECT * FROM employee;
  S_NO NAME              DESIGNATION          BRANCH_CITY
------ ----------------- -------------------- --------------------
     1 ABC               Senior Manager       Chennai
     2 ABD               Designmer            Chennai
     3 BCG               Analyst              Delhi
     4 HEF               Assistant            Delhi
     5 GHI               Supervisor           Madurai


SQL> DELETE FROM employee WHERE name = 'ABD';
1 row deleted.

SQL> SELECT * FROM employee;
  S_NO NAME              DESIGNATION          BRANCH_CITY
------ ----------------- -------------------- --------------------
     1 ABC               Senior Manager       Chennai
     3 BCG               Analyst              Delhi
     4 HEF               Assistant            Delhi
     5 GHI               Supervisor           Madurai

SQL> SELECT s_no, name, designation FROM EMPLOYEE;
  S_NO NAME              DESIGNATION
------ ----------------- --------------------
     1 ABC               Senior Manager
     3 BCG               Analyst
     4 HEF               Assistant
     5 GHI               Supervisor