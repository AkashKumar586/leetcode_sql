602. Friend Requests II: Who Has the Most Friends
Solved
Medium
Topics
premium lock icon
Companies
Hint
SQL Schema
Pandas Schema
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

602. Friend Requests II: Who Has the Most Friends
Solved
Medium
Topics
premium lock icon
Companies
Hint
SQL Schema
Pandas Schema
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

WITH friendCounts AS (
    SELECT id, COUNT(*) AS num
    FROM (
        SELECT requester_id AS id, accepter_id AS friend_id
        FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id, requester_id AS friend_id
        FROM RequestAccepted
    ) AS All_Friend
    GROUP BY id
)
SELECT id, num
FROM friendCounts
WHERE num = (SELECT MAX(num) FROM friendCounts);
