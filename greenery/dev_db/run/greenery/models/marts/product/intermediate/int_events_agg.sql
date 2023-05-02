
  
    

        create or replace transient table dev_db.dbt_lukaszagohotmailcom.int_events_agg  as
        (

WITH events AS (
    SELECT * 
    FROM 
    dev_db.dbt_lukaszagohotmailcom.stg_events
), 

final AS (
    SELECT event_id
          ,product_id
          ,session_id
           

    

    
      ,SUM(CASE WHEN EVENT_TYPE = 'page_view' THEN 1 ELSE 0 END) AS page_views
    
      ,SUM(CASE WHEN EVENT_TYPE = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_carts
    
      ,SUM(CASE WHEN EVENT_TYPE = 'checkout' THEN 1 ELSE 0 END) AS checkouts
    
      ,SUM(CASE WHEN EVENT_TYPE = 'package_shipped' THEN 1 ELSE 0 END) AS package_shippeds
    


    FROM events
    GROUP BY event_id,session_id, product_id
)
SELECT * FROM final
        );
      
  