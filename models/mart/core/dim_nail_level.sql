{{ config(materialized='table') }}

select
    *,
    rank() over (order by nail_damage ASC) as nail_lvl
from {{ ref('stg_hk_raw__hk_nail_types') }}
