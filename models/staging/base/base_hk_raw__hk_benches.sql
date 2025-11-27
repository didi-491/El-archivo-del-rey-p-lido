{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_bench') }}
)

SELECT
   x::int as location_x
  , y::int as location_y
FROM
    source

