-- Tworzenie tabeli Punkty_wspolpracujace
CREATE TABLE Punkty_wspolpracujace (
    id_punktu INT PRIMARY KEY,
    nazwa_produktu VARCHAR(255),
    miasto VARCHAR(255)
)

-- Tworzenie tabeli Klienci
CREATE TABLE Klienci (
    id_klienta INT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    email VARCHAR(255),
    id_punktu_fk INT,
    FOREIGN KEY (id_punktu_fk) REFERENCES Punkty_wspolpracujace(id_punktu)
)
PARTITION BY RANGE (id_punktu_fk) (
    PARTITION warszawa VALUES LESS THAN (2),
    PARTITION wroclaw VALUES LESS THAN (3)
);

-- Tworzenie tabeli Wypozyczenia
CREATE TABLE Wypozyczenia (
    id INT,
    id_samochodu INT,
    id_klienta INT,
    data_wypozyczenia DATE,
    data_zwrotu DATE,
    status VARCHAR(255),
    id_pracownika INT,
    id_punktu INT,
    PRIMARY KEY (id, id_punktu),
    FOREIGN KEY (id_samochodu) REFERENCES Typ_Samochodu(id),
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
    FOREIGN KEY (id_pracownika) REFERENCES Pracownicy(id),
    FOREIGN KEY (id_punktu) REFERENCES Punkty_wspolpracujace(id_punktu)
)
PARTITION BY RANGE (id_punktu) (
    PARTITION warszawa VALUES LESS THAN (2),
    PARTITION wroclaw VALUES LESS THAN (3)
);

-- Tworzenie tabeli Pracownicy
CREATE TABLE Pracownicy (
    id INT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    email VARCHAR(255),
    id_punktu INT,
    FOREIGN KEY (id_punktu) REFERENCES Punkty_wspolpracujace(id_punktu)
)
PARTITION BY RANGE (id_punktu) (
    PARTITION warszawa VALUES LESS THAN (2),
    PARTITION wroclaw VALUES LESS THAN (3)
);

-- Tworzenie tabeli Szczegoly_Samochodu
CREATE TABLE Szczegoly_Samochodu (
    id INT PRIMARY KEY,
    nazwa_typu VARCHAR(255),
    kategoria VARCHAR(255),
    marka VARCHAR(255),
    model VARCHAR(255),
    rok_produkcji INT,
    kolor VARCHAR(50),
    przebieg VARCHAR(50),
    id_punktu INT,
    FOREIGN KEY (id_punktu) REFERENCES Punkty_wspolpracujace(id_punktu)
)
PARTITION BY RANGE (id_punktu) (
    PARTITION warszawa VALUES LESS THAN (2),
    PARTITION wroclaw VALUES LESS THAN (3)
);

-- Tworzenie tabeli Typ_Samochodu
CREATE TABLE Typ_Samochodu (
    id INT PRIMARY KEY,
    nr_rejestracyjny VARCHAR(50),
    id_punktu INT,
    FOREIGN KEY (id_punktu) REFERENCES Punkty_wspolpracujace(id_punktu)
)
PARTITION BY RANGE (id_punktu) (
    PARTITION warszawa VALUES LESS THAN (2),
    PARTITION wroclaw VALUES LESS THAN (3)
);
