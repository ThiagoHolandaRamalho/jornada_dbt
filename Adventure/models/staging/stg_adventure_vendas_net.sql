with tabela as (

    select 
    * 
    from {{ref("raw_adventure_vendas_net")}}

)

select * from tabela