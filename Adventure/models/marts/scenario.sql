{{
    config(
        materialized='incremental'
        ,on_schema_change = 'append_new_columns'
        ,full_refresh =  true
    )
}}

select * from {{ref("stg_adventure_dim_scenario")}}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where ScenarioKey > (select coalesce(max(ScenarioKey),0) from {{ this }} )

{% endif %}