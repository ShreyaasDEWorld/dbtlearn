
WITH fct_reviews AS (
    select * from "DBT"."raw"."fct_reviews"
),
full_moon_dates AS (
    select * from "DBT"."raw"."seed_full_moon_dates"
)
select r.*,
case
when fm.full_moon_date IS NULL THEN 'not full moon'
else 'full moon'
END AS is_full_moon
from
fct_reviews r
left join full_moon_dates fm 
--on (TO_DATE(r.review_date) = DATEADD(DAY,1, fm.full_moon_date))
ON (r.review_date::date = fm.full_moon_date + INTERVAL '1 day')