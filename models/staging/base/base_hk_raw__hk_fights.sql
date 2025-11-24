{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

WITH source AS (
    SELECT *,
    replace(replace(trim(enemy), ' ', '_'), '-', '_') as enemy_name_clean,
    replace(replace(trim(event_type), ' ', '_'), '-', '_') as event_type_clean,

    FROM
        {{ source('hk_raw', 'hk_fights') }}
)

SELECT
  event_id
  , timestamp::timestamp as event_timestamp
  , user_id
  , gameplay_id
  , session_id
  , gameplay_type
  , md5(event_type_clean) as event_type
  , md5(enemy_name_clean) as enemy_id
  , hit_type
  , direction
  , damage::int as damage
  , soul_change::int as soul_change
  , soul_total::int as soul_total
  , fight_phase
  
FROM
    source

