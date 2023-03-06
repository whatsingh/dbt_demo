  with source as 
  ( select {{ dbt_utils.star(ref("stg_rider")) }}
        from {{ ref("stg_rider") }}
        )
 select count(distinct bikeid) bikeid_count, count(distinct station_id) station_id_count from source
