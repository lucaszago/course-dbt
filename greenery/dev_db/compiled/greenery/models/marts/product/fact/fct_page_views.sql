

WITH events AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.stg_events
),

products  AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.int_products_agg
), 
final AS (
     SELECT 
     events.event_id
    ,events.session_id
    ,products.PRODUCT_ID
    , products.PRODUCT_NAME
    , sum(case when events.event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts
    , sum(case when events.event_type = 'checkout' then 1 else 0 end) as checkouts
    , sum(case when events.event_type = 'package_shipped' then 1 else 0 end) as package_shippeds
    , sum(case when events.event_type = 'page_view' then 1 else 0 end) as page_views
    from events 
    left join products
        on events.product_id = products.product_id
    group by 1, 2, 3,4
)
SELECT * FROM final