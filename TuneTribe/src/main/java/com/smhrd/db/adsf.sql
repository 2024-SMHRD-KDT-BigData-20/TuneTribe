SELECT fes_st_dt FROM festivals WHERE fes_name LIKE '%과천%';
SELECT * FROM festivals WHERE fes_name LIKE '%' || #{searchText} || '%'