{{
    config(materialized = 'table')
}}

WITH events AS (
    SELECT * 
    FROM {{ ref('stg_events') }}
),

products  AS (
    SELECT * 
    FROM {{ref ('int_products_agg') }}
), 
final AS (
     SELECT 
    events.event_id
    ,events.session_id
    ,products.PRODUCT_ID
    ,products.PRODUCT_NAME
    {{_event_types()}}
    FROM events
    LEFT JOIN products
        ON events.product_id = products.product_id
    GROUP BY 1, 2, 3,4
)
SELECT * FROM final