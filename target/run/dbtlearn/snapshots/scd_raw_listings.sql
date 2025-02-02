
      update "DBT"."raw"."scd_raw_listings"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "scd_raw_listings__dbt_tmp134123791480" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "DBT"."raw"."scd_raw_listings".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "DBT"."raw"."scd_raw_listings".dbt_valid_to is null;
      


    insert into "DBT"."raw"."scd_raw_listings" ("id", "listing_url", "name", "room_type", "minimum_nights", "host_id", "price", "created_at", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."id",DBT_INTERNAL_SOURCE."listing_url",DBT_INTERNAL_SOURCE."name",DBT_INTERNAL_SOURCE."room_type",DBT_INTERNAL_SOURCE."minimum_nights",DBT_INTERNAL_SOURCE."host_id",DBT_INTERNAL_SOURCE."price",DBT_INTERNAL_SOURCE."created_at",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "scd_raw_listings__dbt_tmp134123791480" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  