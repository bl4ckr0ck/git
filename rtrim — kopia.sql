select *
from ocena
where rtrim(to_char(data_zaliczenia,'month')) in('february', 'december')
	or rtrim(to_char(data_zaliczenia,'day'))='sunday'