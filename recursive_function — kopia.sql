create or replace function recursive_function (ct numeric(1000,1), pr numeric(1000,1))
returns table (counter numeric(1000,1), product numeric(1000,1))
language plpgsql

as $$
begin
    return query select ct, pr;
    if ct <10 then
        return query select * from recursive_function(ct+ 1, pr * (ct+ 1));
    end if;
end $$

