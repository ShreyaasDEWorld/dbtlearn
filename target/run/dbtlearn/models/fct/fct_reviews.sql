
      insert into "DBT"."raw"."fct_reviews" ("review_id", "listing_id", "review_date", "reviewer_name", "review_text", "review_sentiment")
    (
        select "review_id", "listing_id", "review_date", "reviewer_name", "review_text", "review_sentiment"
        from "fct_reviews__dbt_tmp125534563206"
    )


  