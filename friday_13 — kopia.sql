

create or replace function zag(_data date) returns int as $$
declare
licz int:=0;
begin
select count(to_char((date_trunc('week',$1)::date) + i,'Day')) into licz
 from generate_series(0,366) i
where ((date_trunc('week',$1)::date) + i) ::text like '%13' and
rtrim(to_char(((date_trunc('week',$1)::date) + i),'day'))='friday';
return licz;
end;
$$ language 'plpgsql';