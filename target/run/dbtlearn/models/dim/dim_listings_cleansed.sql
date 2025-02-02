
  
    

  create  table "DBT"."raw"."dim_listings_cleansed__dbt_tmp"
  
  
    as
  
  (
    WITH src_listings AS (
    SELECT * FROM "DBT"."raw"."src_listings"
)
SELECT 
    listing_id,
    listing_name,
    room_type,
    CASE 
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights 
    END AS minimum_nights,
    host_id,
    ROUND(REPLACE(price_str, '$', '')::NUMERIC, 2) as price_str,
    created_at,
    updated_at
FROM src_listings
  );
  