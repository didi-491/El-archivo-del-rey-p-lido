{{
  config(
    comment='A view that flattens the raw steam review JSON data into structured columns.'
  )
}}

WITH raw_reviews_source AS (
    SELECT
        review_data
    FROM
        {{ source('hk_raw', 'hk_steam_data') }}
),

flattened_data AS (
    SELECT
        r.review_data:cursor::varchar AS cursor_id,
        r.review_data:query_summary:total_reviews::number AS total_reviews_snapshot,
        f.value AS review_object
    FROM
        raw_reviews_source r,
        LATERAL FLATTEN(INPUT => r.review_data:reviews) AS f
)

SELECT
 
    review_object:recommendationid::varchar AS recommendation_id,
    review_object:review::varchar AS review_text,
    review_object:language::varchar AS language,
    review_object:timestamp_created::timestamp_ntz AS created_at,
    review_object:timestamp_updated::timestamp_ntz AS modified_at,
    review_object:voted_up::boolean AS is_voted_up,
    review_object:votes_up::number AS votes_up_count,
    review_object:votes_funny::number AS votes_funny_count,
    review_object:weighted_vote_score::varchar AS weighted_vote_score,
    review_object:written_during_early_access::boolean AS written_during_early_access,
    review_object:author:steamid::varchar AS user_steam_id,
    review_object:author:playtime_forever::number AS playtime_forever_minutes,
    review_object:author:playtime_at_review::number AS playtime_at_review_minutes,
    review_object:author:num_games_owned::number AS num_games_owned,
    review_object:author:num_reviews::number AS num_reviews,
    review_object:author:last_played::timestamp_ntz AS last_played,
    'steam' as eshop_desc,

    CURRENT_TIMESTAMP()::timestamp_ntz AS processed_timestamp

FROM
    flattened_data

