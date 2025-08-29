

{# select * from {{ source('demo', 'bike') }} limit 100 __source #}
select * from {{ source('demo', 'bike') }} limit 100

{# select * from {{ ref('my_second_dbt_model') }} __ref #}