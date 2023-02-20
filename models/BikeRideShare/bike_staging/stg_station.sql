with
    station as (
        select *
        from `bigquery-public-data.austin_bikeshare.bikeshare_stations`
        --from {{source('austin_bikeshare','bikeshare_stations')}}
        where floor(station_id / 100) = 25
        limit 100
    )
select *
from station
