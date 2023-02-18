
{{ config(materialized='view') }}

select * from {{ref('stg_disease_total')}}