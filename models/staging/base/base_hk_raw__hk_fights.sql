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
  , user_id
  , timestamp::timestamp as event_timestamp
  , gameplay_id
  , session_id
  , gameplay_type
  , event_type
  , enemy
  , hit_type
  , direction
  , damage::int as damage
  , soul_change::int as soul_change
  , soul_total::int as soul_total
  , fight_phase
  
FROM
    source

