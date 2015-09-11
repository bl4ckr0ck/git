select 
extract (year from sr_wiek)||' lat '||extract (month from sr_wiek)||' miesięcy '||extract (day from sr_wiek)||' dni'
 as format_interval,sr_wiek 
 from (SELECT avg(age(current_date,'1410-07-15'::date)) as sr_wiek) d