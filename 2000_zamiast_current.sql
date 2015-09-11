select count(to_char((date_trunc('week',date '2000-01-01')::date) + i,'Day'))
 from generate_series(0,366) i
where ((date_trunc('week',date '2000-01-01')::date) + i) ::text like '%13' and
rtrim(to_char(((date_trunc('week',date '2000-01-01')::date) + i),'day'))='friday'