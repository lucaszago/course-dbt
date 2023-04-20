with source AS (
    SELECT * FROM raw.public.addresses
)
SELECT 
    address_id
    ,address
    ,zipcode
    ,state
    ,country
FROM source