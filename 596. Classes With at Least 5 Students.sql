596. Classes With at Least 5 Students
Easy
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.

-- Write your PostgreSQL query statement below
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;