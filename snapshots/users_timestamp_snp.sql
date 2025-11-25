{% snapshot users_timestamp_snp %}

{{
    config(
        target_schema='snapshots',
        unique_key='usser_id',
        strategy='check',
        check_cols=['playtime_forever_minutes', 'last_played']
    )
}}

SELECT
    *
FROM {{ ref('stg_hk_raw__hk_users') }}

{% endsnapshot %}