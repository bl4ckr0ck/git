select s.nr_albumu, imie, nazwisko, colasc(avg(ocena)::varchar(4),0) as srednia, ks.nazwa_kierunku
from dziekanat.studenci s join dziekanat.studenci_kierunkow sk using(nr_albumu) 
left join dziekanat.oceny o on s.nr_albumu=o.nr_albumu
left join dziekanat.kierunki_studiow ks on ks.id_kierunku=sk.id_kierunku_studiow 
group by s.nr_albumu, ks.nazwa_kierunku
order by nazwisko asc