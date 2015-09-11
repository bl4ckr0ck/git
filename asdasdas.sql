select s.nr_albumu, imie, nazwisko, avg(ocena), ks.nazwa_kierunku, 

(select avg(ocena)
from dziekanat.studenci_kierunkow k left join dziekanat.oceny d
on k.id_kierunku_studiow=d.id_kierunku_studiow
where d.id_kierunku_studiow=sk.id_kierunku_studiow
group by k.id_kierunku_studiow, sk.id_kierunku_studiow)

from dziekanat.studenci s join dziekanat.studenci_kierunkow sk using(nr_albumu) 
left join dziekanat.oceny o on s.nr_albumu=o.nr_albumu
left join dziekanat.kierunki_studiow ks on ks.id_kierunku=sk.id_kierunku_studiow 


group by s.nr_albumu, ks.nazwa_kierunku
order by nazwisko asc;