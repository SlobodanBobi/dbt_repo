
{{ config(materialized='table') }}

WITH BIKE as (

        select
        distinct
        START_STATIO_ID AS station_id,
        start_station_name as station_name,
        START_LAT as station_lat,
        START_LNG as start_station_lng

        from {{ ref('stg_bike') }}
        where lower(RIDE_ID) not like  '%bike%'

)
select * from BIKE