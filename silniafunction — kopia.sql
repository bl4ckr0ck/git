CREATE OR REPLACE FUNCTION Silnia(n bigint)
RETURNs bigint as $$
declare
v_wynik bigint := 1;
BEGIN
IF n = 0 THEN RETURN 1; END IF;
FOR v_i IN 1..n LOOP
v_wynik := v_wynik * v_i;
END LOOP;
RETURN v_wynik;
END;
$$
language 'plpgsql'