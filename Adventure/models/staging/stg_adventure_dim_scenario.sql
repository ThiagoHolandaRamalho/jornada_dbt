
with tabela as (

    select * from {{source('AdventureWorksDW2019','DimScenarioTHR2')}}

)
select * from tabela
