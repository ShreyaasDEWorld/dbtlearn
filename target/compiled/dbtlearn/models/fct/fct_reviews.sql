

WITH src_reviews AS (
  SELECT * FROM "DBT"."raw"."src_reviews"
)
SELECT 
  md5(cast(coalesce(cast(listing_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_date as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(reviewer_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_text as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as review_id,
  *
FROM src_reviews
WHERE review_text is not null

  
    AND review_date > (select max(review_date) from "DBT"."raw"."fct_reviews")
    
  
