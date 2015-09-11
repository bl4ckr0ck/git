CREATE OR REPLACE FUNCTION suma_pesel (int)
RETURNS text as $$
declare
nr varchar(6);
SUMA int:=0;
PESEL1 char(11);
nr_albumu int:=0;
BEGIN
select s.pesel into PESEL1 from dziekanat.studenci s where s.nr_albumu=cast($1 as varchar(6));
IF LENGTH(PESEL1) <> 11 THEN
RETURN 'N';
END IF;
SUMA := MOD(10 -
MOD((SUBSTRing(PESEL1, 1, 1))::int * 1
+(SUBSTRing(PESEL1, 2, 1))::int * 3
+(SUBSTRing(PESEL1, 3, 1))::int * 7
+(SUBSTRing(PESEL1, 4, 1))::int * 9
+(SUBSTRing(PESEL1, 5, 1))::int * 1
+(SUBSTRing(PESEL1, 6, 1))::int * 3
+(SUBSTRing(PESEL1, 7, 1))::int * 7
+(SUBSTRing(PESEL1, 8, 1))::int * 9
+(SUBSTRing(PESEL1, 9, 1))::int * 1
+(SUBSTRing(PESEL1, 10, 1))::int * 3
,10)
,10);

if SUMA = SUBSTR(PESEL1, 11, 1)::int THEN

RETURN PESEL1;
ELSE
RETURN 'N';
END IF;
END;
$$
language 'plpgsql';