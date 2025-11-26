{{ config(materialized='table') }}

with date_spine as (
    {{ dbt_utils.date_spine(
        datepart="second",
        start_date="cast('2025-01-01 00:00:00' as timestamp_ntz)",
        end_date="cast('2026-01-01 23:59:59' as timestamp_ntz)"
    ) }}
)

select
    date_second as date_pk, 
    year(date_second) as year,
    month(date_second) as month,
    monthname(date_second) as month_name,
    day(date_second) as day,
    quarter(date_second) as quarter,
    dayofweek(date_second) as day_of_week_iso,
    dayname(date_second) as day_name,
    hour(date_second) as hour,      
    minute(date_second) as minute,   
    second(date_second) as second_of_minute 

from date_spine