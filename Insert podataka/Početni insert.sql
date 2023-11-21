insert into klijenti values(1,'Dorian','Habek');
insert into klijenti values(2,'Ana','Habek');
insert into klijenti values(3,'Alisa','Habek');
insert into klijenti values(4,'Goran','Habek');
insert into klijenti values(5,'Deana','Habek');
insert into klijenti values(6,'Maja','Flekovi?');
insert into klijenti values(7,'Noah','Flekovi?');
insert into klijenti values(8,'Tomislav','Flekovi?');
insert into klijenti values(9,'Stjepan','Pavliš');
insert into klijenti values(10,'Sanja','Pavliš');
insert into klijenti values(11,'Filip','Pavliš');

select * from klijenti;

insert into detalji_klijenta values(1,1,'dorianhabek@gmail.com', 0915683291, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(2,2,'anahabek@gmail.com', 09288573, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(3,3,'alisahabek@gmail.com', 099887345, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(4,4,'goranhabek@gmail.com', 0915423213, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(5,5,'deanahabek@gmail.com', 091667783, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(6,6,'majaflekovic@gmail.com', 098123555, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(7,7,'noahflekovic@gmail.com', 0913312532, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(8,8,'tomislavflekovic@gmail.com', 0921144675, '?ure Sudete 3', 'Bjelovar', 43000);
insert into detalji_klijenta values(9,9,'stjepanpavlis@gmail.com', 0911226743, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(10,10,'sanjapavlis@gmail.com', 091588921, 'Doljani 15', 'Šandrovac', 43227);
insert into detalji_klijenta values(11,11,'filippavlis@gmail.com', 0956753467, 'Doljani 15', 'Šandrovac', 43227);

select * from detalji_klijenta;

insert into racuni values(1001,1,30,0,123,1000,0,'Aktivan','Teku?i','EUR',sysdate);
insert into racuni values(1002,2,10,0,'abdcefg',1000,100,'Aktivan','Teku?i','EUR',sysdate -10);
insert into racuni values(1003,3,40,0,3567,1000,200,'Aktivan','Teku?i','EUR',sysdate -100);
insert into racuni values(1004,4,40,0,'aezakmi',1000,0,'Aktivan','Teku?i','EUR',sysdate -50);
insert into racuni values(1005,5,30,0,1307,1000,1000,'Aktivan','Teku?i','EUR',sysdate -200);
insert into racuni values(1006,6,20,0,1111,1000,0,'Aktivan','Teku?i','EUR',sysdate -60);
insert into racuni values(1007,7,50,0,2222,1000,200,'Aktivan','Teku?i','EUR',sysdate -10);
insert into racuni values(1008,8,30,0,4453,1000,0,'Aktivan','Teku?i','EUR',sysdate -30);
insert into racuni values(1009,9,20,0,1122,1000,0,'Aktivan','Teku?i','EUR',sysdate -30);
insert into racuni values(1010,10,10,0,9999,1000,0,'Aktivan','Teku?i','EUR',sysdate -850);
insert into racuni values(1011,11,10,0,1554,1000,500,'Aktivan','Teku?i','EUR',sysdate -33);

select * from racuni;


insert into krediti values(101,1,1001,'Stambeni',50000,3,sysdate,sysdate+7000,10);
select * from krediti;


insert into detalji_poslovnice values(10, 'Erste Steiermärkische Bank d.d.','Bjelovar','Ul.Petra Preradovi?a 2');

insert into zaposlenici_poslovnice values(10,'Ana ','Novak',10);
insert into zaposlenici_poslovnice values(20,'Marko ','Kova?',10);
insert into zaposlenici_poslovnice values(30,'Ivana ','Horvat',10);
insert into zaposlenici_poslovnice values(40,'Filip ','Šimi?',10);
insert into zaposlenici_poslovnice values(50,'Mia ','Juri?',10);

select * from zaposlenici_poslovnice;


insert into detalji_zaposlenika values(101,10,'ananovak@gmail.com', 0912223412, 'Preradoviceva 5','Bjelovar',43000,'Službenica','Zaposlen/a',sysdate -500);
insert into detalji_zaposlenika values(102,20,'markokovac@gmail.com', 099566783, 'J.J.Strosmayera 55','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -100);
insert into detalji_zaposlenika values(103,30,'ivanahorvat@gmail.com', 092568321, 'Križeva?ka Cesta 10','Bjelovar',43000,'Ra?unovo?a','Zaposlen/a',sysdate -1000);
insert into detalji_zaposlenika values(104,40,'filipsimic@gmail.com', 091325567, 'A.Šenoe 32','Bjelovar',43000,'Programer','Zaposlen/a',sysdate -800);
insert into detalji_zaposlenika values(105,50,'miajuric@gmail.com', 092387932, 'Cvijetna ulica 21','Bjelovar',43000,'Referent','Zaposlen/a',sysdate -830);
select * from detalji_zaposlenika;


insert into detalji_odjela values(1010,'IT',20);
insert into detalji_odjela values(1010,'IT',40);
insert into detalji_odjela values(1020,'Računovodstvo',30);
insert into detalji_odjela values(1030,'Tajništvo',50);
insert into detalji_odjela values(1030,'Tajništvo',10);

select * from detalji_odjela;

insert into razred_place values(1,700,1200);
insert into razred_place values(2,1201,1400);
insert into razred_place values(3,1401,2000);
insert into razred_place values(4,2001,3000);
insert into razred_place values(5,3001,9999);

select * from razred_place;
