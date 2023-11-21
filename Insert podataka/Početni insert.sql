--POČETNI INPUT ZA POČETAK RADA PROJEKTA, RADI LAKŠEG DALJNJEG UNOSA NAPRAVLJENE SU SEKVENCE ZA SVE PRIMARY KEY-OVE TE ZA NEKE FOREIGN KEY-OVE
--INSERT JE STAVLJEN U PRAVILAN REDOSLJED UNOSA KAKO NE BI DOŠLO DO POGREŠKE U PARENT-CHILD ODNOSU

--KLIJENTI
insert into klijenti values(pk_id_klij.nextval,'Dorian','Habek');
insert into klijenti values(pk_id_klij.nextval,'Ana','Habek');
insert into klijenti values(pk_id_klij.nextval,'Alisa','Habek');
insert into klijenti values(pk_id_klij.nextval,'Goran','Habek');
insert into klijenti values(pk_id_klij.nextval,'Deana','Habek');
insert into klijenti values(pk_id_klij.nextval,'Maja','Flekovi?');
insert into klijenti values(pk_id_klij.nextval,'Noah','Flekovi?');
insert into klijenti values(pk_id_klij.nextval,'Tomislav','Flekovi?');
insert into klijenti values(pk_id_klij.nextval,'Stjepan','Pavliš');
insert into klijenti values(pk_id_klij.nextval,'Sanja','Pavliš');
insert into klijenti values(pk_id_klij.nextval,'Filip','Pavliš');

--DETALJI KLIJENTA
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'dorianhabek@gmail.com', 0915683291, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'anahabek@gmail.com', 09288573, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'alisahabek@gmail.com', 099887345, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'goranhabek@gmail.com', 0915423213, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'deanahabek@gmail.com', 091667783, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'majaflekovic@gmail.com', 098123555, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'noahflekovic@gmail.com', 0913312532, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'tomislavflekovic@gmail.com', 0921144675, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'stjepanpavlis@gmail.com', 0911226743, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'sanjapavlis@gmail.com', 091588921, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(pk_id_klij_det.nextval,fk_id_klij_det.nextval,'filippavlis@gmail.com', 0956753467, 'Doljani 15', 'Šandrovac', 43227);

--DETALJI POSLOVNICE
insert into detalji_poslovnice values(pk_id_poslovnice.nextval, 'Erste Steiermärkische Bank d.d.','Bjelovar','Ul.Petra Preradovi?a 2');

--ZAPOSLENICI POSLOVNICE
insert into zaposlenici_poslovnice values(pk_id_zaposlenika.nextval,'Ana ','Novak',10);
insert into zaposlenici_poslovnice values(pk_id_zaposlenika.nextval,'Marko ','Kova?',10);
insert into zaposlenici_poslovnice values(pk_id_zaposlenika.nextval,'Ivana ','Horvat',10);
insert into zaposlenici_poslovnice values(pk_id_zaposlenika.nextval,'Filip ','Šimi?',10);
insert into zaposlenici_poslovnice values(pk_id_zaposlenika.nextval,'Mia ','Juri?',10);

--DETALJI ZAPOSLENIKA
insert into detalji_zaposlenika values(pk_id_det_zaposlenika.nextval,pk_id_zaposlenika_det.nextval,'ananovak@gmail.com', 0912223412, 'Preradoviceva 5','Bjelovar',43000,'Službenica','Zaposlen/a',sysdate -500);
insert into detalji_zaposlenika values(pk_id_det_zaposlenika.nextval,pk_id_zaposlenika_det.nextval,'markokovac@gmail.com', 099566783, 'J.J.Strosmayera 55','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -100);
insert into detalji_zaposlenika values(pk_id_det_zaposlenika.nextval,pk_id_zaposlenika_det.nextval,'ivanahorvat@gmail.com', 092568321, 'Križeva?ka Cesta 10','Bjelovar',43000,'Ra?unovo?a','Zaposlen/a',sysdate -1000);
insert into detalji_zaposlenika values(pk_id_det_zaposlenika.nextval,pk_id_zaposlenika_det.nextval,'filipsimic@gmail.com', 091325567, 'A.Šenoe 32','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -800);
insert into detalji_zaposlenika values(pk_id_det_zaposlenika.nextval,pk_id_zaposlenika_det.nextval,'miajuric@gmail.com', 092387932, 'Cvijetna ulica 21','Bjelovar',43000,'Referent','Zaposlen/a',sysdate -830);


--DETALJI ODJELA
insert into detalji_odjela values(1010,'IT',20);
insert into detalji_odjela values(1010,'IT',40);
insert into detalji_odjela values(1020,'Računovodstvo',30);
insert into detalji_odjela values(1030,'Tajništvo',50);
insert into detalji_odjela values(1030,'Tajništvo',10);

--RACUNI
insert into racuni values(pk_broj_racuna.nextval,1,30,0,123,1000,0,'Aktivan','Teku?i','EUR',sysdate);
insert into racuni values(pk_broj_racuna.nextval,2,10,0,'abdcefg',1000,100,'Aktivan','Teku?i','EUR',sysdate -10);
insert into racuni values(pk_broj_racuna.nextval,3,40,0,3567,1000,200,'Aktivan','Teku?i','EUR',sysdate -100);
insert into racuni values(pk_broj_racuna.nextval,4,40,0,'aezakmi',1000,0,'Aktivan','Teku?i','EUR',sysdate -50);
insert into racuni values(pk_broj_racuna.nextval,5,30,0,1307,1000,1000,'Aktivan','Teku?i','EUR',sysdate -200);
insert into racuni values(pk_broj_racuna.nextval,6,20,0,1111,1000,0,'Aktivan','Teku?i','EUR',sysdate -60);
insert into racuni values(pk_broj_racuna.nextval,7,50,0,2222,1000,200,'Aktivan','Teku?i','EUR',sysdate -10);
insert into racuni values(pk_broj_racuna.nextval,8,30,0,4453,1000,0,'Aktivan','Teku?i','EUR',sysdate -30);
insert into racuni values(pk_broj_racuna.nextval,9,20,0,1122,1000,0,'Aktivan','Teku?i','EUR',sysdate -30);
insert into racuni values(pk_broj_racuna.nextval,10,10,0,9999,1000,0,'Aktivan','Teku?i','EUR',sysdate -850);
insert into racuni values(pk_broj_racuna.nextval,11,10,0,1554,1000,500,'Aktivan','Teku?i','EUR',sysdate -33);

--KREDITI
insert into krediti values(pk_id_kredita.nextval,1,1001,'Stambeni',50000,3,sysdate,sysdate+7000,10);

--RAZRED PLACE
insert into razred_place values(1,700,1200);
insert into razred_place values(2,1201,1400);
insert into razred_place values(3,1401,2000);
insert into razred_place values(4,2001,3000);
insert into razred_place values(5,3001,9999);

