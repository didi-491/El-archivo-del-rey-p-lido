{{ config(materialized='incremental', unique_key='event_id') }}

select
    ae.event_id,
    ae.user_id,
    ae.event_timestamp,
    ae.location_x,
    ae.location_y,
    ae.objective as item_id,
    ae.event_type,
    ae.soul_change,
    ae.health

from {{ ref('stg_hk_raw__hk_all_events') }} ae
where ae.event_type in ('buy_item', 'obtain_item')
