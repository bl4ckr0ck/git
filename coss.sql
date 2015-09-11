CREATE OR REPLACE FUNCTION roznosci.zapisz_studenta() RETURNS TRIGGER AS $operacje$

DECLARE
max_liczba_miejsc INT;
liczba_zapisanych INT;

BEGIN

SELECT liczba_miejsc INTO STRICT max_liczba_miejsc
FROM roznosci.limity_fakultetow WHERE id_fakultetu=NEW.id_fakultetu;

SELECT COUNT(*) INTO STRICT liczba_zapisanych
FROM dziekanat.zapisy WHERE id_fakultetu=NEW.id_fakultetu;

IF liczba_zapisanych < max_liczba_miejsc THEN
RETURN NEW;
END IF;

RETURN NULL;

END;

$operacje$ LANGUAGE plpgsql;

CREATE TRIGGER operacje_fakultety AFTER INSERT OR UPDATE
ON roznosci.limity_fakultetow FOR EACH ROW
EXECUTE PROCEDURE roznosci.zapisz_studenta();
thx

t1/2a

CREATE TABLE roznosci.logs 
(
nr_albumu CHARACTER VARYING(6), 
id_przedmiotu INTEGER, 
old_value NUMERIC(2,1), 
new_value NUMERIC(2,1), 
log_who VARCHAR(100), 
log_when TIMESTAMP
);

CREATE OR REPLACE FUNCTION roznosci.rejestruj_zmiany() RETURNS TRIGGER AS $operacje$

BEGIN

INSERT INTO roznosci.logs VALUES(OLD.nr_albumu, OLD.id_przedmiotu, OLD.ocena, NEW.ocena, user, now());
RETURN NEW;

END;
$operacje$ LANGUAGE plpgsql;

CREATE TRIGGER zmiana_oceny AFTER UPDATE
ON dziekanat.oceny FOR EACH ROW
EXECUTE PROCEDURE roznosci.rejestruj_zmiany();

UPDATE dziekanat.oceny SET ocena=3.0 WHERE nr_albumu='1' AND id_przedmiotu=1 AND termin_zaliczenia='I';