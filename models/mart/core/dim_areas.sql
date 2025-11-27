{{ config(materialized='table') }}

select
    area_id,
    area_name,
    x_start,
    x_end,
    y_start,
    y_end
from {{ ref('stg_hk_raw__hk_areas') }}
