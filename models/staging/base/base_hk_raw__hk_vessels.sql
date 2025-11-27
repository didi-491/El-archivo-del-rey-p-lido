{{ config(
    materialized="view", 
    meta={'comment': 'A view with the vessel fragments location.', 'name': 'hk_vessels_fragments'}
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_vessels') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as vessel_fragment_id
  , x::int as location_x
  , y::int as location_y
FROM
    source

