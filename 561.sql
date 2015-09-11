select to_char((date_trunc('week',current_date)::date) + i,'Day'),current_date+i as dat
from generate_series(0,364) i

where extract(DAY from current_date+i) = 13 
and extract(day from to_char((date_trunc('week',current_date)::date) + i,'Day'))='Monday'