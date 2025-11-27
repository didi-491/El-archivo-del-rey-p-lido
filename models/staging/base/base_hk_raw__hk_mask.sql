{{ config(
    materialized="view", 
    meta={'comment': 'A view with the fragments of mask localitation.'}
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_mask') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as mask_id
  , x::int as location_y
  , y::int as location_x
FROM
    source

