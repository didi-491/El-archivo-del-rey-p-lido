{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_mask') }}
)

SELECT
    x::int as location_y
  , y::int as location_x
FROM
    source

