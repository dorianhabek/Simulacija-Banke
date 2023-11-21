create table klijenti(
    id_klijenta number primary key not null ,
    ime_klijenta varchar2(50) not null,
    prezime_klijenta varchar2(50) not null
);

create table detalji_klijenta(
    id_detalji_klijenta  number primary key not null ,
    id_klijenta number,
    email_adresa varchar2(50),
    telefon number not null,
    adresa varchar2(50) not null,
    grad varchar2(50) not null,
    post_broj number not null ,
    constraint fk_id_klijenta_det
    foreign key (id_klijenta)
    references klijenti(id_klijenta)
);

create table racuni(
    broj_racuna number primary key not null,
    id_klijenta number,
    id_zaposlenika number,
    balans number not null,
    autentifikacija varchar2(50) not null unique,
    dnevni_limit number not null,
    dozvoljeni_minus number not null,
    status_racuna varchar2(50) not null,
    tip_racuna varchar2(50) not null,
    valuta varchar2(50) not null,
    datum_stvaranja date not null,
    constraint fk_id_zaposlenika_rac
    foreign key(id_zaposlenika)
    references zaposlenici_poslovnice(id_zaposlenika),
    
    constraint fk_id_klijenta_rac
    foreign key(id_klijenta)
    references klijenti(id_klijenta)
);

create table krediti(
    id_kredita number primary key not null ,
    id_klijenta number,
    broj_racuna number not null,
    tip_kredita varchar2(50) not null,
    iznos_kredita number not null,
    kamata number not null,
    datum_izdavanja date not null,
    datum_završetka date not null,
    id_zaposlenika number not null,
    constraint fk_id_zaposlenika_kred
    foreign key(id_zaposlenika)
    references zaposlenici_poslovnice(id_zaposlenika),
    
    constraint fk_id_klijenta_kred
    foreign key(id_klijenta)
    references klijenti(id_klijenta),
    
    constraint fk_broj_racuna_kred
    foreign key (broj_racuna)
    references racuni(broj_racuna)   
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
    id_poslovnice number not null,
    constraint fk_id_poslovnice_zap
    foreign key(id_poslovnice)
    references detalji_poslovnice(id_poslovnice)
);

create table detalji_zaposlenika(
    id_detalji_zaposlenika number primary key not null ,
    id_zaposlenika number,
    email_adresa varchar2(50),
    telefon number not null,
    adresa varchar2(50) not null,
    grad varchar2(50) not null,
    post_broj number not null,
    titula varchar2(50),
    status varchar2(50) not null,
    dat_zaposlenja date not null,
    
    constraint fk_id_zaposlenika_det
    foreign key(id_zaposlenika)
    references zaposlenici_poslovnice(id_zaposlenika)
);

create table detalji_odjela(
    id_odjela number not null ,
    ime_odjela varchar2(50),
    id_zaposlenika number not null,
    constraint fk_id_zaposlenika_odj
    foreign key(id_zaposlenika)
    references zaposlenici_poslovnice(id_zaposlenika)
);


create table obracun_place(
    id_obracun_place number primary key not null,
    id_zaposlenika number not null,
    bruto_placa number,
    neto_placa number,
    constraint fk_id_zaposlenika_obr
    foreign key(id_zaposlenika)
    references zaposlenici_poslovnice(id_zaposlenika)
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
