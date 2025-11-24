{{
  config(
    materialized='view',
    comment='A view with the differents areas of the map and their coordenates.'
  )
}}

WITH bench AS (
    SELECT
        bench_id as object_id
        , location_x
        , location_y
    FROM
        {{ ref('base_hk_raw__hk_benches') }}
),

grubs as (
    SELECT
        grub_id as object_id
        , location_x
        , location_y
        , 'grub' as object_type
    FROM
        {{ ref('base_hk_raw__hk_grubs') }}
),

mask as (
    SELECT
        mask_id as object_id
        , location_x
        , location_y
        , 'mask' as object_type
    FROM
        {{ ref('base_hk_raw__hk_mask') }}
),

vessel as (
    SELECT
        vessel_fragment_id as object_id
        , location_x
        , location_y
        , 'vessel' as object_type
    FROM
        {{ ref('base_hk_raw__hk_vessels') }}
)

SELECT
  *
  , 'bench' as object_type
FROM
    bench

union select * from grubs
union select * from mask
union select * from vessel


