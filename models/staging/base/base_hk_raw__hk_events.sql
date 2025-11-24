{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

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
  , objective
  , location_x::int as location_x
  , location_y::int as location_y
  , event_timestamp::timestamp as event_timestamp
FROM
    source
