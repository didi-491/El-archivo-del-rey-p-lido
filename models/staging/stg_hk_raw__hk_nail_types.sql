{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_nail') }}
    WHERE LOWER(source) LIKE '%nail%'

)

SELECT distinct
  md5(replace(replace(trim(source), ' ', '_'), '-', '_')) as nail_id
  , source as nail_desc
  , damage::int as nail_damage
  , rank() over (order by nail_damage ASC) as nail_lvl
FROM
    source

