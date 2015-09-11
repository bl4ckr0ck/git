SELECT CASE WHEN EXISTS (TABLE xyz EXCEPT TABLE foo)
              OR EXISTS (TABLE foo EXCEPT TABLE xyz)
            THEN 'different'
            ELSE 'same'
       END AS result ;