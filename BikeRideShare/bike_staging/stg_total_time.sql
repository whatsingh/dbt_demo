  total_trips as (
        select station_id, sum(duration_minutes) total_minutes
        from {{ref('stg_rider')}}
        group by station_id
    )