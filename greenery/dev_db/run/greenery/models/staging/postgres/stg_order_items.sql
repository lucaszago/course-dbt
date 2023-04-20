
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg_order_items
  
   as (
    WITH source AS (
    SELECT * FROM raw.public.order_items
)

SELECT 
    order_id
    ,product_id
    ,quantity
FROM source
  );
