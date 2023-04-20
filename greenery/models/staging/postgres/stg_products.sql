with source AS (
    SELECT * 
    FROM {{ source('postgres', 'products') }}
)
SELECT 
    product_id
    ,name
    ,price
    ,inventory
FROM source