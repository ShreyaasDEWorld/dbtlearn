
      update "DBT"."raw"."scd_raw_hosts"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "scd_raw_hosts__dbt_tmp134123536493" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "DBT"."raw"."scd_raw_hosts".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "DBT"."raw"."scd_raw_hosts".dbt_valid_to is null;
      


    insert into "DBT"."raw"."scd_raw_hosts" ("id", "name", "is_superhost", "created_at", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."id",DBT_INTERNAL_SOURCE."name",DBT_INTERNAL_SOURCE."is_superhost",DBT_INTERNAL_SOURCE."created_at",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "scd_raw_hosts__dbt_tmp134123536493" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  