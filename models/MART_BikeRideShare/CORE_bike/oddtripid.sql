with odd_id as (
        select
            trip_id,
            subscriber_type,
            bikeid,
            duration_minutes,
            total_minutes,
            stg_rider.station_id,
            case  when total_minutes > 500 then 'can be used as model'
            when total_minutes > 100 then 'Good'
                        else 'Need Review' end Review
        from {{ ref("stg_rider") }}
        inner join {{ ref("stg_total_time") }} using (station_id)
        where mod(trip_id,2) != 0
    )
select *
from odd_id