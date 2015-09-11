(select avg(ocena)
from dziekanat.studenci_kierunkow k left join dziekanat.oceny d
on k.id_kierunku_studiow=d.id_kierunku_studiow
where 
group by k.id_kierunku_studiow)