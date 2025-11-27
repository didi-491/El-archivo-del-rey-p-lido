{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *
        , replace(replace(trim(name), ' ', '_'), '-', '_') as name_clean
    FROM
        {{ source('hk_raw', 'hk_bosses_and_minibosses') }}
)

SELECT
   md5(name_clean) as enemy_id
   , name::varchar as enemy_desc
   , health::int as enemy_health
   , x::integer as x_location
   , y::integer as y_location
FROM
    source

