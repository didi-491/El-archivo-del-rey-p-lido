{{ config(materialized='incremental', unique_key='event_id') }}

select
    *
    
from {{ ref('stg_hk_raw__hk_fight_events') }} 
where enemy_id IS NOT NULL

