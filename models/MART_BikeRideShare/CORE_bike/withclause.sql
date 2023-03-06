with
    source as (

        select {{ dbt_utils.star(ref("stg_rider"), except=["bikeid"]) }}
        from {{ ref("stg_rider") }}
    ),
    rename as (
        select
            trip_id,
            subscriber_type,
            duration_minutes as rental_duration_minutes,
            station_id
        from source
    ),
    transform as (
        select
            trip_id,
            subscriber_type,
            rental_duration_minutes,
            case
                when rental_duration_minutes < 16
                then 1 / 4
                when rental_duration_minutes < 31
                then 1 / 2
                when rental_duration_minutes < 46
                then 3 / 4
                else 1
            end as rental_duration_hours,
            station_id
        from rename
    ),
    final as (
        select station_id, sum(rental_duration_hours) total_hours_rented
        from transform
        group by station_id
    )
select *
from final
order by 2 desc
limit 5