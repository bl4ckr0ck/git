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