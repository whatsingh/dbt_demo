with
    rider as (
        select
            trip_id,
            subscriber_type,
            bikeid,
            duration_minutes,
            start_station_id station_id
        from `bigquery-public-data.austin_bikeshare.bikeshare_trips`
        where subscriber_type like '%Pass%'
        limit 100
    )
select * from rider