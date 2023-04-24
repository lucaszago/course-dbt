
  
    

        create or replace transient table dev_db.dbt_lukaszagohotmailcom.dim_orders  as
        (
 with orders_agg AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.int_orders_agg
 ),
 order_items AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.stg_order_items
 )

 SELECT 
    orders_agg.ORDER_ID,
    orders_agg.USER_ID,
    orders_agg.ORDER_TOTAL,
    orders_agg.CREATED_AT, 
    orders_agg.RUNNING_TOTAL_PER_ID,
    orders_agg.RUNNING_TOTAL_PER_DATE,
    order_items.PRODUCT_ID, 
    order_items.QUANTITY
FROM orders_agg 
LEFT JOIN order_items 
    ON orders_agg.ORDER_ID = order_items.ORDER_ID
        );
      
  