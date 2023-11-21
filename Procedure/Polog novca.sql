create or replace PROCEDURE POLOG_NOVCA(br_rac number, iznos number, lozinka number) AS

    cursor cur_rac(br_rac number) is select rac.broj_racuna,rac.balans,rac.autentifikacija,rac.status_racuna,
    kli.ime_klijenta,kli.prezime_klijenta
    from racuni rac
    left join klijenti kli
    on(kli.id_klijenta = rac.id_klijenta)
    where rac.broj_racuna = br_rac for update;

    cur_row cur_rac%rowtype;
    novi_balans number;
    wrong_acc_no exception;
    wrong_auth exception;
    expired_acc exception;
    pragma exception_init (wrong_acc_no,-1410);

BEGIN
    open cur_rac(br_rac);
    fetch cur_rac into cur_row;

    if cur_row.status_racuna != 'Aktivan' then
        raise expired_acc;

    elsif lozinka != cur_row.autentifikacija then
        raise wrong_auth;

    else
        novi_balans := cur_row.balans + iznos;
        update racuni set balans = novi_balans where current of cur_rac;
            dbms_output.put_line('Ime:'||' '||cur_row.ime_klijenta||' '||
                                'Prezime: '||' '||cur_row.prezime_klijenta||' '||
                                'Broj računa:'||' '||cur_row.broj_racuna||' '||
                                'Stari balans:'||' '||cur_row.balans||' '||
                                'Trenutni balans:'||' '||novi_balans||' '||
                                'Datum:'||' '||current_date||' '||
                                'Vrijeme:'||' '||localtimestamp);

    end if;
    commit;
    close cur_rac;

exception
    when wrong_acc_no then 
        dbms_output.put_line('Neispravan broj računa ili račun ne postoji');

    when wrong_auth then
        dbms_output.put_line('Neuspješna autentifikacija');

END POLOG_NOVCA;
