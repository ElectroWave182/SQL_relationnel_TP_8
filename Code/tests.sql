-- Exercice 1

update
DEMO_STATES
set
    ST = 'oh',
    STATE_NAME = 'ohio'
where ST = 'OH'
;

insert into
DEMO_STATES
values
(
    'St',
    'exampleState'
);

select *
from DEMO_STATES
where
    ST = 'ST'
    or ST = 'OH'
;


-- Exercice 2

insert into
CLIBANQUE
values
(
    1,
    'Louis',
	null
);

insert into
CLIBANQUE
values
(
    2,
    'Clovis',
	null
);

insert into
CLIBANQUE
values
(
    3,
    'Charlemagne',
	1
);

insert into
CLIBANQUE
values
(
    4,
    'Louis',
	1
);

update
CLIBANQUE
set idConjoint = 4
where idCli = 1
;

update
CLIBANQUE
set idConjoint = 3
where idCli = 2
;

update
CLIBANQUE
set idCli = 5
where idCli = 2
;

select *
from CLIBANQUE
;


-- Exercice 3

insert into
EMP
values
(
	8000,
	'CLARK',
	'MANAGER',
	7839,
	'09-jun-1981',
	2450,
	null,
	10
);

insert into
EMP
values
(
	8001,
	'KING',
	'PRESIDENT',
	null,
	'17-nov-1981',
	5000,
	null,
	10
);

insert into
EMP
values
(
	8002,
	'TURNER',
	'SALESMAN',
	7698,
	'08-sep-1981',
	1500,
	0,
	30
);

insert into
EMP
values
(
	8003,
	'JAMES',
	'CLERK',
	7698,
	'03-dec-1981',
	950,
	null,
	30
);

insert into
EMP
values
(
	8004,
	'FORD',
	'ANALYST',
	7566,
	'03-dec-1981',
	3000,
	null,
	20
);

insert into
EMP
values
(
	8005,
	'MILLER',
	'CLERK',
	7782,
	'23-jan-1982',
	1300,
	null,
	10
);

delete
from EMP
where EMPNO >= 8000
;

update
EMP
set sal = sal * 1.05
;

select *
from STATS
;


-- Exercice 4

insert into
DEMO_CUSTOMERS
values
(
	8,
	'David',
	'11 ans',
	'1 Rue Laborde',
	'',
	'Bron',
	'FR',
	'69500',
	'703-555-2169',
	'',
	'1000',
	''
);

select *
from CUSTNAMES
;

update
DEMO_CUSTOMERS
set PHONE_NUMBER1 = '215600'
where CUSTOMER_ID = 8
;

select *
from CUSTNAMES
;

delete
from DEMO_CUSTOMERS
where CUSTOMER_ID = 8
;

select *
from CUSTNAMES
;
