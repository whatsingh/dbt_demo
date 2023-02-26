{{
  config(
    materialized='ephemeral'
  )
}}

with
    rider as (
        select
            trip_id,
            subscriber_type,
            bikeid,
            duration_minutes,
            start_station_id station_id
        from {{source('bike_rides','bikeshare_trips')}} 
        where subscriber_type like '%Pass%'
        limit 50
    )
select * from rider

