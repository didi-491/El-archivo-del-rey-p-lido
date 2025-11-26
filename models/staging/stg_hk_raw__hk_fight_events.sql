{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

WITH source AS (
    SELECT *,
    replace(replace(trim(enemy), ' ', '_'), '-', '_') as enemy_name_clean,
    replace(replace(trim(hit_type), ' ', '_'), '-', '_') as hit_type_clean,

    FROM
        {{ source('hk_raw', 'hk_fights') }}
)

SELECT
  event_id
  , user_id
  , timestamp::timestamp as event_timestamp_utc
  , gameplay_id
  , session_id
  , gameplay_type
  , event_type
  , md5(enemy_name_clean) as enemy_id
  , hit_type
  , direction
  , damage::int as damage
  , soul_change::int as soul_change
  , soul_total::int as soul_total
  , fight_phase
  
FROM
    source

