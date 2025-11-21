{{
  config(
    materialized='view',
    comment='Locations enriched with their corresponding area.'
  )
}}

WITH locations AS (
    SELECT
        location_name,
        try_cast(x_start AS int) AS x_start,
        try_cast(x_end   AS int) AS x_end,
        try_cast(y_start AS int) AS y_start,
        try_cast(y_end   AS int) AS y_end,
        LOWER(
                REPLACE(REPLACE(trim(location_name), ' ', '_'), '-', '_')
            ) AS location_name_clean
    FROM {{ source('hk_raw', 'hk_locations') }}
)
SELECT
    md5(location_name_clean) as location_id
    , location_name
    , x_start
    , x_end
    , y_start
    , y_end
FROM locations