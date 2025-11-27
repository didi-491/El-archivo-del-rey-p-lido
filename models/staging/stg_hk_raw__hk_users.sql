
{{ config(
    materialized="incremental", 
    unique_key="user_id", 
    on_schema_change="fail", 
    meta={'comment': 'An incremental table that flattens the raw steam review JSON data into structured columns.'}
) }}

WITH base AS (
    SELECT
        *
    FROM
        {{ ref('base_hk_raw__hk_steam_reviews') }}
)

select 
    user_steam_id as user_id 
    , playtime_forever_minutes
    , num_games_owned
    , num_reviews
    , last_played
    , md5(replace(replace(trim(eshop_desc), ' ', '_'), '-', '_')) as eshop_id
    -- meter el porcentaje de juego para el snapshot
from base


