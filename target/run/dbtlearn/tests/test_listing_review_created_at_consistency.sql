select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with listing_reviews as
(
	select
	rl.id as listing_id,
	rl.created_at  as listing_created_at,
	rr.review_date as review_created_at
	from raw.raw_listings rl left join raw.raw_reviews rr
	on rl.id=rr.listing_id
	--where rl.created_at > rr.review_date
)

select 
listing_id,
listing_created_at,
review_created_at
from 
listing_reviews
where review_created_at < listing_created_at
      
    ) dbt_internal_test