
SQL> CREATE TABLE temp (
  2  num_col1 INT,
  3  num_col2 INT,
  4  char_col VARCHAR(25)
  5  );
Table created.

SQL> DESC temp;
 Name                Null?    Type
 ------------------- -------- ----------------
 NUM_COL1                     NUMBER(38)
 NUM_COL2                     NUMBER(38)
 CHAR_COL                     VARCHAR2(25)

SQL> DECLARE
  2  x NUMBER := 100;
  3  BEGIN
  4  FOR i IN 1..10 LOOP
  5  IF MOD(i,2) = 0 THEN -- i is even
  6  INSERT INTO temp VALUES (i, x, 'i is even');
  7  ELSE
  8  INSERT INTO temp VALUES (i, x, 'i is odd');
  9  END IF;
 10  x := x + 100;
 11  END LOOP;
 12  COMMIT;
 13  END;
 14  /

PL/SQL procedure successfully completed.

SQL> SELECT * FROM temp ORDER BY num_col1;

  NUM_COL1   NUM_COL2 CHAR_COL
---------- ---------- ----------------
         1        100 i is odd
         2        200 i is even
         3        300 i is odd
         4        400 i is even
         5        500 i is odd
         6        600 i is even
         7        700 i is odd
         8        800 i is even
         9        900 i is odd
        10       1000 i is even

10 rows selected.

SQL>