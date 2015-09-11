select studenci.nr_albumu, imie, nazwisko, avg(ocena)::varchar(4) as "średnia"
from dziekanat.studenci inner join dziekanat.oceny using(nr_albumu)
group by studenci.nr_albumu order by nr_albumu asc;