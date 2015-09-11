SELECT DISTINCT ON (2) an.id_adresu, au.miejscowosc
FROM   dziekanat.adresy an
LEFT   JOIN dziekanat.adresy au ON an.id_adresu = au.id_adresu;
