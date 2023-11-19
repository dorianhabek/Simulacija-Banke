create table klijenti(
    id_klijenta number primary key not null ,
    ime_klijenta varchar2(50) not null,
    prezime_klijenta varchar2(50) not null,
    id_detalji_klijenta number not null unique,
    broj_racuna number not null unique
);


create table detalji_klijenta(
    id_detalji_klijenta  number primary key not null ,
    email_adresa varchar2(50),
    telefon number not null,
    adresa varchar2(50) not null,
    grad varchar2(50) not null,
    post_broj number not null 
);

create table racuni(
    broj_racuna number primary key not null ,
    balans number not null,
    autentifikacija varchar2(50) not null unique,
    dnevni_limit number not null,
    dozvoljeni_minus number not null,
    status_racuna varchar2(50) not null,
    tip_racuna varchar2(50) not null,
    valuta varchar2(50) not null,
    datum_stvaranja date not null,
    id_zaposlenika number not null  
);



create table krediti(
    id_kredita number primary key not null ,
    broj_racuna number not null unique,
    tip_kredita varchar2(50) not null,
    iznos_kredita number not null,
    kamata number not null,
    datum_izdavanja date not null,
    datum_završetka date not null,
    id_zaposlenika number not null unique  
);


create table detalji_poslovnice(
    id_poslovnice number primary key not null ,
    ime_poslovnice varchar2(50) not null,
    lokacija_poslovnice varchar2(50) not null,
    adresa_poslovnice varchar2(50) not null
);

create table zaposlenici_poslovnice(
    id_zaposlenika number primary key not null ,
    ime_zaposlenika varchar2(50) not null,
    prezime_zaposlenika varchar2(50) not null,
    id_detalji_zaposlenika number not null 
);

create table detalji_zaposlenika(
    id_detalji_zaposlenika number primary key not null ,
    email_adresa varchar2(50),
    telefon number not null,
    adresa varchar2(50) not null,
    grad varchar2(50) not null,
    post_broj number not null,
    titula varchar2(50),
    status varchar2(50) not null,
    dat_zaposlenja date not null,
    id_obracun_place number not null unique,
    id_odjela number not null  
);



create table detalji_odjela(
    id_odjela number primary key not null ,
    ime_odjela varchar2(50),
    id_zaposlenika number not null ,
    id_poslovnice number not null 
);


create table obracun_place(
    id_obracun_place number primary key not null,
    id_detalji_zaposlenika number not null unique,
    bruto_placa number,
    neto_placa number
);

create table razred_place (
    porezni_razred number,
    min_placa number,
    max_placa number
);

create table transakcije
(
serijski_broj number primary key,
from_acc varchar2(50),
to_acc varchar2(50),
iznos number not null,
datum date not null,
transakcijski_kod varchar2(50) not null,
kod_izvršenja number
)
