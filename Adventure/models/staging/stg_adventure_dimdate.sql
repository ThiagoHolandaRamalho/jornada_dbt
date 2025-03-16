with tabela as (
select 


"DateKey"  as data, 
"FullDateAlternateKey" as data_iso,
"MonthNumberOfYear" nrmes,
"CalendarQuarter" trimestre,
"CalendarYear" ano,
"CalendarSemester" semestre

from 
{{ref('raw_adventure_dimdate')}}


)

select * from tabela