{{ config(materialized='table') }}

with
    total_disease as (
        select state, disease, sum(cast(cases as numeric)) total_cases
        from {{ source("usa_contagious_disease", "project_tycho_reports") }}
        where cases <> '\\N'
        group by state, disease
    ),
    total_per_state as (
        select state, sum(total_cases) total_for_state from total_disease group by state
    )
select *
from total_per_state

