-- Queries y ejecutados para llenar datos

use Campaign

-- Los datos de esta tabla se calculan segun
-- Dias del año por % de aparicion por fecha
-- Cantidad total de logs
-- tamaño aproximado de cada log
insert into dbo.CDB_LogsInfo (days, percentage, quantityLogs, quantityActions, quantityUsers)
values  ( 80,48,490853,37, 167 ),
		( 139,27,276105,22, 90 ),
		( 115,25,255653,13, 172 )

select * from dbo.CDB_LogsInfo


-- Son los tipos de las tabas que utilizan el generic 
insert into dbo.CDB_Types (name, description)
values	('Social Network','Social Networks Avaiable' ),
		('Age Range','Age Ranges Avaiable' ),
		('Gender','Genders Avaiable' ),
		('Tag','Tags Avaiable' ),
		('Country','Countries Avaiable' ),
		('City','Cities Avaiable' ),
		('Action','Actions Avaiable' ),
		('Content','Contents Available')


select * from dbo.CDB_Types



-- Informacion de los rangos de horas con mas uso de la aplicacion.
insert into dbo.CDB_TimesInfo (startHour,endHour)
values	('06:00:00.000','09:00:00.000'),
		('12:00:00.000','13:00:00.000'),
		('21:00:00.000','23:00:00.000'),
		('00:01:00.000','23:59:00.000')

select * from dbo.CDB_TimesInfo

-- Redes Sociales
-- Facebook
-- Twitter
-- Instagram
-- LinkedIn
insert into dbo.CDB_Generics (idType, name, description)
values	(1,'Facebook','Facebook Social Network'),
		(1,'Twitter','Twitter Social Network'),
		(1,'Instagram','Instagram Social Network'),
		(1,'LinkedIn','LinkedIn Social Network')

-- Consulta sobre todas las redes sociales
select * from dbo.CDB_Generics
where idType = 1

-- Rango de edades
-- 13 to 18 years old
-- 19 to 25 years old
-- 26 to 35 years old
-- 36 to 45  years old
-- 46 to 60  years old

insert into dbo.CDB_Generics (idType, name, description)
values	(2,'13 to 18 years old','Age range'),
		(2,'19 to 25 years old','Age range'),
		(2,'26 to 35 years old','Age range'),
		(2,'36 to 45  years old','Age range'),
		(2,'46 to 60  years old','Age range')

select * from dbo.CDB_Generics
where idType = 2

-- Generos
insert into dbo.CDB_Generics (idType, name, description)
values	(3,'male','Gender desc'),
		(3,'female','Gender desc'),
		(3,'undefined','Gender desc')

select * from dbo.CDB_Generics
where idType = 3

-- Tags
-- Sports
-- Fashion
-- Finances
-- Political
-- War
-- Crimes
-- Fictions
-- Entertainment
-- Memes
-- Internationals
-- Nationals
-- Technologies
-- Food
-- Fitness
-- Health
-- Animals
-- Music
-- Business
-- Education
-- Life Style
-- Games
-- Pets
-- Art
-- Books
-- Scientific
-- Software
-- Home
-- Kitchen
-- Outdoors
-- Tools
-- Toys

insert into dbo.CDB_Generics (idType, name, description)
values	(4,'Sports','Sports related content'),
		(4,'Fashion','Fashion related content'),
		(4,'Finances','Finances related content'),
		(4,'Political','Political related content'),
		(4,'War','War related content'),
		(4,'Crimes','Crimes related content'),
		(4,'Fiction','Fiction related content'),
		(4,'Entertainment','Entertainment related content'),
		(4,'Memes','Memes related content'),
		(4,'Technology','Technology related content'),
		(4,'Food','Food related content'),
		(4,'Fitness','Fitness related content'),
		(4,'Health','Health related content'),
		(4,'Animals','Animals related content'),
		(4,'Music','Music related content'),
		(4,'Business','Business related content'),
		(4,'Education','Education related content'),
		(4,'Life Style','Life Style related content'),
		(4,'Games','Games related content'),
		(4,'Pets','Pets related content'),
		(4,'Art','Art related content'),
		(4,'Books','Books related content'),
		(4,'Scientific','Scientific related content'),
		(4,'Software','Software related content'),
		(4,'Home','Home related content'),
		(4,'Kitchen','Kitchen related content'),
		(4,'Outdoors','Outdoors related content'),
		(4,'Tools','Tools related content'),		
		(4,'Toys','Toys related content')

select * from dbo.CDB_Generics
where idType = 4

-- Costa Rica    
-- Panama    
-- Nicaragua    
-- Guatemala    
-- Honduras
-- El Salvador    
-- Mexico    
-- Estados Unidos

insert into dbo.CDB_Generics (idType, name, description)
values	(5,'Costa Rica','Costa Rica Country'),
		(5,'Panama','Panama Country'),
		(5,'Nicaragua','Nicaragua Country'),
		(5,'Honduras','Honduras Country'),
		(5,'Mexico','Mexico Country'),
		(5,'Estados Unidos','Estados Unidos Country')

select * from dbo.CDB_Generics
where idType = 5

-- San Jose *
-- Heredia
-- Alajuela
-- Cartago
-- Limon
-- Puntarenas
-- Guanacaste    
-- Ciudad De Panama *
-- Chorrillos
-- David
-- Cocle
-- Herrera
-- Tegucigalpa *
-- San Pedro Sula
-- La Ceiba
-- Cholutega
-- Tela
-- Mexico DF *
-- Chihuahua
-- Acapulco
-- Monterrey
-- Guadalajara
-- Merida
-- Washington DC *
-- New York
-- Boston
-- Las Vegas
-- Florida
    
insert into dbo.CDB_Generics (idType, name, description)
values	(6,'San Jose','San Jose City'),
		(6,'Heredia','Heredia City'),
		(6,'Alajuela','Alajuela City'),
		(6,'Cartago','Cartago City'),
		(6,'Limon','Limon City'),
		(6,'Puntarenas','Puntarenas City'),
		(6,'Guanacaste','Guanacaste City'),
		(6,'Ciudad De Panama','Ciudad De Panama City'),
		(6,'Chorrillos','Chorrillos City'),
		(6,'David','David City'),
		(6,'Cocle','Cocle City'),
		(6,'Herrera','Herrera City'),
		(6,'Tegucigalpa','Tegucigalpa City'),
		(6,'San Pedro Sula','San Pedro Sula City'),
		(6,'La Ceiba','La Ceiba City'),
		(6,'Cholutega','Cholutega City'),
		(6,'Tela','Tela City'),
		(6,'San Salvador','San Salvador City'),
		(6,'Mexico DF','Mexico DF City'),
		(6,'Chihuahua','Chihuahua City'),
		(6,'Acapulco','Acapulco City'),
		(6,'Monterrey','Monterrey City'),
		(6,'Guadalajara','Guadalajara City'),
		(6,'Merida','Merida City'),
		(6,'Washington DC','Washington DC City'),
		(6,'New York','New York City'),
		(6,'Boston','Boston City'),
		(6,'Las Vegas','Las Vegas City'),
		(6,'Florida','Florida City')
		

select * from dbo.CDB_Generics
where idType = 6

insert into dbo.CDB_Generics (idType, name, description)
values	(8,'Video','Video Content'),
		(8,'Audio','Audio Content'),
		(8,'Image','Image Content'),
		(8,'Story','Story Content')


-- Son los tipos de acciones que hay
insert into dbo.CDB_Generics ( idType, name, description)
values	(7,'Post','Content related to any post'),
		(7,'Story','Content related to any story'),
		(7,'Chat','Content related to any chat'),
		(7,'Content','Uploading content'),
		(7,'Profile','Content related to any profile'),
		(7,'Search','Searching for anything')

-- Selecciona todos los accions en generic
select * from dbo.CDB_Generics
where idType = 7


select * from dbo.CDB_Generics
where idType = 8

-- 0 - 55
-- 56 - 81
-- 82 - 88
-- 89 - 82
-- 93 - 95
-- 96 - 99
-- 0 - 19
-- 20 - 99
-- 0 - 85
-- 86 - 99

insert into dbo.CDB_Ranges (startRange,endRange)
values	(0,55),
		(56,81),
		(82,88),
		(89,92),
		(93,95),
		(96,99),
		(0,19),
		(20,99),
		(0,85),
		(86,99)

select * from dbo.CDB_Ranges

-- Es la informacion sobre la ocurrencia de una accion
insert into dbo.CDB_ActionsInfo ( idAction, percentage, idRange, isContent)
values	(1,56,1,1),
		(2,26,2,1),
		(3,7,3,0),
		(4,4,4,1),
		(5,3,5,0),
		(6,4,6,0)


select * from dbo.CDB_ActionsInfo