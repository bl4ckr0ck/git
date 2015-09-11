SELECT attname FROM pg_attribute,pg_class WHERE attrelid=pg_class.oid AND relname='company' AND attstattarget <>0; 
