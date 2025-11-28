{% snapshot users_timestamp_snp %}

{{
    config(
        target_schema='snapshots',
        unique_key='user_id',
        strategy='timestamp',
        updated_at='last_played'
    )
}}

SELECT
    *
FROM {{ ref('stg_hk_raw__hk_users') }}

{% endsnapshot %}


