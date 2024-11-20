-- CREATE USER user_wro IDENTIFIED BY oracle;

-- CREATE USER user_wwa IDENTIFIED BY oracle;

-- GRANT CONNECT TO user_wro;
-- GRANT RESOURCE TO user_wro;

-- GRANT CONNECT TO user_wwa;
-- GRANT RESOURCE TO user_wwa;

-- GRANT INSERT ANY TABLE TO user_wro;
-- GRANT UPDATE ANY TABLE TO user_wro;
-- GRANT DELETE ANY TABLE TO user_wro;
-- GRANT SELECT ANY TABLE TO user_wro;

-- GRANT INSERT ANY TABLE TO user_wwa;
-- GRANT UPDATE ANY TABLE TO user_wwa;
-- GRANT DELETE ANY TABLE TO user_wwa;
-- GRANT SELECT ANY TABLE TO user_wwa;

-- ALTER USER user_wro QUOTA UNLIMITED ON USERS;

-- ALTER USER user_wwa QUOTA UNLIMITED ON USERS;

-- GRANT CREATE DATABASE LINK TO user_wro;
-- GRANT CREATE DATABASE LINK TO user_wwa;

-- BEGIN
--    FOR r IN (SELECT table_name FROM all_tables WHERE owner = 'SCHEMA_X') LOOP
--       EXECUTE IMMEDIATE 'GRANT SELECT ON SCHEMA_X.' || r.table_name || ' TO user_wwa';
--    END LOOP;
-- END;
-- /

-- BEGIN
--    FOR r IN (SELECT table_name FROM all_tables WHERE owner = 'SCHEMA_X') LOOP
--       EXECUTE IMMEDIATE 'GRANT INSERT, UPDATE, DELETE ON SCHEMA_X.' || r.table_name || ' TO user_wwa';
--    END LOOP;
-- END;
-- /

GRANT SELECT ON Punkty_wspolpracujace TO USER_WWA;



