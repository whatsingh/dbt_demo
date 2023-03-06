  with source as 
  ( select {{ dbt_utils.star(ref("stg_rider")) }}
        from {{ ref("stg_rider") }}
        )
 select * from source
 where subscriber_type  = 'Local365+Guest Pass'
 union all
 select * from source
 where subscriber_type  = 'Annual Pass'

-- select distinct subscriber_type from source
