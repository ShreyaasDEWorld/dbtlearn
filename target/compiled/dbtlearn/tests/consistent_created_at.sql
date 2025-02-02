SELECT * FROM "DBT"."raw"."dim_listings_cleansed" l
INNER JOIN "DBT"."raw"."fct_reviews" r
USING (listing_id)
WHERE l.created_at >= r.review_date