SELECT DISTINCT nazwa_fakultetu, date(data_czas_zapisu), count(nr_albumu) 

FROM dziekanat.fakultety NATURAL JOIN dziekanat.zapisy

GROUP BY nazwa_fakultetu, data_czas_zapisu, nr_albumu
HAVING date(dat)