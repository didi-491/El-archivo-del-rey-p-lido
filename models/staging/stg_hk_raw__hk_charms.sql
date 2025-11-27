{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents areas of the map and their coordenates.'}
) }}

SELECT
    *
FROM
  {{ source('hk_raw', 'hk_charms') }}