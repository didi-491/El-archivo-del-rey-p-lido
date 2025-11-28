{{ config(
    materialized="view"
) }}

WITH bench AS (
    SELECT
        concat('bench_', location_x , '_', location_y) as item_id
        , 'bench' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_benches') }}
),

grubs as (
    SELECT
        concat('grub_', location_x , '_', location_y) as item_id
        , 'grub' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_grubs') }}
),

mask as (
    SELECT
        concat('mask_', location_x , '_', location_y) as item_id
        , 'mask' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_mask') }}
),

vessel as (
    SELECT
        concat('vessel_', location_x , '_', location_y) as item_id
        , 'vessel' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_vessels') }}
), 

charms as (
    SELECT
        charm_id_location as item_id
        , 'charm' as item_type
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_charms') }}
)

SELECT
  *
FROM
    bench

union select * from grubs
union select * from mask
union select * from vessel
union select * from charms


