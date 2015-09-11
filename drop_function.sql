SELECT format('DROP FUNCTION %s(%s);'
             ,oid::regproc
             ,pg_get_function_identity_arguments(oid))
FROM   pg_proc
WHERE  proname = 'sqlf' -- name without schema-qualification
AND    pg_function_is_visible(oid)