drop trigger
if exists
conserve
cascade
;

create trigger
conserve
before
insert or update
on
	CLIBANQUE.nomCli,
	CLIBANQUE.idConjoint
for each row
execute procedure triggerConserve ()
;


create or replace function
triggerConserve ()
returns trigger
as $$

	declare
	
		nomConjoint CLIBANQUE.nomCli % type;
		

    begin
    
		select nomCli
		from CLIBANQUE
		into nomConjoint
        where idCli = new.idConjoint
		;
		
		if new.nomCli = nomConjoint
		
		then
			return new;
		
		else
			raise exception
				"Le client "
				|| nomCli
				|| " doit avoir le même nom que son conjoint "
				|| nomConjoint
				|| " !"
			;
		
		end if
		;
    
    end
    
$$ language plpgsql
;
