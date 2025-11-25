{{ config(materialized='incremental', unique_key='event_id') }}

select
    ae.event_id,
    ae.user_id,
    ae.event_timestamp,
    ae.enemy,
    ae.damage,
    ae.hit_type,
    ae.location_x,
    ae.location_y,
    ae.nail_id,
    ae.fight_phase
    
from {{ ref('stg_hk_raw__hk_all_events') }} ae

