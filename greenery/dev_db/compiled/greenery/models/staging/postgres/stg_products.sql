with source AS (
    SELECT * 
    FROM raw.public.products
)
SELECT 
    product_id
    ,name AS product_name
    ,price
    ,inventory
FROM source