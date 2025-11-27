{{ config(materialized='view') }}

SELECT
    hit_type,
    COUNT(*) AS total_hits
FROM {{ ref('fact_fights') }}
WHERE event_type = 'successful_hit'
GROUP BY hit_type
ORDER BY total_hits DESC
