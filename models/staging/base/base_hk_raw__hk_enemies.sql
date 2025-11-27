{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents areas of the map and their coordenates.'}
) }}

WITH source AS (
    SELECT
        name,
        nullif(REGEXP_REPLACE(health, '[^0-9]', ''), '') AS health_clean,
        replace(replace(trim(name), ' ', '_'), '-', '_') as name_clean
    FROM
        {{ source('hk_raw', 'hk_enemies') }}
    WHERE name is not null
)

SELECT
   md5(name_clean) as enemie_id
   , name
   , health_clean::int as enemy_health
FROM
    source

