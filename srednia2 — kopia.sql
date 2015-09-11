select round(avg(ocena),2)
from dziekanat.studenci_kierunkow sk inner join dziekanat.kierunki_studiow ks on sk.id_kierunku_studiow = ks.id_kierunku
natural left join dziekanat.oceny
where nr_albumu='19' and nazwa_kierunku='Ekonomia'
group by nr_albumu, nazwa_kierunku;