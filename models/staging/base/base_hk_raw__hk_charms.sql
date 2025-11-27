{{ config(
    materialized="view", 
    meta={'comment': 'A view with the differents areas of the map and their coordenates.'}
) }}

SELECT
    md5(replace(replace(trim(charm_name), ' ', '_'), '-', '_')) as charm_id
    , md5(concat(replace(replace(trim(charm_name), ' ', '_'), '-', '_'), '_', x_location , '_', y_location)) charm_id_location
    , charm_name
    , x_location::int as location_x
    , y_location::int as location_y
    , type as charm_type
    , damage::varchar as damage_description
    , notches::int as notches_required
    
    , CASE WHEN c8 IS NULL THEN description 
      ELSE concat(description, ' ', c8)
      END as long_description

FROM
  {{ source('hk_raw', 'hk_charms') }}