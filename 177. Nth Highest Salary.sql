Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

-- Write your PostgreSQL query statement below

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
   SELECT a.salary
   FROM(
   SELECT e.salary,
   DENSE_RANK() OVER(ORDER BY e.salary DESC) AS re
    FROM Employee AS e) AS a
    WHERE a.re = N
    LIMIT 1
    
  );
END;
$$ LANGUAGE plpgsql;