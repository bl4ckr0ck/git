create or replace function ala (int) returns text as $$
declare
PESEL1 char(11);
begin
select s.pesel from dziekanat.studenci s where s.nr_albumu=cast($1 as varchar(6)) into PESEL1;
return PESEL1;
end;
$$ language 'plpgsql';