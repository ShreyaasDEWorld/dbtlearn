
SELECT
    *
FROM
    "DBT"."raw"."dim_listings_cleansed"
WHERE
    minimum_nights < 1
