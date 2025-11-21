{{
  config(
    materialized='view',
    comment='A view with the fragments of mask localitation.'
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_mask') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as mask_id
  , x::int as x_coordenate
  , y::int as y_coordenate
FROM
    source

