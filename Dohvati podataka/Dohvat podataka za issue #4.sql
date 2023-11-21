set SERVEROUTPUT on;
declare
    procedure p_klij(br_rac in number) is
    type r_klij is record(ime_var zaposlenici_poslovnice.ime_zaposlenika%type,
                        prez_var zaposlenici_poslovnice.prezime_zaposlenika%type,
                        tit_var detalji_zaposlenika.titula%type,
                        stat_var detalji_zaposlenika.status%type,
                        dat_zap_var detalji_zaposlenika.dat_zaposlenja%type
                        );
    type t_klij is table of r_klij;
    
    cursor cur_klij(br_rac in number) is select zap.ime_zaposlenika,zap.prezime_zaposlenika,
    det.titula,det.status,det.dat_zaposlenja
    from zaposlenici_poslovnice zap
    inner join detalji_zaposlenika det
    on(zap.id_zaposlenika = det.id_zaposlenika)
    inner join racuni rac
    on(rac.id_zaposlenika = zap.id_zaposlenika)
    where rac.broj_racuna = br_rac;
    
    v_klij t_klij;
    
    
begin
    open cur_klij(br_rac);
    fetch cur_klij bulk collect into v_klij;
    close cur_klij;
    
    for i in 1..v_klij.count() loop
        dbms_output.put_line(v_klij(i).ime_var||' '||v_klij(i).prez_var||' '||v_klij(i).tit_var||' '||v_klij(i).stat_var||' '||v_klij(i).dat_zap_var);
    end loop;
    
end;

begin
    p_klij(br_rac => 1001);
end;
