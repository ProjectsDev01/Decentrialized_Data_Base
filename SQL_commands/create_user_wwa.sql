-- CREATE USER user_wro IDENTIFIED BY oracle;

-- CREATE USER user_wwa IDENTIFIED BY oracle;

-- GRANT CONNECT TO user_wro;
-- GRANT RESOURCE TO user_wro;

-- GRANT CONNECT TO user_wwa;
-- GRANT RESOURCE TO user_wwa;

GRANT INSERT ANY TABLE TO user_wro;
GRANT UPDATE ANY TABLE TO user_wro;
GRANT DELETE ANY TABLE TO user_wro;
GRANT SELECT ANY TABLE TO user_wro;

GRANT INSERT ANY TABLE TO user_wwa;
GRANT UPDATE ANY TABLE TO user_wwa;
GRANT DELETE ANY TABLE TO user_wwa;
GRANT SELECT ANY TABLE TO user_wwa;