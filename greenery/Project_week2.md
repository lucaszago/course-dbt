### PROJECT QUESTIONS 
- What is our user repeat rate?
- 0.798387
Query:
WITH CTE AS (
SELECT USER_ID,
COUNT(DISTINCT ORDER_ID) AS cnt_orders
FROM STG_ORDERS
GROUP BY 1
)
,USER_BUCKET AS (
SELECT USER_ID,
(cnt_orders >= 2)::int AS has_two_plus_purchases
FROM CTE)
SELECT 
 COUNT(DISTINCT USER_ID) AS num_user_w_purchase,
 SUM(has_two_plus_purchases) AS two_plus_purchases,
 div0(two_plus_purchases,num_user_w_purchase) AS repeat_user_rate
 FROM USER_BUCKET;

 - What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?