
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg_products
  
   as (
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
  );
