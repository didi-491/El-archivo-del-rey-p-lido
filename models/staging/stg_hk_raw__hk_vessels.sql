{{
  config(
    materialized='view',
    comment='A view with the vessel fragments location.',
    name='hk_vessels_fragments'
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_vessels') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as vessel_fragment_id
  , x::int as x_coordenate
  , y::int as y_coordenate
FROM
    source

