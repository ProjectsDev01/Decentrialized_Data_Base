INSERT INTO Punkty_wspolpracujace (id_punktu, nazwa_produktu, miasto) VALUES
(1, 'Punkt Warszawa', 'Warszawa'),
(2, 'Punkt Wrocław', 'Wrocław');

INSERT INTO Klienci (id_klienta, imie, nazwisko, email, id_punktu_fk) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', 1),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', 2),
(3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', 1),
(4, 'Katarzyna', 'Zielińska', 'katarzyna.zielinska@example.com', 2);

INSERT INTO Pracownicy (id, imie, nazwisko, email, id_punktu) VALUES
(1, 'Adam', 'Malinowski', 'adam.malinowski@example.com', 1),
(2, 'Beata', 'Kozłowska', 'beata.kozlowska@example.com', 2),
(3, 'Tomasz', 'Wójcik', 'tomasz.wojcik@example.com', 1),
(4, 'Marta', 'Lewandowska', 'marta.lewandowska@example.com', 2);

INSERT INTO Typ_Samochodu (id, nr_rejestracyjny, id_punktu) VALUES
(1, 'WA12345', 1),
(2, 'WR67890', 2),
(3, 'WA54321', 1),
(4, 'WR09876', 2);

INSERT INTO Szczegoly_Samochodu (id, nazwa_typu, kategoria, marka, model, rok_produkcji, kolor, przebieg, id_punktu) VALUES
(1, 'Sedan', 'Osobowy', 'Toyota', 'Corolla', 2020, 'Czarny', '50000', 1),
(2, 'SUV', 'Osobowy', 'Ford', 'Kuga', 2019, 'Biały', '60000', 2),
(3, 'Hatchback', 'Osobowy', 'Volkswagen', 'Golf', 2018, 'Srebrny', '45000', 1),
(4, 'Kombi', 'Osobowy', 'Opel', 'Insignia', 2021, 'Czerwony', '30000', 2);

INSERT INTO Wypozyczenia (id, id_samochodu, id_klienta, data_wypozyczenia, data_zwrotu, status, id_pracownika, id_punktu) VALUES
(1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Zwrócony', 1, 1),
(2, 2, 2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'Zwrócony', 2, 2),
(3, 3, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'W trakcie', 3, 1),
(4, 4, 4, TO_DATE('2024-02-15', 'YYYY-MM-DD'), NULL, 'W trakcie', 4, 2);

