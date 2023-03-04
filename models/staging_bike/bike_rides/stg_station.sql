---https://github.com/dbt-labs/dbt-utils

{{
    config(materialized = 'ephemeral')
}}

with
    station as (
        select *
        from {{source('bike_rides','bikeshare_stations')}} 
        where floor(station_id / 100) = 25 
        limit 100
    )
select *  
from station



