{{
    config(
        materialized="table"
    )
}}
WITH order_items AS (
    SELECT * 
    FROM {{ ref('stg_order_items')}}
),
int_prod AS (SELECT
* 
FROM {{ ref('int_products_agg') }}
),
final AS (
SELECT 
    order_items.ORDER_ID,
    order_items.PRODUCT_ID,
    int_prod.SOLD AS Revenue
FROM order_items 
LEFT JOIN int_prod
    ON order_items.PRODUCT_ID = int_prod.PRODUCT_ID
)
SELECT * FROM final

