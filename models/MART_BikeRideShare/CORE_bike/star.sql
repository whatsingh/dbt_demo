
        select {{ dbt_utils.star(ref("stg_rider"), except=["bikeid"]) }}
        from {{ ref("stg_rider") }}
    