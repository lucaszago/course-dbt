
  
    

        create or replace transient table dev_db.dbt_lukaszagohotmailcom.dim_products  as
        (
WITH order_items AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.stg_order_items
),
int_prod AS (SELECT
* 
FROM dev_db.dbt_lukaszagohotmailcom.int_products_agg
),
final AS (
SELECT 
    order_items.ORDER_ID,
    order_items.PRODUCT_ID,
    int_prod.SOLD AS product_sold_value
FROM order_items 
LEFT JOIN int_prod
    ON order_items.PRODUCT_ID = int_prod.PRODUCT_ID
)
SELECT * FROM final
        );
      
  