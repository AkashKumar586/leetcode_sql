570. Managers with at Least 5 Direct Reports
Solved
Medium
Topics
premium lock icon
Companies
Hint
SQL Schema
Pandas Schema
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.


 SELECT e.name
FROM Employee e
JOIN(
SELECT managerID, 
COUNT(*)
FROM Employee
WHERE managerID IS NOT NULL
GROUP BY managerID
HAVING COUNT(*) >= 5
) m ON e.id = m.managerID;