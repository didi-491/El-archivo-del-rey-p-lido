{{
  config(
    materialized='incremental',
    unique_key = 'event_id',
    on_schema_change='append_new_columns',
    comment='A view with all of the events registered in the game.'

  )
}}

WITH events AS (
    SELECT
        event_id,
        user_id,
        event_timestamp_utc,
        gameplay_id,
        session_id,
        gameplay_type,
        event_type,
        NULL::varchar AS enemy_id,
        NULL::varchar AS hit_type,
        NULL::varchar AS direction,
        NULL::int AS damage,
        NULL::int AS soul_change,
        NULL::int AS soul_total,
        NULL::varchar AS fight_phase,
        nail_id,
        health AS health,
        blue_health AS blue_health,
        soul AS soul,
        objective,
        location_x,
        location_y
    FROM {{ ref('base_hk_raw__hk_events') }}
),
 

fights AS (
    SELECT
        event_id,
        user_id,
        event_timestamp_utc,
        gameplay_id,
        session_id,
        gameplay_type,
        event_type,
        enemy_id,
        hit_type,
        direction,
        damage,
        soul_change,
        soul_total,
        fight_phase,
        NULL::varchar AS nail_id,
        NULL::int AS health,
        NULL::int AS blue_health,
        NULL::int AS soul,
        NULL::varchar AS objective,
        NULL::int AS location_x,
        NULL::int AS location_y
    FROM {{ ref('base_hk_raw__hk_fights') }}
)



SELECT
  *
FROM
    events

union 

Select * 
from 
    fights
