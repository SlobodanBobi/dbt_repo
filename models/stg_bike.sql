
{{ config(materialized='table') }}


WITH BIKE AS (

    select
    RIDE_ID,
    REPLACE(STARTED_AT,'"','') AS STARTED_AT,
    REPLACE(ENDED_AT,'"','') AS ENDED_AT,
    START_STATION_NAME,
    START_STATIO_ID,
    END_STATION_NAME,
    END_STATION_ID,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG,
    MEMBER_CSUAL

    from {{ source('demo', 'bike') }}
    where RIDE_ID not like '%id%' and  STARTED_AT not like 'started%' and  ENDED_AT not like 'ended%' 
)

select * from BIKE