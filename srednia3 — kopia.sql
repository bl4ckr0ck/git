create or replace function stypendium(album varchar(6), kierunek varchar(40))

returns numeric(6,2) as
$STYPENDIUM$
declare
	srednia numeric(3,2);
	stypendium numeric(6,2) :=0;
BEGIN
	
	select round(avg(o.ocena),2)
	from dziekanat.studenci s natural join dziekanat.studenci_kierunkow sk
	join dziekanat.kierunki_studiow ks on sk.id_kierunku_studiow=ks.id_kierunku
	join dziekanat.oceny o using(nr_albumu, id_kierunku_studiow)
	where s.nr_albumu=$1 and ks.nazwa_kierunku=$2;
	if srednia>4.00 then
		stypendium:= 5*(srednia-4.5)/0.01;
		
	elsif srednia>=4.5 then
		stypendium:= 250 + 10*(srednia-4.5)/0.01;
	elsif srednia >5 then
		stypendium :=1000;
	end if;
	return stypendium;
end;

$STYPENDIUM$ LANGUAGE 'plpgsql';
