CREATE OR REPLACE 
PACKAGE OBRACUN_ISPLATA_PLACE AS 

function obracun_place(iznos number) return number;
                
procedure unos_place (id_place number,
                    br_zaposlenika number,
                    bruto number);

END OBRACUN_ISPLATA_PLACE;

/
/

CREATE OR REPLACE
PACKAGE BODY OBRACUN_ISPLATA_PLACE AS
    
function obracun_place(iznos number)
    return number is             
    raz_place number;
    porez number;
    
BEGIN
    select porezni_razred
    into raz_place
    from razred_place
    where min_placa <= iznos
    and max_placa >= iznos;
        
    if raz_place = 1 then
        porez := 27.5;
    elsif raz_place = 2 then
        porez := 30;
    elsif raz_place = 3 then
        porez := 35;
    elsif raz_place = 4 then
        porez := 47.5;
    elsif raz_place = 5 then
        porez := 60;
    end if;
    return iznos - ((porez / 100) * iznos);
    

END obracun_place;

procedure unos_place (id_place number,
                    br_zaposlenika number,
                    bruto number
                    ) is
                    
                    net_sal number;
    
BEGIN
    net_sal := obracun_place(bruto);
    insert into obracun_place
    values(id_place,br_zaposlenika,bruto,net_sal,sysdate);
     
END unos_place;

END OBRACUN_ISPLATA_PLACE;

/
/
--Pozivanje procedure iz paketa

execute obracun_isplata_place.unos_place(1,101,1000);
select * from obracun_place;
