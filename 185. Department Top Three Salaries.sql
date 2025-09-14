185. Department Top Three Salaries
Solved
Hard
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
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.
 

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

-- Write your PostgreSQL query statement below

SELECT Department,Employee,Salary
FROM(
SELECT 
e.name AS Employee,
d.name AS Department,
e.salary AS Salary,
DENSE_RANK() OVER(Partition BY d.name ORDER BY e.salary DESC) AS rnk
FROM Employee e
JOIN Department d
ON 
e.departmentId = d.id
) WHERE rnk<=3;