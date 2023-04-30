What is our overall conversion rate?
Conversion rate is defined as the # of unique sessions with a purchase event / total number of unique sessions.
Answer: 62.4567

Query: 
```
WITH total_unique_sessions AS (
SELECT COUNT(DISTINCT SESSION_ID) un_sessions
FROM STG_EVENTS
),
unique_sessions_purchase AS
(
SELECT COUNT(DISTINCT SESSION_ID) AS un_purchase
FROM fct_page_views
WHERE checkouts = 1 )
SELECT unique_sessions_purchase.un_purchase / total_unique_sessions.un_sessions * 100 AS convertion_rate 
FROM unique_sessions_purchase
CROSS JOIN total_unique_sessions
```

What is our conversion rate by product?
Conversion rate by product is defined as the # of unique sessions with a purchase event of that product / total number of unique sessions that viewed that product