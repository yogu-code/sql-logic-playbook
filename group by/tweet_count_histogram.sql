-- Tweet Count Histogram
-- problem : Find how many users posted each number of tweets during 2022.

-- explaintion :
-- What is a Histogram?
-- A histogram groups items by their count and shows how many items belong to each group.

-- Logic:
-- 1) Create a temporary table using a CTE (WITH) to count the total tweets posted by each user in 2022, along with their user_id.
-- 2) Group the temporary table by tweet_count and count the users in each group.
-- 3) The result shows how many users posted a particular number of tweets.


-- Solution : 
with tweet_bucket as (
  select count(tweet_id) as tweet_count , user_id
  from tweets
  where tweet_date > '2021-12-31' and tweet_date < '2023-01-01'
  GROUP BY user_id
)

select tweet_count , count(user_id) as users_num
from tweet_bucket
GROUP BY tweet_count