
  
    

  create  table "DBT"."raw"."src_hosts__dbt_tmp"
  
  
    as
  
  (
    WITH raw_hosts AS (
    SELECT
        *
    FROM
       "DBT"."raw"."raw_hosts"
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
  );
  