set SERVEROUTPUT on;

declare
    procedure proc_klij(datum in date) is 
    type r_klij is record(ime_var klijenti.ime_klijenta%type,
    prez_var klijenti.prezime_klijenta%type,
    br_rac racuni.broj_racuna%type);
    
    type t_klij is table of r_klij;
    
    v_klij t_klij;
    
    cursor cur_klij(datum in date)
    is select kli.ime_klijenta,kli.prezime_klijenta,rac.broj_racuna
    from klijenti kli 
    join racuni rac 
    on(rac.broj_racuna = kli.broj_racuna) where datum_stvaranja = datum;
    

begin

    open cur_klij(datum);
    fetch cur_klij bulk collect into v_klij;
    close cur_klij;
   

    for i in 1..v_klij.count() loop
        dbms_output.put_line('Ime i prezime: '||''||v_klij(i).ime_var||' '||v_klij(i).prez_var||', ' 
        ||'broj računa: '||''||v_klij(i).br_rac);
    end loop;
end;



begin
    proc_klij(datum => '12/11/2023');
end;
