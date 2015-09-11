CREATE OR REPLACE FUNCTION suma_nip (bigint)
RETURNS bigint as $$
declare
SUMA int:=0;
nip varchar(10)=$1;
nr_albumu int:=0;
BEGIN
IF LENGTH(nip) <> 10 THEN
RETURN 0;
END IF;

SUMA = Mod((SUBSTRing(nip, 1, 1))::int * 1
+(SUBSTRing(nip, 2, 1))::int * 3
+(SUBSTRing(nip, 3, 1))::int * 7
+(SUBSTRing(nip, 4, 1))::int * 9
+(SUBSTRing(nip, 5, 1))::int * 1
+(SUBSTRing(nip, 6, 1))::int * 3
+(SUBSTRing(nip, 7, 1))::int * 7
+(SUBSTRing(nip, 8, 1))::int * 9
+(SUBSTRing(nip, 9, 1))::int * 1
+0,11);
if (SUBSTRing(nip, 9, 1))::int=suma then
return 1;
else
return 0;
end if;
END;
$$
language 'plpgsql';