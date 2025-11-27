{{ config(
    materialized="view"
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
    , CONVERT_TIMEZONE('Europe/Madrid', created_at)::TIMESTAMP_NTZ  as created_at_utc
    , CONVERT_TIMEZONE('Europe/Madrid', modified_at)::TIMESTAMP_NTZ  as modified_at_utc
    , is_voted_up
    , votes_up_count
    , votes_funny_count
    , weighted_vote_score
    , written_during_early_access
    , playtime_at_review_minutes
    , md5(replace(replace(trim(eshop_desc), ' ', '_'), '-', '_')) as eshop_id
from base