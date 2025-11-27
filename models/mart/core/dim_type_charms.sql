{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents charms that can bue equiped.'}
) }}


SELECT
    charm_id
    , charm_name
    , charm_type
    , damage_description
    , notches_required

FROM
    {{ ref('stg_hk_raw__hk_charms_builded') }}