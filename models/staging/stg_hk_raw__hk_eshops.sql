
{{ config(
    materialized="view", 
    meta={'comment': 'A view that flattens the raw steam review JSON data into structured columns.'}
) }}

WITH base AS (
    SELECT
        *
    FROM
        {{ ref('base_hk_raw__hk_steam_reviews') }}
)

select distinct
    md5(replace(replace(trim(eshop_desc), ' ', '_'), '-', '_')) as eshop_id,
    eshop_desc
from base


