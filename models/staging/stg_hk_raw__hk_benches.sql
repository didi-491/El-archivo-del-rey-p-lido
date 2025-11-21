{{
  config(
    materialized='view',
    comment='A view with the benches location.',
    name='hk_benches'
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_bench') }}
)

SELECT
  SHA1(CONCAT(x, '_', y)) as bench_id
  , x::int as x_coordenate
  , y::int as y_coordenate
FROM
    source

