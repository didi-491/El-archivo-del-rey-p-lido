{{ config(
    materialized="view", 
    meta={'comment': 'A view with the grubs location.'}
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_grubs') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as grub_id
  , x::int as location_x
  , y::int as location_y
FROM
    source

