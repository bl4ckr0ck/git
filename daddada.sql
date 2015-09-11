SELECT 
   nr_albumu ,imie, nazwisko
FROM 
  dziekanat.studenci as s
WHERE (select avg(ocena) 
	from dziekanat.oceny as o natural join 
		dziekanat.kierunki_studiow as dks
		    WHERE s.nr_albumu= o.nr_albumu and dks.nazwa_kierunku='Informatyka')>3.5 
and
(select avg(ocena) 
	from dziekanat.oceny as o natural join 
		dziekanat.kierunki_studiow as dks
		    WHERE s.nr_albumu= o.nr_albumu and dks.nazwa_kierunku='Informatyka')<4.0