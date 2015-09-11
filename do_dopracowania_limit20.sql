create or replace function liczba(int) returns table(years date) as $$
select (year1::date) 
FROM generate_series('2015-05-01', '289999-05-01', INTERVAL '1 year') year1
where to_char(year1, 'dy')='wed'
group by year1  
order by 1 asc
limit $1;
$$ language 'sql';