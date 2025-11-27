{{ config(materialized='table') }}

select
    *
from {{ ref('stg_hk_raw__hk_eshops') }}
