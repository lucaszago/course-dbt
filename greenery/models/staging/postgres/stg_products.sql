with source AS (
    SELECT * 
    FROM {{ source('postgres', 'products') }}
)
SELECT 
    product_id
    ,name AS product_name
    ,price
    ,inventory
FROM source