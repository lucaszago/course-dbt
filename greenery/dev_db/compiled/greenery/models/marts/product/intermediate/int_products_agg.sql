

WITH products AS (
SELECT *
FROM dev_db.dbt_lukaszagohotmailcom.stg_products
),
order_items AS (
    SELECT PRODUCT_ID,
    QUANTITY
FROM dev_db.dbt_lukaszagohotmailcom.stg_order_items
)
,final AS (
    SELECT 
    products.PRODUCT_ID,
    products.PRODUCT_NAME,
    (products.PRICE * order_items.QUANTITY) AS sold
FROM products
LEFT JOIN order_items
    ON products.PRODUCT_ID = order_items.PRODUCT_ID
)
SELECT * FROM final