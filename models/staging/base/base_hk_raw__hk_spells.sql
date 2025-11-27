{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        *
    FROM
        {{ source('hk_raw', 'hk_spells') }}
)

SELECT
   md5(replace(replace(trim(spell), ' ', '_'), '-', '_')) as spell_id
   , spell
   , damage::int as damage 
FROM
    source

