
  
    

        create or replace transient table dev_db.dbt_lukaszagohotmailcom.fct_page_views  as
        (

WITH events AS (
    SELECT * 
    FROM dev_db.dbt_lukaszagohotmailcom.int_events_agg
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
    ,page_views
    ,add_to_carts
    ,checkouts
    ,package_shippeds
    FROM events
    LEFT JOIN products
        ON events.product_id = products.product_id
    GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
)
SELECT * FROM final
        );
      
  