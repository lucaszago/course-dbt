
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg.promos
  
   as (
    with source as (
    SELECT * 
    FROM raw.public.promos

)

SELECT 
    promo_id
    ,discount
    ,status
FROM source
  );
