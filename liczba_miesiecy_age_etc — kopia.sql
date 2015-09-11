select cast(
extract(year from age(last_month,first_month))*12-1
as integer) as mths
from (
select cast(date_trunc('year',min(data_zaliczenia)) as date) as first_month,
cast(cast(date_trunc('year',max(data_zaliczenia))
as date) + interval '1 year'
as date) as last_month
from ocena
) x