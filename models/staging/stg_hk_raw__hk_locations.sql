{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents areas of the map and their coordenates.'}
) }}

WITH bench AS (
    SELECT
        md5(concat('bench_', location_x , '_', location_y)) as item_id
        , 'bench' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_benches') }}
),

grubs as (
    SELECT
        md5(concat('grub_', location_x , '_', location_y)) as item_id
        , 'grub' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_grubs') }}
),

mask as (
    SELECT
        md5(concat('mask_', location_x , '_', location_y)) as item_id
        , 'mask' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_mask') }}
),

vessel as (
    SELECT
         md5(concat('vessel_', location_x , '_', location_y)) as item_id
        , 'vessel' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_vessels') }}
)

SELECT
  *
FROM
    bench

union select * from grubs
union select * from mask
union select * from vessel


