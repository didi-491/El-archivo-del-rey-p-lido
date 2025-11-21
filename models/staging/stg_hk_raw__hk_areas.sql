{{
  config(
    materialized='view',
    comment='Vista con las areas del juego casteadas'
  )
}}

with source as (

    select * from {{ source('hk_raw', 'hk_areas') }}

)

select 
    area_id
    , area_name
    , nullif(x_start, "-")::int as x_start
    , nullif(x_end, "-")::int as x_end
    , nullif(y_start, "-")::int as y_start
    , nullif(y_end, "-")::int as y_end


from source