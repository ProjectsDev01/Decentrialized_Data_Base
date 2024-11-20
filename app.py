from flask import Flask, render_template, request, redirect, url_for
import cx_Oracle
import datetime

app = Flask(__name__)

# Konfiguracja połączenia do DB_1 (Wrocław)
DB_1_DSN = cx_Oracle.makedsn("46.60.16.247", 1539, service_name="freepdb1")
DB_1_CONNECTION = {
    'user': 'user_wro',
    'password': 'oracle',
    'dsn': DB_1_DSN
}

# Konfiguracja połączenia do DB_2 (Warszawa)
DB_2_DSN = cx_Oracle.makedsn("46.60.20.5", 1539, service_name="freepdb1")
DB_2_CONNECTION = {
    'user': 'user_wwa',
    'password': 'oracle',
    'dsn': DB_2_DSN
}


def get_db1_connection():
    return cx_Oracle.connect(**DB_1_CONNECTION)

def get_db2_connection():
    return cx_Oracle.connect(**DB_2_CONNECTION)

@app.route('/')
def index():
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()

    # Pobieranie klientów z Wrocławia
    cursor_db1.execute("""
        SELECT id_klienta, imie, nazwisko, email FROM Klienci
        WHERE id_punktu_fk >= 2
    """)
    klienci_db1 = cursor_db1.fetchall()

    # Pobieranie klientów z Warszawy (przekierowanie na Wrocław)
    cursor_db1.execute("""
        SELECT id_klienta, imie, nazwisko, email FROM Klienci
        WHERE id_punktu_fk < 2
    """)
    klienci_db2 = cursor_db1.fetchall()

    cursor_db1.close()
    conn_db1.close()

    return render_template('index.html', klienci_db1=klienci_db1, klienci_db2=klienci_db2)

@app.route('/pracownicy')
def pracownicy():
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()

    # Pobieranie pracowników z Wrocławia
    cursor_db1.execute("""
        SELECT id, imie, nazwisko, email, id_punktu FROM Pracownicy
        WHERE id_punktu >= 2
    """)
    pracownicy_db1 = cursor_db1.fetchall()

    # Pobieranie pracowników z Warszawy (przekierowanie na Wrocław)
    cursor_db1.execute("""
        SELECT id, imie, nazwisko, email, id_punktu FROM Pracownicy
        WHERE id_punktu < 2
    """)
    pracownicy_db2 = cursor_db1.fetchall()

    cursor_db1.close()
    conn_db1.close()

    return render_template('pracownicy.html', pracownicy_db1=pracownicy_db1, pracownicy_db2=pracownicy_db2)


@app.route('/dodaj_pracownika', methods=['GET', 'POST'])
def dodaj_pracownika():
    if request.method == 'POST':
        imie = request.form['imie']
        nazwisko = request.form['nazwisko']
        email = request.form['email']
        id_punktu = int(request.form['id_punktu'])

        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()

        # Pobieranie nowego id
        cursor_db1.execute("SELECT MAX(id) FROM Pracownicy")
        max_id = cursor_db1.fetchone()[0]
        new_id = 1 if max_id is None else max_id + 1

        cursor_db1.execute("""
            INSERT INTO Pracownicy (id, imie, nazwisko, email, id_punktu)
            VALUES (:id, :imie, :nazwisko, :email, :id_punktu)
        """, id=new_id, imie=imie, nazwisko=nazwisko, email=email, id_punktu=id_punktu)
        conn_db1.commit()

        cursor_db1.close()
        conn_db1.close()

        return redirect(url_for('pracownicy'))
    return render_template('dodaj_pracownika.html')

@app.route('/dodaj_samochod', methods=['GET', 'POST'])
def dodaj_samochod():
    if request.method == 'POST':
        nr_rejestracyjny = request.form['nr_rejestracyjny']
        nazwa_typu = request.form['nazwa_typu']
        kategoria = request.form['kategoria']
        marka = request.form['marka']
        model = request.form['model']
        rok_produkcji = int(request.form['rok_produkcji'])
        kolor = request.form['kolor']
        przebieg = request.form['przebieg']
        id_punktu = int(request.form['id_punktu'])

        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()

        # Pobieranie nowego id
        cursor_db1.execute("SELECT MAX(id) FROM Typ_Samochodu")
        max_id = cursor_db1.fetchone()[0]
        new_id = 1 if max_id is None else max_id + 1

        # Wstawianie danych
        cursor_db1.execute("""
            INSERT INTO Szczegoly_Samochodu (id, nazwa_typu, kategoria, marka, model, rok_produkcji, kolor, przebieg, id_punktu)
            VALUES (:id, :nazwa_typu, :kategoria, :marka, :model, :rok_produkcji, :kolor, :przebieg, :id_punktu)
        """, id=new_id, nazwa_typu=nazwa_typu, kategoria=kategoria, marka=marka, model=model,
           rok_produkcji=rok_produkcji, kolor=kolor, przebieg=przebieg, id_punktu=id_punktu)

        cursor_db1.execute("""
            INSERT INTO Typ_Samochodu (id, nr_rejestracyjny, id_punktu)
            VALUES (:id, :nr_rejestracyjny, :id_punktu)
        """, id=new_id, nr_rejestracyjny=nr_rejestracyjny, id_punktu=id_punktu)

        conn_db1.commit()
        cursor_db1.close()
        conn_db1.close()

        return redirect(url_for('samochody'))
    return render_template('dodaj_samochod.html')

@app.route('/usun_klienta/<int:id_klienta>/<int:id_punktu_fk>', methods=['POST'])
def usun_klienta(id_klienta, id_punktu_fk):
    try:
        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()

        # Usuwanie wypożyczeń i klienta
        cursor_db1.execute("""
            DELETE FROM Wypozyczenia WHERE id_klienta = :id_klienta
        """, id_klienta=id_klienta)

        cursor_db1.execute("""
            DELETE FROM Klienci WHERE id_klienta = :id_klienta
        """, id_klienta=id_klienta)

        conn_db1.commit()
        cursor_db1.close()
        conn_db1.close()

        return redirect(url_for('index'))
    except cx_Oracle.IntegrityError as e:
        error, = e.args
        return f"Error: {error.message} <a href='{url_for('index')}'>Back</a>"


@app.route('/usun_pracownika/<int:id>/<int:id_punktu>', methods=['GET', 'POST'])
def usun_pracownika(id, id_punktu):
    # Usuwanie pracownika z bazy Wrocław
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()

    cursor_db1.execute("""
        DELETE FROM Pracownicy WHERE id = :id
    """, id=id)

    conn_db1.commit()
    cursor_db1.close()
    conn_db1.close()

    return redirect(url_for('pracownicy'))



@app.route('/usun_samochod/<int:id>/<int:id_punktu>', methods=['GET', 'POST'])
def usun_samochod(id, id_punktu):
    # Usuwanie samochodu z bazy Wrocław
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()

    # Usuwanie z Typ_Samochodu
    cursor_db1.execute("""
        DELETE FROM Typ_Samochodu WHERE id = :id
    """, id=id)

    # Usuwanie z Szczegoly_Samochodu
    cursor_db1.execute("""
        DELETE FROM Szczegoly_Samochodu WHERE id = :id
    """, id=id)

    conn_db1.commit()
    cursor_db1.close()
    conn_db1.close()

    return redirect(url_for('samochody'))



@app.route('/dodaj_klienta', methods=['GET', 'POST'])
def dodaj_klienta():
    if request.method == 'POST':
        imie = request.form['imie']
        nazwisko = request.form['nazwisko']
        email = request.form['email']
        id_punktu_fk = int(request.form['id_punktu_fk'])

        # Dodawanie klienta do bazy Wrocław
        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()

        # Pobieranie nowego id_klienta
        cursor_db1.execute("SELECT MAX(id_klienta) FROM Klienci")
        max_id = cursor_db1.fetchone()[0]
        new_id = 1 if max_id is None else max_id + 1

        cursor_db1.execute("""
            INSERT INTO Klienci (id_klienta, imie, nazwisko, email, id_punktu_fk)
            VALUES (:id_klienta, :imie, :nazwisko, :email, :id_punktu_fk)
        """, id_klienta=new_id, imie=imie, nazwisko=nazwisko, email=email, id_punktu_fk=id_punktu_fk)

        conn_db1.commit()
        cursor_db1.close()
        conn_db1.close()

        return redirect(url_for('index'))
    return render_template('dodaj_klienta.html')

@app.route('/samochody')
def samochody():
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()

    # Pobieranie samochodów (Warszawa i Wrocław)
    query = """
        SELECT s.id, s.nr_rejestracyjny, sz.marka, sz.model, sz.kolor,
               CASE WHEN w.id_samochodu IS NULL THEN 'Dostępny' ELSE 'Wypożyczony' END AS status,
               s.id_punktu,
               w.id AS id_wypozyczenia
        FROM Typ_Samochodu s
        JOIN Szczegoly_Samochodu sz ON s.id = sz.id
        LEFT JOIN Wypozyczenia w ON s.id = w.id_samochodu AND w.data_zwrotu IS NULL
    """
    cursor_db1.execute(query)
    samochody = cursor_db1.fetchall()

    cursor_db1.close()
    conn_db1.close()

    return render_template('samochody.html', samochody=samochody)


@app.route('/dodaj_wypozyczenie', methods=['GET', 'POST'])
def dodaj_wypozyczenie():
    if request.method == 'POST':
        id_samochodu = int(request.form['id_samochodu'])
        id_klienta = int(request.form['id_klienta'])
        id_pracownika = int(request.form['id_pracownika'])
        id_punktu = int(request.form['id_punktu'])

        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()

        # Sprawdzenie dostępności samochodu
        cursor_db1.execute("""
            SELECT COUNT(*) FROM Wypozyczenia
            WHERE id_samochodu = :id_samochodu AND data_zwrotu IS NULL
        """, id_samochodu=id_samochodu)
        is_rented = cursor_db1.fetchone()[0]

        if is_rented > 0:
            cursor_db1.close()
            conn_db1.close()
            return 'Samochód jest już wypożyczony! <a href="/dodaj_wypozyczenie">Powrót</a>'

        # Pobieranie nowego id wypożyczenia
        cursor_db1.execute("SELECT MAX(id) FROM Wypozyczenia")
        max_id = cursor_db1.fetchone()[0]
        if max_id is None:
            new_id = 1
        else:
            new_id = max_id + 1

        # Dodawanie wypożyczenia
        cursor_db1.execute("""
            INSERT INTO Wypozyczenia (id, id_samochodu, id_klienta, data_wypozyczenia, status, id_pracownika, id_punktu)
            VALUES (:id, :id_samochodu, :id_klienta, :data_wypozyczenia, :status, :id_pracownika, :id_punktu)
        """, id=new_id, id_samochodu=id_samochodu, id_klienta=id_klienta,
           data_wypozyczenia=datetime.datetime.now(), status='Wypożyczony',
           id_pracownika=id_pracownika, id_punktu=id_punktu)
        conn_db1.commit()
        cursor_db1.close()
        conn_db1.close()

        return redirect(url_for('samochody'))
    else:
        # Pobieranie listy dostępnych samochodów
        conn_db1 = get_db1_connection()
        cursor_db1 = conn_db1.cursor()
        cursor_db1.execute("""
            SELECT s.id, s.nr_rejestracyjny FROM Typ_Samochodu s
            LEFT JOIN Wypozyczenia w ON s.id = w.id_samochodu AND w.data_zwrotu IS NULL
            WHERE w.id_samochodu IS NULL
        """)
        samochody = cursor_db1.fetchall()

        # Pobieranie listy klientów
        cursor_db1.execute("SELECT id_klienta, imie, nazwisko FROM Klienci")
        klienci = cursor_db1.fetchall()

        # Pobieranie listy pracowników
        cursor_db1.execute("SELECT id, imie, nazwisko FROM Pracownicy")
        pracownicy = cursor_db1.fetchall()

        cursor_db1.close()
        conn_db1.close()

        return render_template('dodaj_wypozyczenie.html', samochody=samochody, klienci=klienci, pracownicy=pracownicy)


@app.route('/zwroc_samochod/<int:id_wypozyczenia>')
def zwroc_samochod(id_wypozyczenia):
    # Zwracanie samochodu
    conn_db1 = get_db1_connection()
    cursor_db1 = conn_db1.cursor()
    cursor_db1.execute("""
        UPDATE Wypozyczenia
        SET data_zwrotu = :data_zwrotu, status = 'Zwrócony'
        WHERE id = :id_wypozyczenia
    """, data_zwrotu=datetime.datetime.now(), id_wypozyczenia=id_wypozyczenia)
    conn_db1.commit()
    cursor_db1.close()
    conn_db1.close()

    return redirect(url_for('samochody'))


if __name__ == '__main__':
    app.run(debug=True)