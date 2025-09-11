-- Problem: Combine Two Tables
-- Source: LeetCode
-- Description:
-- Given two tables, Person and Address, write a SQL query to combine them.
-- Each person should have their address listed.
-- If a person does not have an address, show NULL values.


-- Write your PostgreSQL query statement below

SELECT firstName,lastName,city,state
 FROM Person
LEFT OUTER JOIN Address
ON  Person.personId = Address.personID
