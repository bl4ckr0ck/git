
CREATE OR REPLACE FUNCTION getAllFoo(int) RETURNS void AS
$BODY$
DECLARE
BEGIN
if 
for i in 1..20 loop
       UPDATE foo set fooid= fooid-1 where foosubid<=$1;
        RETURN;
end loop;
END
$BODY$
LANGUAGE 'plpgsql' ;

SELECT * FROM getallfoo(2);