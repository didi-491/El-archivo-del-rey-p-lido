{{ config(materialized='view') }}

WITH hits AS (
    SELECT
        user_id,
        SUM(CASE WHEN event_type = 'successful_hit' THEN 1 ELSE 0 END) AS successful_hits,
        SUM(CASE WHEN event_type = 'missed_hit' THEN 1 ELSE 0 END) AS missed_hits
    FROM {{ ref('fact_fights') }}
    group by user_id
)

SELECT
    user_id,
    successful_hits,
    missed_hits,
    successful_hits / (successful_hits + missed_hits) AS hit_accuracy,
    missed_hits / (successful_hits + missed_hits) AS miss_rate
FROM hits
