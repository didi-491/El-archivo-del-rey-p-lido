{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents areas of the map and their coordenates.'}
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_spells') }}
)

SELECT
   md5(replace(replace(trim(spell), ' ', '_'), '-', '_')) as spell_id
   , *
FROM
    source

