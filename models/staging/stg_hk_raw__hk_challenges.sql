{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *,
        LOWER(REPLACE(REPLACE(trim(challenge_name), ' ', '_'), '-', '_')) as challenge_name_clean
    FROM
        {{ source('hk_raw', 'hk_challenges') }}
)

SELECT
  md5(challenge_name_clean) as challenge_id
  , challenge_name
  , challenge_desc
FROM
    source

