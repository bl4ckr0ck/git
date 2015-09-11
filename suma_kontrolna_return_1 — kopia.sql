CREATE OR REPLACE FUNCTION array_add(array12 int[]) RETURNS text AS $$
DECLARE
    result int[] := ARRAY[]::integer[];
    l int;
   array2 int[]:= array[1,3,7,9,1,3,7,9,1,3];
   array1 int[]:=array[]::integer[];	
   a int:=0;
   s int8 := 0;
  x int;
BEGIN

select array12[1:array_upper(array12, 1) - 1] into array1;

  l := array_length(array2, 1);

  SELECT array_agg(array1[i] * array2[i]) FROM generate_series(1, l) i INTO result;
  
FOREACH x IN ARRAY result
  LOOP
    s := s + x;
  END LOOP;
   a:= mod(10-mod(s,10),10);
  if a=array12[11] then
	return array12;
  else 
	return 0;

end if;
END;
$$ LANGUAGE plpgsql;