{{ config(materialized='incremental', unique_key='event_id') }}

select
    *

from {{ ref('review_timestamp_snp') }} 
