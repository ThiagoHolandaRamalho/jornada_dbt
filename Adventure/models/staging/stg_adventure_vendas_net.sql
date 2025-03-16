with tabela as (

    select 
    * 
    from {{source('AdventureWorksDW2019','vendas_net')}}

)


select * from tabela