{{ config(materialized='table') }}

select
    user_id,
    playtime_forever_minutes,
    num_games_owned,
    num_reviews,
    last_played,
    eshop_id
from {{ ref('users_timestamp_snp') }}
