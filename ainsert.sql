create or replace function ainsert() returns trigger as $$
declare
z int=0; -- zerowanie zmiennej z
begin
select id from xyz where id=1 into z; -- przypisanie id o numerze 1 do zmiennej z
if z=1 then --sprawdzenie czy istnieje tabela
  delete from xyz; --czyszczenie tabeli xyz
 end if;
 
  ALTER SEQUENCE xyz_id_seq RESTART WITH 1; -- xyz:table id:column seq:sequence -komenda odpowiadajaca za restowanie kolumny id 
  --do poczatkowej numeracji od 1 
  insert into xyz(wart, fooname) select foosubid, fooname from foo order by foosubid desc limit 4; --przepisanie zawartosci tabeli foo do tabeli xyz
  --w porzadku malejacym wartosc kolumny wart, i  
return new;
end;
$$
language 'plpgsql';