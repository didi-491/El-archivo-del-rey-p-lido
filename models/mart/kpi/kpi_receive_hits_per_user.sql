{{ config(materialized='view') }}

SELECT
    user_id,
    COUNT(*) AS total_receive_hits
FROM {{ ref('fact_fights') }}
WHERE event_type = 'receive_hit'
group by user_id