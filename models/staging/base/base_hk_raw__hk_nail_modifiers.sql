{{
  config(
    materialized='view',
    comment='A view with the possible nails modifiers. The nail damage must be cross with the '
  )
}}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_nail') }}
    WHERE 
        LOWER(source) LIKE '%slash%' 
        AND source IS NOT NULL 
)

SELECT distinct
  md5(replace(replace(trim(source), ' ', '_'), '-', '_')) as nail_modifier_id
  , source as nail_modifier_desc
  , CAST(SPLIT_PART(damage, 'x', 1) AS FLOAT) AS nail_modification
FROM
    source

