{{ config(materialized='incremental', unique_key='event_id') }}

select
    *
from {{ ref('stg_hk_raw__hk_events') }} 
where event_type in ('buy_item', 'obtain_item')
