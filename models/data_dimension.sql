with cte as (
    select 
    TO_TIMESTAMP(STARTED_AT) as started_at,
    DATE(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
    HOUR(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,
    MONTH(TO_TIMESTAMP(STARTED_AT)) as month_started_at,
    CASE WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun') then 'WEKKEND' ELSE 'BUSINESDAY' END as day_type,
    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)
select * from cte

