550. Game Play Analysis IV
Solved
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

WITH first_login AS(
    SELECT
    MIN(event_date) AS first_date,
    player_id
    FROM Activity 
    GROUP BY player_id
)
, Nextday_login AS (
    SELECT
    f.player_id
    FROM first_login f
    JOIN Activity a 
       ON f.player_id = a.player_id
    AND a.event_date = f.first_date + INTERVAL '1 day'
    GROUP BY f.player_id
)

SELECT 
    ROUND(CAST(COUNT(DISTINCT n.player_id) AS numeric) / CAST(COUNT(DISTINCT f.player_id) AS numeric), 2) AS fraction
FROM first_Login f
LEFT JOIN NextDay_login n
    ON f.player_id = n.player_id;