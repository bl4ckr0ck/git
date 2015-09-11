select adresy.id_adresu,adresy.miejscowosc from dziekanat.adresy
    where not exists (select 1
                      from dziekanat.adresy t2
                      where t2.id_adresu <> adresy.id_adresu and
                            t2.miejscowosc= adresy.miejscowosc
                     ) ;