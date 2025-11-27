{{ config(
    materialized="incremental", 
    unique_key="event_id", 
   
) }}

WITH source AS (
    SELECT *

    FROM
        {{ source('hk_raw', 'hk_events') }}
)

SELECT
  event_id
  , user_id
  , gameplay_id
  , session_id
  , gameplay_type
  , event_type
  , nail_id
  , health::int as health
  , blue_mask::int as blue_health
  , soul::int as soul
  ,   case 
    when event_type = 'start_fight' or event_type = 'kill_enemy' or event_type = 'obtain_challenge' 
      then md5(replace(replace(trim(objective), ' ', '_'), '-', '_'))
      
    when event_type = 'release_grub' 
      then md5(concat('grub_', location_x , '_', location_y))
      
    when event_type = 'rest_bench' 
      then md5(concat('bench_', location_x , '_', location_y))
      
    when event_type = 'obtain_item' 
      then md5(concat(replace(replace(trim(objective), ' ', '_'), '-', '_'), '_', location_x , '_', location_y)) 
      
    when event_type = 'buy_item' 

      then md5(
        replace(
          replace(
            trim(split_part(objective, '|', 1)), 
            ' ', '_'
          ), 
          '-', '_'
        )
      )
      
    else objective 
  end as objective
  , location_x::int as location_x
  , location_y::int as location_y
  , event_timestamp::timestamp as event_timestamp_utc
FROM
    source
