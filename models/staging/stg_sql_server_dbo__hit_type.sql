{{
  config(
    materialized='view',
    comment='A view with the nail types and their damage.'
  )
}}


SELECT
    *
FROM
    {{ ref('base_hk_raw__hk_nail_modifiers') }}

