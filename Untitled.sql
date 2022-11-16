---relational model
---wine (num_wine(P.K), category,year,degree #num_producer)
---producer (num_producer(P.K), first_name,last_name, region)
---harvest (#num_wine, #num_producer, quantity)
---ddl
create table wine (
	num_wine int constraint pkey primary key,
	 Category varchar(20),
	 Year date,
	 Degree int
);

create table producer (
	num_producer int constraint p_key primary key,
	 first_name varchar(30),
	 last_name varchar(30),
	 region varchar (30)
);

create table harvest (
	Quantity int,
	 num_wine int,
	 num_producer int,
	constraint f_key_num_wine foreign key (num_wine) references wine(num_wine),
	constraint f_key_num_producer foreign key (num_producer) references producer(num_producer)
);

insert into wine (num_wine, category, year, degree) values
(01, 'Red', '05/11/2018', 20),
(05, 'white', '05/12/2020', 40),
(12, 'Red', '06/13/2021', 12),
(14, 'white', '03/14/2022', 24),
(16, 'Red', '05/18/2006', 18);

insert into producer (num_producer, first_name, last_name, region) values
(13, 'Abednego', 'Amir', 'Sousse'),
(14, 'Kenneth', 'Oyaks', 'Egypt'),
(12, 'Esther', 'Ada', 'Asia'),
(11, 'Ejiro', 'Mabel', 'Equatorial'),
(10, 'Anu', 'Mary', 'Eko');

insert into harvest (quantity, num_wine, num_producer) values
(200, 01, 13),
(400, 05, 14),
(300, 12, 12),
(500, 14, 11),
(100, 16, 10);

SELECT * from producer;
SELECT first_name, last_name FROM producer ORDER BY first_name, last_name;
SELECT * FROM producer where region = 'Sousse';
SELECT SUM(quantity) FROM harvest  where num_wine= 12; 
SELECT SUM (quantity), category from wine INNER JOIN harvest ON wine.num_wine = harvest.num_wine GROUP BY category;
SELECT first_name, last_name FROM producer  INNER JOIN harvest ON producer.num_producer  = harvest.num_producer  where region = 'Sousse'  
and num_wine > 1 OR quantity > 300 ORDER BY first_name, last_name; 
SELECT * FROM harvest INNER JOIN wine ON harvest.num_wine =wine.num_wine where Degree > 12 AND num_producer =24 