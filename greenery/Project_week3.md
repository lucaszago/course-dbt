What is our overall conversion rate?
Conversion rate is defined as the # of unique sessions with a purchase event / total number of unique sessions.

* Answer: 62.4567

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

Query: 
```
WITH p_event AS (
SELECT 
PRODUCT_NAME,
PRODUCT_ID,
COUNT(DISTINCT SESSION_ID) OVER (PARTITION BY PRODUCT_NAME, PRODUCT_ID) AS purchase_event
FROM fct_page_views
WHERE ADD_TO_CARTS > 0 OR checkouts > 0),
page_view AS (
SELECT
PRODUCT_ID,
COUNT(DISTINCT SESSION_ID) viewed
FROM STG_EVENTS
WHERE EVENT_TYPE = 'page_view'
GROUP BY PRODUCT_ID), 
final AS (
SELECT 
p_event.PRODUCT_ID,
p_event.PRODUCT_NAME,
p_event.purchase_event/viewed * 100 AS con_rate_by_product
FROM p_event
LEFT JOIN page_view
ON p_event.PRODUCT_ID = page_view.PRODUCT_ID
GROUP BY 1,2,3
)
SELECT * FROM final 
```