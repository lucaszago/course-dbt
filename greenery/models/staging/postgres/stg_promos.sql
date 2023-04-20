with source as (
    SELECT * 
    FROM {{ source('postgres','promos') }}

)

SELECT 
    promo_id
    ,discount
    ,status
FROM source 