{{
    config(
        materialized='incremental'
        ,on_schema_change = 'append_new_columns'
        ,full_refresh =  false
    )
}}

select * from {{ref('stg_adventure_vendas_net')}}


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where id_venda > (select coalesce(max(id_venda),0) from {{ this }} )

{% endif %}