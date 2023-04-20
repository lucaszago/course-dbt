
  create or replace  view dev_db.dbt_lukaszagohotmailcom.stg_orders
  
   as (
    with source as (
    SELECT * 
    FROM raw.public.orders
)

SELECT 
    order_id
    ,promo_id
    ,user_id
    ,address_id
    ,created_at
    ,order_cost
    ,shipping_cost
    ,order_total
    ,tracking_id
    ,shipping_service
    ,estimated_delivery_at
    ,delivered_at
    ,status 
FROM source
  );
