-- Dodawanie rekordów do tabeli Punkty_wspolpracujace
INSERT INTO Punkty_wspolpracujace (id_punktu, nazwa_produktu, miasto) VALUES
(1, 'Punkt A', 'Warszawa'),
(2, 'Punkt B', 'Wrocław');

-- Dodawanie rekordów do tabeli Samochody
INSERT INTO Samochody (id_samochodu, nr_rejestracyjny, nazwa_typu, kategoria, marka, model, rok_produkcji, kolor, przebieg, id_punktu_fk) VALUES
(1, 'ABC123', 'Sedan', 'Osobowy', 'Toyota', 'Corolla', 2020, 'Czarny', '20000 km', 1),
(2, 'DEF456', 'SUV', 'Osobowy', 'Ford', 'Kuga', 2019, 'Biały', '30000 km', 2),
(3, 'GHI789', 'Kombi', 'Osobowy', 'Volkswagen', 'Passat', 2018, 'Srebrny', '40000 km', 1),
(4, 'JKL012', 'Hatchback', 'Osobowy', 'Opel', 'Astra', 2021, 'Czerwony', '10000 km', 2);

-- Dodawanie rekordów do tabeli Klienci
INSERT INTO Klienci (id_klienta, imie, nazwisko, email, id_punktu_fk) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', 1),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', 2),
(3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', 1),
(4, 'Katarzyna', 'Zielińska', 'katarzyna.zielinska@example.com', 2);

-- Dodawanie rekordów do tabeli Pracownicy
INSERT INTO Pracownicy (id_pracownika, imie, nazwisko, id_punktu_fk) VALUES
(1, 'Adam', 'Malinowski', 1),
(2, 'Beata', 'Kozłowska', 2),
(3, 'Tomasz', 'Wójcik', 1),
(4, 'Marta', 'Lewandowska', 2);

-- -- Dodawanie rekordów do tabeli Wypozyczenia
-- INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
-- (1, 1, 1, 1, '2024-01-01', '2024-01-05', 'Zwrócony'),
-- (2, 2, 2, 2, '2024-01-10', '2024-01-15', 'Zwrócony'),
-- (3, 3, 3, 3, '2024-02-01', '2024-02-05', 'Zwrócony'),
-- (4, 4, 4, 4, '2024-02-10', '2024-02-15', 'Zwrócony'),
-- (5, 1, 2, 1, '2024-03-01', '2024-03-05', 'W trakcie'),
-- (6, 2, 1, 2, '2024-03-10', '2024-03-15', 'Zwrócony'),
-- (7, 3, 4, 3, '2024-04-01', '2024-04-05', 'Zwrócony'),
-- (8, 4, 3, 4, '2024-04-10', '2024-04-15', 'Zwrócony'),
-- (9, 1, 4, 1, '2024-05-01', '2024-05-05', 'Zwrócony'),
-- (10, 2, 3, 2, '2024-05-10', '2024-05-15', 'Zwrócony');

-- Dodawanie rekordów do tabeli Wypozyczenia
INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(1, 1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(2, 2, 2, 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(3, 3, 3, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(4, 4, 4, 4, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(5, 1, 2, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'W trakcie');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(6, 2, 1, 2, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(7, 3, 4, 3, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Zwrócony');

INSERT INTO Wypozyczenia (id_wypozyczenia, id_samochodu_fk, id_klienta_fk, id_pracownika_fk, data_wypozyczenia, data_zwrotu, status) VALUES
(8, 4, 3, 4, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Zwrócony');

