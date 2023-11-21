set SERVEROUTPUT on;

declare
    procedure proc_klij(idx in number) is
    
    type r_klij is record(ime_var klijenti.ime_klijenta%type, prez_var klijenti.prezime_klijenta%type, br_rac racuni.broj_racuna%type, bal_var racuni.balans%type,
    dat_stv_var racuni.datum_stvaranja%type);
    
    type t_klij is table of r_klij;
    
    l_klij t_klij;
    
    function f_podaci(idx in number) return t_klij
    
    is cursor cur_klij(idx in number) is select klij.ime_klijenta, klij.prezime_klijenta, rac.broj_racuna, rac.balans,
    rac.datum_stvaranja from klijenti klij
    inner join racuni rac
    on(klij.id_klijenta = rac.id_klijenta) where klij.id_klijenta = idx;
    
begin
    
    open cur_klij(idx);
    fetch cur_klij bulk collect into l_klij;
    close cur_klij;
    return l_klij;
    
end;
    procedure p_ispis(i_ispis in t_klij) is
    begin
        for i in 1..i_ispis.count() loop
            dbms_output.put_line(i_ispis(i).ime_var||' '||i_ispis(i).prez_var||' '||'Broj racuna:'||i_ispis(i).br_rac||' '||'Balans:'||i_ispis(i).bal_var||' '
            ||'Datum stvaranja računa '||i_ispis(i).dat_stv_var);
        end loop;
    end;
    
begin
    l_klij := f_podaci(idx);
    
    p_ispis(l_klij);
end;

begin
    proc_klij(idx => 3);
end;
