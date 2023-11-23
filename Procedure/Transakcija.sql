CREATE OR REPLACE
PROCEDURE TRANSAKCIJA(fr_acc number, to_acc number, doznaka varchar2, iznos number) AS 

    cursor cur_fr_acc(fr_acc number) is select broj_racuna,balans from racuni where broj_racuna = fr_acc;

    cursor cur_to_acc(to_acc number) is select broj_racuna,balans from racuni where broj_racuna = to_acc;

    

    fr_rac_row cur_fr_acc%rowtype;
    to_rac_row cur_to_acc%rowtype;
    kod_trans transakcije.kod_izvršenja%type;
    next_id number;
    not_found boolean;

begin
    next_id := serijski_broj.nextval;
    kod_trans := 0; --oznaka 0 označava uspješnu transakciju
    if doznaka = 'S' then --skidanje s računa
        open cur_fr_acc(fr_acc);
        fetch cur_fr_acc into fr_rac_row;
        not_found := cur_fr_acc%notfound;
        close cur_fr_acc;

        if not_found then
            kod_trans := 2; --ne postoji račun
        else
            if fr_rac_row.balans < iznos then
                kod_trans := 1; --nedovoljan saldo
            else
                update racuni set balans = fr_rac_row.balans - iznos
                where broj_racuna = fr_acc;
                commit;

            end if;
        end if;
        
    insert into transakcije values(next_id,fr_acc,to_acc,iznos,sysdate,doznaka,kod_trans);
    
    elsif doznaka = 'U' then --uplata
        if fr_acc = to_acc then
                    kod_trans := 3; --nije moguče izvršiti radnju na vlastiti račun
        else
            open cur_fr_acc(fr_acc);
            fetch cur_fr_acc into fr_rac_row;
            not_found := cur_fr_acc%notfound;
            close cur_fr_acc;
            if not_found then
                kod_trans := 2;
            else
                if fr_rac_row.balans < iznos then
                kod_trans := 1;

                else
                    update racuni set balans = fr_rac_row.balans - iznos
                    where broj_racuna = fr_acc;
                    commit;
                    open cur_to_acc(to_acc);
                    fetch cur_to_acc into to_rac_row;
                    not_found := cur_to_acc%notfound;
                    close cur_to_acc;
                    if not_found then
                        kod_trans := 2;
                    else
                        update racuni set balans = to_rac_row.balans + iznos
                        where broj_racuna = to_acc;
                        commit;

                    end if;
                end if;
            end if;
        end if;
    insert into transakcije values(next_id,fr_acc,to_acc,iznos,sysdate,doznaka,kod_trans);
        
    end if;
    
END TRANSAKCIJA;
