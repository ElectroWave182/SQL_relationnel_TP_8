drop trigger
if exists
stats
cascade
;

create trigger
stats
after
insert or update or delete
on EMP
for each statement
execute procedure triggerStats ()
;


create or replace function
triggerStats ()
returns trigger
as $$

	declare
	
		updateType varchar;
		updateTime timestamp;
		

    begin
	
		updateType := TG_OP;
		updateTime := now () :: timestamp;
    
		update
		STATS
		set
			nbMaj = nbMaj + 1,
			timestampModif = updateTime
		where typeMaj = updateType
		;
    
    end
    
$$ language plpgsql
;
