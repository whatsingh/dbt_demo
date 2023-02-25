{{config(materialized = 'incremental')}}
SELECT geo_id,median_rent FROM `bigquery-public-data.census_bureau_acs.blockgroup_2010_5yr` 
where median_rent = 915.0 