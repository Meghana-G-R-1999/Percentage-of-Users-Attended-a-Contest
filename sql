Create table Users(
user_id int primary key,
user_name);

Create table Register(
contest_id int,
user_id int,
CONSTRAINT R_Register primary key(contest_id, user_id) );

Insert into Users
Values(6, "Alice"),
(2,"Bob"),
(7,"Alex")

Insert into Register
values(215,6),
(209,2),
(208,2),
(210,6),
(208,6),
(209,7),
(209,6),
(215,7),
(208,7),
(210,2),
(207,2),
(210,7)

--Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

--Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

select r.contest_id, round((count(r.user_id)/(select count(user_id) from Users))*100 ,2) as percentage
from Users u
right join Register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc, r.contest_id
