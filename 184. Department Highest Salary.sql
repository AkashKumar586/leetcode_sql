184. Department Highest Salary
Solved
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

-- Write your PostgreSQL query statement below

SELECT Department, Employee,salary 
FROM(
SELECT 
d.name As Department,
e.name AS Employee,
e.salary AS salary,
DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY e.salary desc) AS rnk
FROM Employee e
JOIN Department d
ON e.departmentid = d.id
) WHERE rnk = 1;
