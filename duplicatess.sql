select *
from dziekanat.adresy
where id_adresu not in (select max(id_adresu) from dziekanat.adresy group by miejscowosc)