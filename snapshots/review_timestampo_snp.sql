{% snapshot review_timestamp_snp %}

{{
    config(
        target_schema='snapshots',
        unique_key='recommendation_id',
        strategy='check',
        check_cols=['modified_at_utc',]
    )
}}

SELECT
    *
FROM {{ ref('stg_hk_raw__hk_reviews') }}

{% endsnapshot %}