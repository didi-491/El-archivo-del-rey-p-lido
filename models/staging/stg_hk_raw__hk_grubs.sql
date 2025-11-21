{{
  config(
    materialized='view',
    comment='A view with the grubs location.'
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_grubs') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as grub_id
  , x::int as x_coordenate
  , y::int as y_coordenate
FROM
    source

