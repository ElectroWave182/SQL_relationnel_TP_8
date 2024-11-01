drop trigger
if exists
_format
cascade
;

create trigger
_format
before
insert or update
on DEMO_STATE
for each row
execute procedure triggerFormat ()
;


create or replace function
triggerFormat ()
returns trigger
as $$

    begin
    
        return
        (
            upper (next.ST),
            upper (next.STATE_NAME)
        );
    
    end
    
$$ language plpgsql
;
