BEGIN
   -- Odświeżanie widoków FAST
   DBMS_MVIEW.REFRESH('Punkty_wspolpracujace_MV', 'FAST');
   DBMS_MVIEW.REFRESH('Wypozyczenia_Warszawa', 'FAST');
   DBMS_MVIEW.REFRESH('Klienci_Warszawa', 'FAST');
   DBMS_MVIEW.REFRESH('Pracownicy_Warszawa', 'FAST');
   DBMS_MVIEW.REFRESH('Szczegoly_Samochodu_Warszawa', 'FAST');
   DBMS_MVIEW.REFRESH('Typ_Samochodu_Warszawa', 'FAST');
   
   -- Odświeżanie widoku COMPLETE (harmonogram odświeżania)
   DBMS_MVIEW.REFRESH('Punkty_wspolpracujace_mv', 'COMPLETE');
END;
/
