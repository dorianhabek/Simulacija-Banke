declare
    brojac number := 10;
    cursor upd_curs is select * from zaposlenici_poslovnice for update of id_zaposlenika;
begin
    for i in upd_curs
    loop
        update zaposlenici_poslovnice
        set id_zaposlenika = brojac
        where current of upd_curs;
        brojac := brojac + 10;
    end loop;
commit; 
end;
/
select * from zaposlenici_poslovnice;        
