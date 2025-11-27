{{ config(
    materialized="view"
) }}


SELECT
    charm_id
    , charm_name
    , charm_type
    , damage_description
    , notches_required
    , long_description
FROM
    {{ ref('base_hk_raw__hk_charms') }}

