{{ config(materialized='incremental', unique_key='recommendation_id') }}

select
    *

from {{ ref('review_check_snp') }} 
