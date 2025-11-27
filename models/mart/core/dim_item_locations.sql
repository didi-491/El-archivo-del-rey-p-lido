{{ config(materialized='table') }}

select
    item_id,
    item_type,
    location_x,
    location_y
from {{ ref('stg_hk_raw__hk_item_locations') }}
