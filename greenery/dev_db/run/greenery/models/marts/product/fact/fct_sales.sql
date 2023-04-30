
  
    

        create or replace transient table dev_db.dbt_lukaszagohotmailcom.fct_sales  as
        (

WITH users AS (
    SELECT USER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL
    FROM dev_db.dbt_lukaszagohotmailcom.stg_users
),

st_products AS (
    SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    PRICE
    FROM dev_db.dbt_lukaszagohotmailcom.stg_products

),

orders AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.dim_orders
),

products AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.dim_products
), 
final AS (
    SELECT
    orders.ORDER_ID,
    orders.USER_ID,
    users.FIRST_NAME,
    users.LAST_NAME,
    users.EMAIL,
    orders.PRODUCT_ID,
    orders.ORDER_TOTAL,
    orders.CREATED_AT,
    orders.RUNNING_TOTAL_PER_ID,
    orders.RUNNING_TOTAL_PER_DATE,
    orders.QUANTITY,
    st_products.PRODUCT_NAME,
    st_products.PRICE,
    products.REVENUE
    FROM orders 
    LEFT JOIN users 
        ON orders.USER_ID = users.USER_ID
    LEFT JOIN st_products
        ON orders.PRODUCT_ID = st_products.PRODUCT_ID
    LEFT JOIN products 
        ON orders.ORDER_ID = products.ORDER_ID
        AND orders.PRODUCT_ID = products.PRODUCT_ID
)
SELECT * FROM final
        );
      
  