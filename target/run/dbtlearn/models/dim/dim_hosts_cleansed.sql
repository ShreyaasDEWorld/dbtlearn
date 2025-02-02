
  
    

  create  table "DBT"."raw"."dim_hosts_cleansed__dbt_tmp"
  
  
    as
  
  (
    WITH src_hosts AS (
    SELECT * FROM "DBT"."raw"."src_hosts"
)
SELECT 
    host_id,
    COALESCE(host_name, 'Anonymous') AS name,
    is_superhost,
    created_at,
    updated_at
from src_hosts
  );
  