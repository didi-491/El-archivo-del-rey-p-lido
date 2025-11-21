{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

WITH source AS (
    SELECT
        name,
        health,
        replace(replace(trim(name), ' ', '_'), '-', '_') as name_clean
    FROM
        {{ source('hk_raw', 'hk_enemies') }}
    WHERE name is not null
)

SELECT
   md5(name_clean) as enemie_id
   , name
   , health
FROM
    source

