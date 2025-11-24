{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_boss_and_miniboss') }}
)

SELECT
   *
FROM
    source

