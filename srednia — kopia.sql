select -- s.nr_albumu, ks.nazwa_kierunku, o.ocena ,
      round(avg(o.ocena),2)
from dziekanat.studenci s natural join dziekanat.studenci_kierunkow sk
join dziekanat.kierunki_studiow ks on sk.id_kierunku_studiow=ks.id_kierunku
join dziekanat.oceny o using(nr_albumu, id_kierunku_studiow)
where s.nr_albumu='8' and ks.nazwa_kierunku='Informatyka';