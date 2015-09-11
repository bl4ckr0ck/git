create or replace function zysk (cena numeric(100,2)) 
returns numeric(100,2) 
language plpgsql stable as 
$$
begin
if cena<75.00 then 
return 0.05*cena;
elseif cena>=75.00 and cena <=110.00 then 
return 0.07*cena;
else return 0.08*cena;
end if;
end;
$$