WITH source AS (
    SELECT * FROM raw.public.order_items
)

SELECT 
    order_id
    ,product_id
    ,quantity
FROM source