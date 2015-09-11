create or replace function upd_book(log_in integer, p_title text, p_author text)
returns void as
$$
update new_book
set title =$2,
author =$3
where id=$1;
$$
language 'sql' volatile;


select upd_book(1,'Twilight 2', 'Stephanie Mayer');

select* from new_book;

select ins_book('Inferno', 'Dan Brown') as new_id;

select ins_book('Twilight', 'Stephanie Mayer') as new_id;
create or replace function ret_books(p_title varchar)
returns table (id int, title text, author text) as 
$$ 
select id, title, author
from new_book
where title like $1;
$$
language 'sql' volatile;


select * from ret_books('%Twilight%');


create or replace function ret_books_out(p_title varchar, OUT p_id int, OUT title text, OUT p_author text)
returns setof record as
$$
select *
from new_book
where title like $1;
$$
language 'sql' stable;
select * from ret_books_out('%Twilight%');


create or replace function ret_books_com(p_title text)
returns setof new_book as 
$$
select *
from new_book
where title like $1;
$$
language 'sql' stable;

select * from ret_books_com('%Twilight%');