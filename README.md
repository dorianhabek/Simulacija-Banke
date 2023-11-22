Dobrodošli u PLSQL projekt Simulacija banke.


Svrha projekta je prikaz mog znanja o korištenju PLSQL jezika i rad u Oracle bazi podataka.


Zamisao projekta je stvaranje djelomične funkcionalnosti banke sličnom stvarnom životu.


Projekt čine sql file-ovi u obliku anonimnih blokova, paketa, stored i stand alone procedura i funkcija.



UVOD U PROJEKT

Od početka projekta pa do pisanja ove dokumentacije, izvodile su se razne promjene u repozitoriju kako bi se poboljšao dizajn, integritet i funkcionalnost baze.


Projekt se sastoji od 9 međusobno povezanih tablica te od 2 tablice koje nisu vezane foreign keyom za ostale tablice.

Na primjeru dijagrama možemo vidjeti njihovu povezanost


![Screenshot 2023-11-22 183155](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/44895ec1-6112-4828-b3f1-a892180c1360)



Primjer iz SQL Developera



![Screenshot 2023-11-22 202350](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/73047701-8de3-4676-8734-4a40d1ce398c)



Kao što možemo vidjeti tablica klijenti sastoji se od primarnog ključa id_klijenta koji je i foreign key u tablicama detalji_klijenta, krediti i računi.
Uz pomoć foreign ključa poboljšavamo performans ,osiguravamo točan unos podataka u tablice te ojačavamo integritet.
Bitno je pripaziti na parent child odnose prilikom unosa kako se ne bih javila pogreška ORA-02291.
Ta pogreška se javlja ako prije unosimo podatke u tablicu s foreign ključem umjesto tablice s primarnim ključem.

Također, ako imamo foreign key constraints prilikom stvaranja tablica moramo pripaziti na redoslijed.
Kod i redoslijed stvaranja tablica i početnog inserta nalazi se na sljedećim linkovima


https://github.com/dorianhabek/Simulacija-Banke/blob/90bd542ffa2aeb0b330e7af99ccc501f3989506c/Create%20tables/Stvaranje%20tablica.sql


https://github.com/dorianhabek/Simulacija-Banke/blob/90bd542ffa2aeb0b330e7af99ccc501f3989506c/Insert%20podataka/Po%C4%8Detni%20insert.sql


Uz početni insert navedene su određene sekvence.


Sekvence nam pomažu prilikom inserta podataka te ne moramo razmišljati koji je sljedeći id klijenta nego nam sekvenca sama unosi.


![Screenshot 2023-11-22 203158](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/733de479-8f91-4c3c-8e72-736c6d960b16)



Kao što možemo vidjeti sekvenca pk_id_klij namijenjena je za primarni ključ id_klijenta u tablici klijenti.
Započinje s vrijednosti 1 te se povećava s 1, a navodimo ju kao pk_id_klij.nextval.


TESTIRANJE PROJEKTA

Ako želite testirati projekt te točnost dohvata i izmijene podataka uz navedene sql file-ove u repozitoriju, najprije morate skinuti Oracle bazu podataka i editor SQL Developer.
Tijekom instalacije baze bitno je zapisati pluggable database informacije koje se unose tijekom stvaranje konekcije.
Moj savjet je napraviti sys usera, za kojeg također stvarate lozinku tijekom instalacije baze.
Zatim napraviti svog usera te mu dopustiti sve privilegije


![Screenshot 2023-11-22 203710](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/a90c11b9-60f2-4efd-9b88-becfd03fd7c7)



U service name upisujete pluggable database podatke.


![Screenshot 2023-11-22 204209](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/92b1a896-749b-4f7c-8c01-4948283f0ebf)



![Screenshot 2023-11-22 204038](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/7e6007e1-4f9e-48e1-9df3-a8ad6eb2a63a)




Ako želite raditi kao sys, nedostatak toga je što je po defaultu napravljeno jako puno tablica te je snalaženje znatno teže.

Nakon što ste prošli sve korake, kopirajte kod za stvaranje tablica i početni insert.
https://github.com/dorianhabek/Simulacija-Banke/blob/90bd542ffa2aeb0b330e7af99ccc501f3989506c/Create%20tables/Stvaranje%20tablica.sql

https://github.com/dorianhabek/Simulacija-Banke/blob/90bd542ffa2aeb0b330e7af99ccc501f3989506c/Insert%20podataka/Po%C4%8Detni%20insert.sql

Ako nije bilo problema sa stvaranjem i insertom, vrijeme je za provjeru točnosti dohvata i promijene podataka.

PRIMJERI

Kao što vidimo postoje dohvati podataka pod određenim brojem Issuea, np pod issue #1 traženo je napraviti proceduru koja dohvaća podatke o klijentu te o broju računa, balans i datum stvaranja računa uz parametar id_klijenta = 3.
Uz korištenje recorda, nested table-a i kursora omogućavamo RDBMS-u optimalni put i brzinu do željenih podataka.


![Screenshot 2023-11-22 185220](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/3c816a86-3dde-403e-96ac-16ddc4281476)



U sljedećem primjeru tražena je procedura koja dohvaća podatke o zaposleniku koji je otvorio određeni račun klijentu.
U ovom slučaju bilo je potrebno u kursoru koristiti multiple join jer se podaci nalaze u 3 različite tablice.


![Screenshot 2023-11-22 185732](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/d499dfc8-689a-4ea5-84ac-4b76b67cb3dc)



PAKETI

Paketi su zapravo kontejneri koji grupiraju različite procedure,funkcije ili potprograme
Prednost paketa je grupiranje i manipulacija objekta, enkapsulacija, performans i funkcionalnost
Ukratko svaki korisnik ima PGA (private global area) te se svaka funkcija i procedura skladišti u PGA
Kada se pozivaju učitavaju se u PGA te se izvršava kod, samim time ako se puno puta pozivaju uzimaju dosta memorije.
Ukoliko se poziva iz paketa, učitava se u SGA(system global area), to je memorija koja se dijeli sa svim korisnicima te iskorištava puno manje memorije i samim time pozivanje objekta iz paketa poboljšava se performans.

U projektu je napravljen paket za obračun i isplatu plače zaposlenicima
U specifikaciji paketa navode se funkcije, procedure ili neke varijable, sve što je u specifikaciji je public dok je deklaracija u tijelu paketa private.
U ovom slučaju paket se sastoji od funkcije obračun plače i procedure unos plače
Funkcija obračunava bruto plaču kroz porezne razrede navedene u tablici razred_place dok procedura poziva tu funkciju te unosi u tablicu obracun_place neto plaču određenom zaposleniku



![Screenshot 2023-11-22 210622](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/41146e31-4356-4140-99e8-3e2f3a4f2413)



STORED PROCEDURE

Uskladištene procedure koristimo ako se neki kod koristi puno puta, iako bi bilo idealno imat ih u paketu.
U projektu nalaze se dvije procedure: polog novca i transakcija.
Procedura polog novca sastoji se od kursora i nekoliko exceptiona.
Nakon otvaranja kursora rade se provjere ako je račun aktivan te je li uspješna autentifikacija, ako su uvjeti zadovoljeni dodaje se iznos pologa na račun klijenta.


Podaci računa 1001 prije pologa novca


![Screenshot 2023-11-22 212654](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/77db6d54-1283-4b60-ba9f-b76f5bc06773)


Podaci računa 1001 poslije pologa novca


![Screenshot 2023-11-22 212749](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/15c02cef-33fe-47e2-9b15-5be5f1a85753)

Sljedeći primjer opisuje proceduru za transakciju.
Procedura se sastoji od nekoliko ključnih dijelova.
Ako obratimo pažnju na tablicu transakcije vidimo da sadrži transakcijski kod i kod izvršenja
Transakcijski kod označava skidanje sa računa (S) ili uplata na račun(U).
Kod izvršenja sastoji se od brojeva 0,1,2,3.


0 - uspješna transakcija

1 - nedovoljan saldo

2 - ne postoji račun

3- nemoguća uplata na vlastiti račun

Ovisno o unesenom parametru transakcijskog koda i koda izvršenja izvršit će se izmjena podataka na unesene račune.

Kod izvršenja 2 ispituje se tako da se deklarira boolean not_found i ako je atribut kursora notfound kod izvršenja iznosi 2.

Podaci o računima 1001 i 1002 prije transakcije


![Screenshot 2023-11-22 214438](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/6b275898-241b-4c8b-a878-91f5375013ac)


![Screenshot 2023-11-22 214520](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/3b0aa331-33be-49f2-a505-01f75e7b298e)


Podaci o računima 1001 i 1002 nakon transakcije

![Screenshot 2023-11-22 214558](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/af845a6a-66b5-475c-a21f-34784c111ce0)


![Screenshot 2023-11-22 214638](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/36ad682c-d2f2-4c25-99c3-487b6ce11f87)



Primjeri sa različitim kodom izvršenja.


![Screenshot 2023-11-22 215233](https://github.com/dorianhabek/Simulacija-Banke/assets/143107236/6f26f003-9ab7-42b1-9fb6-f7cbded45f05)


ZAKLJUČAK


Naravno tijekom pisanja ove dokumentacije projekt nije u potpunosti završen, u planu su još mnoge procedure koje bi simulirale funkcionalnosti banke, dodati nekoliko triggera i na kraju optimizacija koda.
Vjerujem da ovaj projekt pokazuje moje znanje u korištenju PLSQL jezika i Oracle baze podataka za entry level PLSQL developera.

Hvala vam na pažnji.

Dorian Habek
