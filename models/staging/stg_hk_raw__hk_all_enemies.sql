WITH normal_enemies AS (
    SELECT
        *,
        NULL as x_location,
        NULL as y_location,
        'normal_enemy' as type_enemy
    FROM
        {{ ref('base_hk_raw__hk_enemies') }}
), 

boss_and_miniboss as (
SELECT
        *,
        'boss' as type_enemy
    FROM
        {{ ref('base_hk_raw__hk_bosses_minibosses') }}

)

SELECT
   *
FROM
    normal_enemies

union SELECT
   *
FROM
    boss_and_miniboss