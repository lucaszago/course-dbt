{{
    config(materialized='table')
}}

WITH events AS (
    SELECT * 
    FROM 
    {{ ref('stg_events') }}
), 

final AS (
    SELECT event_id
          ,product_id
          ,session_id
          {{_event_types()}}
    FROM events
    GROUP BY event_id,session_id, product_id
)
SELECT * FROM final
