select s.*
from dziekanat.studenci s, dziekanat.studenci p
where p.imie=s.imie and s.nr_albumu!=p.nr_albumu;