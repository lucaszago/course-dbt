#### Project Questions

* How many users do we have?

**130 Users** 
```
SELECT COUNT(USER_ID) FROM USERS;
```
* On average, how many orders do we receive per hour?

**7.52 orders**

```
WITH CTE AS (
SELECT DATE_TRUNC(hour,CREATED_AT) AS HOURS
       ,COUNT(DISTINCT ORDER_ID) AS ORDERS_COUNT
FROM ORDERS 
GROUP BY 1    
)
SELECT ROUND(AVG(ORDERS_COUNT),2) AS AVG_ORDERS_RECEIVED
FROM CTE;
```

* On average, how long does an order take from being placed to being delivered?

**Average of: 3.89 days**

```
WITH CTE AS(
SELECT 
DATEDIFF(day,DATE_TRUNC(day,CREATED_AT),DATE_TRUNC(day,DELIVERED_AT)) AS COUNT_DAYS
FROM ORDERS)
SELECT ROUND(AVG(COUNT_DAYS),2)
FROM CTE;
```

* How many users have only made one purchase? Two purchases? Three+ purchases?

**1 purchase: 25**
**2 purchases: 28**
**>= 3 purchases: 71**

```
WITH CTE AS (SELECT USER_ID,
       COUNT(DISTINCT ORDER_ID) AS orders
FROM ORDERS
GROUP BY 1)
SELECT 
    COUNT(DISTINCT CASE WHEN orders=1 THEN user_id END) 
    ,COUNT(DISTINCT CASE WHEN orders=2 THEN user_id END) 
    ,COUNT(DISTINCT CASE WHEN orders>=3 THEN user_id END)
from cte```





Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

* On average, how many unique sessions do we have per hour?

**Unique sessions: 16.33**
```
WITH CTE AS (SELECT 
DATE_TRUNC(hour,CREATED_AT) AS hours,
COUNT(DISTINCT SESSION_ID) AS unique_sessions
FROM EVENTS
GROUP BY 1)
SELECT ROUND(AVG(unique_sessions),2)
FROM CTE;```
