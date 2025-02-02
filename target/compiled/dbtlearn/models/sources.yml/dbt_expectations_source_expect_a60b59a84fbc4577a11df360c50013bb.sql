




    with grouped_expression as (
    select
        
        
    
  


    

coalesce(array_length((select regexp_matches(price, '^\\$[0-9][0-9\\.]+$', '')), 1), 0)


 > 0
 as expression


    from "DBT"."raw"."raw_listings"
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors




