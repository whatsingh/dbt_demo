
{{ config(materialized='table') }}

WITH TOTAL_DISEASE AS 
(SELECT STATE,disease,sum(cast (cases as numeric) ) total_cases FROM `bigquery-public-data.usa_contagious_disease.project_tycho_reports` 
where cases <> '\\N'
GROUP BY STATE,disease),
TOTAL_PER_STATE  AS
(SELECT STATE, SUM(TOTAL_CASES) TOTAL_FOR_STATE FROM TOTAL_DISEASE
GROUP BY STATE)
SELECT * FROM TOTAL_PER_STATE

