-- Tworzenie materializowanych widoków z odświeżaniem co minutę

-- CREATE MATERIALIZED VIEW Punkty_wspolpracujace_MV
-- REFRESH COMPLETE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS SELECT * FROM Punkty_wspolpracujace@link_to_db1;

-- CREATE MATERIALIZED VIEW Punkty_wspolpracujace_MV
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Punkty_wspolpracujace@link_to_db1;

-- CREATE MATERIALIZED VIEW Wypozyczenia_Warszawa
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Wypozyczenia@link_to_dbs1
-- WHERE id_punktu < 2;

-- CREATE MATERIALIZED VIEW Klienci_Warszawa
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Klienci@link_to_dbs1
-- WHERE id_punktu_fk < 2;

-- CREATE MATERIALIZED VIEW Pracownicy_Warszawa
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Pracownicy@link_to_dbs1
-- WHERE id_punktu < 2;

-- CREATE MATERIALIZED VIEW Szczegoly_Samochodu_Warszawa
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Szczegoly_Samochodu@link_to_dbs1
-- WHERE id_punktu < 2;

-- CREATE MATERIALIZED VIEW Typ_Samochodu_Warszawa
-- BUILD IMMEDIATE
-- REFRESH FAST START WITH SYSDATE NEXT SYSDATE + INTERVAL '10' SECOND
-- AS
-- SELECT *
-- FROM Typ_Samochodu@link_to_dbs1
-- WHERE id_punktu < 2;


