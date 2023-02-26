{{
  config(
    materialized='ephemeral'
  )
}}

with
    station as (
        select *
        from {{source('bike_rides','bikeshare_stations')}} 
        where station_id = 2545
    )
select *
from station