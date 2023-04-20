
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg_events
  
   as (
    with source AS (
    SELECT * FROM 
    raw.public.events
)

SELECT 
    event_id
    ,session_id
    ,user_id
    ,event_type
    ,page_url
    ,created_at
    ,order_id
    ,product_id
FROM source
  );
