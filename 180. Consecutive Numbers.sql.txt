SQL Schema
Pandas Schema
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

-- Write your PostgreSQL query statement below

SELECT DISTINCT num AS ConsecutiveNums
FROM(

SELECT num,id,
LEAD(num,1) OVER(ORDER BY id) AS next_num1,
LEAD(num,2) OVER(ORDER BY id) AS next_num2
FROM Logs) 
WHERE num = next_num1 AND num = next_num2

