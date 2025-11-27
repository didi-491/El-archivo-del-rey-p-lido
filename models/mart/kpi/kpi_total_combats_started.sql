{{ config(materialized='view') }}

SELECT
    count(*) AS total_combats_started
FROM {{ ref('fact_fights') }}
WHERE event_type = 'start_fight'
