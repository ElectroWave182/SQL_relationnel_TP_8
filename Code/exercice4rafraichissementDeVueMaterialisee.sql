drop trigger
if exists
copy
cascade
;

create trigger
copy
after
insert or update or delete
on
	DEMO_CUSTOMERS.CUSTOMER_ID,
    DEMO_CUSTOMERS.CUST_FIRST_NAME,
	DEMO_CUSTOMERS.CUST_LAST_NAME
for each row
execute procedure triggerCopy ()
;


create or replace function
triggerCopy ()
returns trigger
as $$

	declare
	
		updateType varchar;
		updateCustomer CUSTNAMES.CUSTOMER_ID % type;
		

    begin
	
		updateType := TG_OP;
		updateCustomer := old.CUSTOMER_ID;
		
		if updateType = "INSERT"
		then
			insert into
			CUSTNAMES
			values
			(
				new.CUSTOMER_ID,
				new.CUST_FIRST_NAME,
				new.CUST_LAST_NAME
			);
		
		elsif updateType = "UPDATE"
		then
			update
			CUSTNAMES
			set
				CUSTNAMES.CUSTOMER_ID = new.CUSTOMER_ID,
				CUSTNAMES.CUST_FIRST_NAME = new.CUST_FIRST_NAME,
				CUSTNAMES.CUST_LAST_NAME = new.CUST_LAST_NAME
			where CUSTNAMES.CUSTOMER_ID = updateCustomer
			;
		
		
		elsif updateType = "DELETE"
		then
			delete
			from CUSTNAMES
			where
				CUSTNAMES.CUSTOMER_ID = updateCustomer
			;
		
		end if
		;
    
    end
    
$$ language plpgsql
;
