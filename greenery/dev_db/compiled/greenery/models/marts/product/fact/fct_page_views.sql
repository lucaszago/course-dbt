

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
    ,products.PRODUCT_NAME
     

    

    
      ,SUM(CASE WHEN EVENT_TYPE = 'page_view' THEN 1 ELSE 0 END) AS page_views
    
      ,SUM(CASE WHEN EVENT_TYPE = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_carts
    
      ,SUM(CASE WHEN EVENT_TYPE = 'checkout' THEN 1 ELSE 0 END) AS checkouts
    
      ,SUM(CASE WHEN EVENT_TYPE = 'package_shipped' THEN 1 ELSE 0 END) AS package_shippeds
    


    FROM events
    LEFT JOIN products
        ON events.product_id = products.product_id
    GROUP BY 1, 2, 3,4
)
SELECT * FROM final