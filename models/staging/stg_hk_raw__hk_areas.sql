{{ config(
    materialized="view"
) }}

WITH source AS (
    SELECT
        area_name
        , try_cast(x_start AS int) as x_start
        , try_cast(x_end AS int) as x_end
        , try_cast(y_start AS int) as y_start
        , try_cast(y_end AS int) as y_end
    FROM
        {{ source('hk_raw', 'hk_areas') }}
)

SELECT
  case 
    when x_start is null 
        then md5(replace(replace(trim(area_name), ' ', '_'), '-', '_'))
    else md5(concat(x_start, x_end, y_start, y_end)) 
    end as area_id
   , *
FROM
    source

