
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg_addresses
  
   as (
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
  );
