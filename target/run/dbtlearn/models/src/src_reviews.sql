
  
    

  create  table "DBT"."raw"."src_reviews__dbt_tmp"
  
  
    as
  
  (
    WITH raw_reviews AS (
    SELECT
        *
    FROM
        "DBT"."raw"."raw_reviews"
)
SELECT
    listing_id,
    review_date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
  );
  