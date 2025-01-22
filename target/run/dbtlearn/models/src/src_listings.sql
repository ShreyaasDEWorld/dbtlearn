
  
    

  create  table "DBT"."raw"."src_listings__dbt_tmp"
  
  
    as
  
  (
    -- import raw_listings
WITH raw_listings AS (
        SELECT * FROM "DBT"."raw"."raw_listings"
)
SELECT 
   id AS listing_id,
   listing_url,
   name AS listing_name,
   room_type,
   minimum_nights,
   host_id,
   price AS price_str,
   created_at,
   updated_at
FROM raw_listings
  );
  