insert into klijenti values(1,'Dorian','Habek',1,1001);
insert into klijenti values(2,'Ana','Habek',2,1002);
insert into klijenti values(3,'Alisa','Habek',3,1003);
insert into klijenti values(4,'Goran','Habek',4,1004);
insert into klijenti values(5,'Deana','Habek',5,1005);
insert into klijenti values(6,'Maja','Flekoviæ',6,1006);
insert into klijenti values(7,'Noah','Flekoviæ',7,1007);
insert into klijenti values(8,'Tomislav','Flekoviæ',8,1008);
insert into klijenti values(9,'Stjepan','Pavliš',9,1009);
insert into klijenti values(10,'Sanja','Pavliš',10,1010);
insert into klijenti values(11,'Filip','Pavliš',11,1011);

select * from klijenti;

insert into detalji_klijenta values(1,'dorianhabek@gmail.com', 0915683291, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(2,'anahabek@gmail.com', 09288573, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(3,'alisahabek@gmail.com', 099887345, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(4,'goranhabek@gmail.com', 0915423213, 'Ðure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(5,'deanahabek@gmail.com', 091667783, 'Ðure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(6,'majaflekovic@gmail.com', 098123555, 'Ðure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(7,'noahflekovic@gmail.com', 0913312532, 'Ðure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(8,'tomislavflekovic@gmail.com', 0921144675, 'Ðure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(9,'stjepanpavlis@gmail.com', 0911226743, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(10,'sanjapavlis@gmail.com', 091588921, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(11,'filippavlis@gmail.com', 0956753467, 'Doljani 15', 'Šandrovac', 43227);

select * from detalji_klijenta;

insert into racuni values(1001,0,123,1000,0,'Aktivan','Tekuæi','EUR',sysdate,10);
insert into racuni values(1002,0,'abdcefg',1000,100,'Aktivan','Tekuæi','EUR',sysdate -10,20);
insert into racuni values(1003,0,3567,1000,200,'Aktivan','Tekuæi','EUR',sysdate -100,20);
insert into racuni values(1004,0,'aezakmi',1000,0,'Aktivan','Tekuæi','EUR',sysdate -50,30);
insert into racuni values(1005,0,1307,1000,1000,'Aktivan','Tekuæi','EUR',sysdate -200,40);
insert into racuni values(1006,0,1111,1000,0,'Aktivan','Tekuæi','EUR',sysdate -60,50);
insert into racuni values(1007,0,2222,1000,200,'Aktivan','Tekuæi','EUR',sysdate -10,10);
insert into racuni values(1008,0,4453,1000,0,'Aktivan','Tekuæi','EUR',sysdate -30,10);
insert into racuni values(1009,0,1122,1000,0,'Aktivan','Tekuæi','EUR',sysdate -30,50);
insert into racuni values(1010,0,9999,1000,0,'Aktivan','Tekuæi','EUR',sysdate -850,30);
insert into racuni values(1011,0,1554,1000,500,'Aktivan','Tekuæi','EUR',sysdate -33,40);

select * from racuni;

insert into detalji_poslovnice values(10, 'Erste Steiermärkische Bank d.d.','Bjelovar','Ul.Petra Preradoviæa 2');

insert into zaposlenici_poslovnice values(101,'Ana ','Novak',101);
insert into zaposlenici_poslovnice values(102,'Marko ','Kovaè',102);
insert into zaposlenici_poslovnice values(103,'Ivana ','Horvat',103);
insert into zaposlenici_poslovnice values(104,'Filip ','Šimiæ',104);
insert into zaposlenici_poslovnice values(105,'Mia ','Juriæ',105);

select * from zaposlenici_poslovnice;


insert into detalji_zaposlenika values(101,'ananovak@gmail.com', 0912223412, 'Preradoviceva 5','Bjelovar',43000,'Službenica','Zaposlen/a',sysdate -500,10001,10);
insert into detalji_zaposlenika values(102,'markokovac@gmail.com', 099566783, 'J.J.Strosmayera 55','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -100,10002,20);
insert into detalji_zaposlenika values(103,'ivanahorvat@gmail.com', 092568321, 'Križevaèka Cesta 10','Bjelovar',43000,'Raèunovoða','Zaposlen/a',sysdate -1000,10003,30);
insert into detalji_zaposlenika values(104,'filipsimic@gmail.com', 091325567, 'A.Šenoe 32','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -800,10004,20);
insert into detalji_zaposlenika values(105,'miajuric@gmail.com', 092387932, 'Cvijetna ulica 21','Bjelovar',43000,'Referent','Zaposlen/a',sysdate -830,10005,10);
select * from detalji_zaposlenika;

