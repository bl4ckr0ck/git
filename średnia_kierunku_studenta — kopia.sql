select s.nr_albumu, s.imie, s.nazwisko, p.id_przedmiotu, p.nazwa_przedmiotu,ks.nazwa_kierunku,
(select round(avg(z.ocena),2) from dziekanat.oceny z where z.id_przedmiotu=p.id_przedmiotu and z.nr_albumu=s.nr_albumu )as Średnia_Przedmiotu_dla_studenta , 
(select round(avg(z.ocena),2) from dziekanat.oceny z where z.nr_albumu=s.nr_albumu) as Średnia_Studenta,
(select round(avg(x.ocena),2) from dziekanat.oceny x where x.id_kierunku_studiow = sk.id_kierunku_studiow) as Średnia_Kierunku,
(select count(y.ocena) from dziekanat.oceny y where y.nr_albumu=s.nr_albumu and y.id_przedmiotu=p.id_przedmiotu) as liczba_ocen, 
(select round(avg(t.ocena),2) from dziekanat.oceny t where t.id_przedmiotu=p.id_przedmiotu) as średnia_przedmiotu
from dziekanat.studenci s inner join dziekanat.oceny o using(nr_albumu) 
inner join dziekanat.przedmioty p using (id_przedmiotu)
inner join dziekanat.studenci_kierunkow sk using(nr_albumu) 
left join dziekanat.kierunki_studiow ks on sk.id_kierunku_studiow=ks.id_kierunku   
group by s.nr_albumu, p.id_przedmiotu, ks.nazwa_kierunku, sk.id_kierunku_studiow
order by s.nr_albumu asc;