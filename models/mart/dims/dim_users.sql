{{ config(materialized='table') }}

select
    user_id,
    playtime_forever_minutes,
    num_games_owned,
    num_reviews,
    last_played,
    eshop_id
from {{ ref('stg_hk_raw__hk_users') }}
