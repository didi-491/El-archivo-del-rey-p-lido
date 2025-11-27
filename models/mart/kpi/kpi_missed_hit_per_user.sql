{{ config(materialized='view') }}

SELECT
    user_id,
    COUNT(*) AS total_missed_hits
FROM {{ ref('fact_fights') }}
WHERE event_type = 'missed_hit'
group by user_id
