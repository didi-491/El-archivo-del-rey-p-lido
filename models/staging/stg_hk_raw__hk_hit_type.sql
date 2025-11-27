{{ config(
    materialized="view"
) }}


SELECT
    *
    , 'nail_art' as type_of_hit
FROM
    {{ ref('base_hk_raw__hk_nail_modifiers') }}

union 

select 
    *
    , 'spell' as type_of_hit
from 
    {{ ref('base_hk_raw__hk_spells') }}

