{{ config(
    materialized="incremental", 
    incremental_strategy="merge", 
    unique_key="recommendation_id", 
    on_schema_change="fail", 
    meta={'comment': 'A view with the review information from the steam json.'}
) }}

WITH base AS (
    SELECT
        *
    FROM
        {{ ref('base_hk_raw__hk_steam_reviews') }}
)

select 
    recommendation_id
    , user_steam_id as user_id 
    , review_text
    , language
    , created_at as created_at_utc
    , modified_at as modified_at_utc
    , is_voted_up
    , votes_up_count
    , votes_funny_count
    , weighted_vote_score
    , written_during_early_access
    , playtime_at_review_minutes
    , md5(replace(replace(trim(eshop_desc), ' ', '_'), '-', '_')) as eshop_id
from base