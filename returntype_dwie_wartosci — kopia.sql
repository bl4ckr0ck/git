create type returntype as (stypendium int, a date);
create or replace function stypendium2(varchar(20)) returns table(b.stypendium int, b.a date ) as 
$STYPENDIUN$
declare 
srednia float;
b returntype;
begin
	b.a=now();
	select round(avg(o.ocena),2) into srednia
	from dziekanat.studenci s left join dziekanat.oceny o on(s.nr_albumu=o.nr_albumu)
	where s.nr_albumu=$1;
		if srednia<=4.00 then
			b.stypendium:=0;
		elsif srednia <=4.50 then
			b.stypendium:=((srednia-4.00)*100)*5;
		elsif srednia <5.00 then
			b.stypendium:=250+((srednia-4.00)*100)*10;
		elsif srednia=5.00 then
			b.stypendium:=1000;
		else 
			b.stypendium:=0;
		end if;
			return b;
	END;
$STYPENDIUN$ language 'plpgsql';