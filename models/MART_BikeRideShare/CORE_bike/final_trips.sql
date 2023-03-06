-- station_id total_rental_time = 5744

with final_trip as (
        select
            trip_id,
            subscriber_type,
            bikeid,
            duration_minutes,
            total_minutes,
            sum(total_minutes) over (partition by station_id) total_rental_time_by_station,
            stg_rider.station_id,
            case  when total_minutes > 500 then 'can be used as model'
            when total_minutes > 100 then 'Good'
                        else 'Need Review' end Review
        from {{ ref("stg_rider") }}
        inner join {{ ref("stg_total_time") }} using (station_id)
    )
select *
from final_trip
order by 6 desc
