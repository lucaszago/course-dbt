

with orders AS (
    SELECT *
    FROM dev_db.dbt_lukaszagohotmailcom.stg_orders
),

date_cast AS (
    SELECT ORDER_ID, 
           USER_ID,
           ORDER_TOTAL,
           CAST(CREATED_AT AS DATE) AS CREATED_AT
           FROM orders
), 
running_total AS (
    SELECT ORDER_ID,
       USER_ID,
       ORDER_TOTAL,
       CREATED_AT,
       SUM(ORDER_TOTAL) OVER (PARTITION BY USER_ID ) AS running_total_per_id,
       SUM(ORDER_TOTAL) OVER (PARTITION BY CREATED_AT) AS running_total_per_date
FROM date_cast
ORDER BY 4)
SELECT * FROM running_total