select s.nr_albumu, sk.id_kierunku_studiow from dziekanat.studenci s left join dziekanat.oceny o on(s.nr_albumu=o.nr_albumu)
left join dziekanat.studenci_kierunkow sk on (sk.nr_albumu=s.nr_albumu and sk.id_kierunku_studiow=o.id_kierunku_studiow)
 join dziekanat.kierunki_studiow ks on (sk.id_kierunku_studiow=ks.id_kierunku and o.id_kierunku_studiow=ks.id_kierunku)
where ks.nazwa_kierunku in ('Informatyka', 'Matematyka') 
 group by s.nr_albumu, sk.id_kierunku_studiow
 