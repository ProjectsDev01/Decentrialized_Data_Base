-- CREATE MATERIALIZED VIEW LOG ON Wypozyczenia
-- WITH ROWID, PRIMARY KEY, SEQUENCE (id_samochodu, id_klienta, data_wypozyczenia, data_zwrotu, status, id_pracownika)
-- INCLUDING NEW VALUES;

-- CREATE MATERIALIZED VIEW LOG ON Klienci
-- WITH ROWID, PRIMARY KEY, SEQUENCE (imie, nazwisko, email, id_punktu_fk)
-- INCLUDING NEW VALUES;

-- CREATE MATERIALIZED VIEW LOG ON Pracownicy
-- WITH ROWID, PRIMARY KEY, SEQUENCE (imie, nazwisko, email, id_punktu)
-- INCLUDING NEW VALUES;

-- CREATE MATERIALIZED VIEW LOG ON Szczegoly_Samochodu
-- WITH ROWID, PRIMARY KEY, SEQUENCE (nazwa_typu, kategoria, marka, model, rok_produkcji, kolor, przebieg, id_punktu)
-- INCLUDING NEW VALUES;

-- CREATE MATERIALIZED VIEW LOG ON Typ_Samochodu
-- WITH ROWID, PRIMARY KEY, SEQUENCE (nr_rejestracyjny, id_punktu)
-- INCLUDING NEW VALUES;

-- CREATE MATERIALIZED VIEW LOG ON Punkty_wspolpracujace
-- WITH ROWID, PRIMARY KEY, SEQUENCE (id_punktu, nazwa_produktu, miasto)
-- INCLUDING NEW VALUES;

