with source as (
    SELECT * 
    FROM raw.public.promos

)

SELECT 
    promo_id
    ,discount
    ,status
FROM source