with source AS (
    SELECT * 
    FROM raw.public.products
)
SELECT 
    product_id
    ,name
    ,price
    ,inventory
FROM source