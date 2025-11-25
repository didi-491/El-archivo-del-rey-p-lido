{{ config(materialized='table') }}


with bounds as (

    select
        min(event_timestamp)::date as start_date,
        max(event_timestamp)::date as end_date
    from {{ ref('stg_hk_raw__hk_all_events') }}

),

date_spine as (

    select
        date_day as date
    from {{ dbt_utils.date_spine(
            datepart="day",
            start_date="(select start_date from bounds)",
            end_date="(select end_date from bounds)"
        ) }}

),


final as (

    select
        {{ dbt_utils.generate_surrogate_key(['date']) }} as date_id,
        date,
        extract(year       from date) as year,
        extract(quarter    from date) as quarter,
        extract(month      from date) as month,
        extract(day        from date) as day,
        extract(dow        from date) as day_of_week,
        to_char(date, 'Day')  as day_name,
        to_char(date, 'Month') as month_name
    from date_spine
)

select * from final
order by date;
