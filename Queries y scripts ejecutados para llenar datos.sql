-- Queries y ejecutados para llenar datos

use Campaign

-- Los datos de esta tabla se calculan segun
-- Dias del año por % de aparicion por fecha
-- Cantidad total de logs
-- tamaño aproximado de cada log
insert into dbo.CDB_LogsInfo (days, percentage, quantityLogs, quantityActions, quantityUsers)
values  ( 80,48,490853,37, 350 ), --167
		( 139,27,276105,22, 123 ), --90
		( 115,25,255653,13, 172 )--172

-- Son los tipos de las tabas que utilizan el generic 
insert into dbo.CDB_Types (name, description)
values	('Social Network','Social Networks Avaiable' ),
		('Age Range','Age Ranges Avaiable' ),
		('Gender','Genders Avaiable' ),
		('Tag','Tags Avaiable' ),
		('Country','Countries Avaiable' ),
		('City','Cities Avaiable' ),
		('Action Section','Actions Section Avaiable' ),
		('Content','Contents Available'),
		('Action','Actions Available')


-- Informacion de los rangos de horas con mas uso de la aplicacion.
insert into dbo.CDB_TimesInfo (startHour,endHour)
values	('06:00:00.000','09:00:00.000'),
		('12:00:00.000','13:00:00.000'),
		('21:00:00.000','23:00:00.000'),
		('00:01:00.000','23:59:00.000')

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

-- Generos
insert into dbo.CDB_Generics (idType, name, description)
values	(3,'male','Gender desc'),
		(3,'female','Gender desc'),
		(3,'undefined','Gender desc')

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
		
-- Son los tipos de acciones que hay
insert into dbo.CDB_Generics ( idType, name, description)
values	(7,'Post','Content related to any post'),
		(7,'Story','Content related to any story'),
		(7,'Chat','Content related to any chat'),
		(7,'Content','Uploading content'),
		(7,'Profile','Content related to any profile'),
		(7,'Search','Searching for anything')

insert into dbo.CDB_Generics (idType, name, description)
values	(8,'Video','Video Content'),
		(8,'Audio','Audio Content'),
		(8,'Image','Image Content'),
		(8,'Story','Story Content')

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

-- Es la informacion sobre la ocurrencia de una accion
insert into dbo.CDB_ActionsInfo ( idAction, percentage, idRange, isContent)
values	(77,56,1,1),
		(78,26,2,1),
		(79,7,3,0),
		(80,4,4,1),
		(81,3,5,0),
		(82,4,6,0)

-- Listado de acciones
insert into dbo.CDB_Generics (idType, name, description)
values	(9, 'Like Post', 'Action description'), -- Acciones de Posts
		(9, 'Unike Post', 'Action description'),
		(9, 'Coment Post', 'Action description'),
		(9, 'Share Post', 'Action description'),
		(9, 'Scroll Post', 'Action description'),
		(9, 'Tag a friend in a Post', 'Action description'),
		(9, 'Report Post', 'Action description'),
		-- Acciones de Stories
		(9, 'Watch Story', 'Action description'),
		(9, 'Reply Story', 'Action description'),
		(9, 'Share Story', 'Action description'),
		(9, 'Share Story', 'Action description'),
		(9, 'Skip a Story', 'Action description'),
		(9, 'Tag Someone on a Story', 'Action description'),
		-- Acciones de chat
		(9, 'Send Message', 'Action description'),
		(9, 'New Chat', 'Action description'),
		(9, 'Delete Chat', 'Action description'),
		(9, 'Like a Message', 'Action description'),
		(9, 'Send Multimedia Message', 'Action description'),
		(9, 'Scroll Chats', 'Action description'),
		(9, 'Read Chat', 'Action description'),
		-- Acciones de contenido
		(9, 'Upload Post', 'Action description'),
		(9, 'Delet Post', 'Action description'),
		(9, 'Upload Story', 'Action description'),
		(9, 'Delete Story', 'Action description'),
		(9, 'Save Story', 'Action Description'),
		-- Acciones de perfil
		(9, 'Edit Profile', 'Action description'),
		(9, 'Watch Profile', 'Action description'),
		(9, 'Edit Best Friends Preferences', 'Action description'),
		(9, 'Follow', 'Action description'),
		(9, 'Unfollow', 'Action Description'),
		--Acciones de Busqueda
		(9, 'Search', 'Action Description'),
		(9, 'Delete Search History', 'Action Description'),
		(9, 'Select a Result', 'Action Description'),
		(9, 'Scroll Results', 'Action Description'),
		(9, 'Watch Result', 'Action Description'),
		(9, 'Watch Post', 'Action Description')

-- Acciones directas disponibles para cada seccion
insert into dbo.CDB_ActionsXSection (idActionSection, idAction)
values	(77,87),
		(77,88),
		(77,89),
		(77,90),
		(77,91),
		(77,92),
		(77,93),
		-- hasta aqui acciones de Post
		(78,95),
		(78,96),
		(78,97),
		(78,98),
		(78,99),
		-- hasta aqui acciones de Story
		(79,100),
		(79,101),
		(79,102),
		(79,103),
		(79,104),
		(79,105),
		-- hasta aqui acciones de chat
		(80,107),
		(80,108),
		(80,109),
		(80,110),
		(80,111),
		-- hasta aqui acciones de contenido
		(81,112),
		(81,114),
		(81,115),
		(81,116),
		-- hasta aqui acciones de perfil
		(82,117),
		(82,118),
		(82,119),
		(82,120)
		-- hasta aqui acciones de busqueda

-- Acciones indirectas disponibles para cada seccion
insert into dbo.CDB_ActionsXSection (idActionSection, idAction, is_direct_action)
values	(78,94,0),
		(79,106,0),
		(81,113,0),
		(82,121,0),
		(82,121,0),
		(77,122,0)
		
-- Valores de las ubicaciones geograficas
INSERT INTO dbo.CDB_Location (latitude, longitude)
values 	(9.934109, -84.102138),
		(9.973060, -84.119947),
		(9.969876, -84.182030),
		(9.897237, -84.176055),
		(9.891366, -84.046706), -- Aqui termina SJ
		(10.005257, -84.119414),
		(10.148846, -84.101894),
		(9.977114, -84.168988), 
		(10.008669, -84.014417),
		(10.147117, -84.064548), -- Aqui termina HRD
		(10.537230, -84.510632),
		(11.030337, -84.631261),
		(10.921764, -85.392067),
		(10.148827, -84.623783),
		(9.993597, -84.230601), -- Aqui termina Alj 
		(9.892758, -83.992247),
		(9.779422, -84.027562),
		(9.729366, -83.674896),
		(9.994124, -83.654867),
		(10.059537, -83.847392), -- Aqui termina Car
		(10.005421, -83.250806),
		(10.604587, -83.611292),
		(10.162597, -83.810499),
		(9.445197, -83.332033),
		(9.697689, -82.862814), -- Aqui termina Lim
		(9.204591, -83.783451),
		(9.744113, -84.603085),
		(8.454767, -83.406798),
		(9.008745, -82.856291),
		(9.269079, -83.442879), -- Aqui termina punt
		(9.934109, -84.102138),
		(10.520151, -85.459457),
		(10.695116, -85.073730),
		(11.109526, -85.656703),
		(9.944670,  -85.619186), -- Aqui termina guana
		(9.061991, -79.486516),
		(9.205676, -79.379275),
		(9.036187, -79.343803),
		(8.973149, -79.567017),
		(9.126148, -79.555940), -- Aqui termina Ciu Pan
		(9.934109, -84.102138),
		(8.936351, -79.448146),
		(9.075222, -79.544675),
		(9.021972, -79.719223),
		(8.893041, -79.626023), -- Aqui termina Chorr
		(8.420289, -82.432575),
		(8.471068, -82.425008),
		(8.381064, -82.458330),
		(8.359313, -82.401339),
		(8.409585, -82.403732), -- Aqui termina David
		(8.416690, -80.417481),
		(8.256430, -80.484511),
		(8.433253, -80.601845),
		(8.647009, -80.376444),
		(8.401865, -80.179100), -- Aqui termina Cocle
		(7.872688, -80.702815),
		(7.977272, -80.420753),
		(8.089140, -80.708615),
		(7.778005, -80.931908),
		(7.603549, -80.681201), -- Aqui termina Herrera
		(14.076532, -87.194276),
		(14.174793, -87.279878),
		(14.032156, -87.306807),
		(14.005944, -87.131163),
		(14.164598, -87.141339), -- Aqui termina Tegucigalpa
		(15.509133, -88.008497),
		(15.642192, -88.013477),
		(15.467775, -88.110540),
		(15.449588, -87.889796),
		(15.625273, -87.965563), -- Aqui termina San Pedro Sul
		(15.762205, -86.792495),
		(15.756419, -86.958547),
		(15.693731, -86.803109),
		(15.718082, -86.690586),
		(15.776319, -86.628043), -- Aqui termina La ceiba
		(13.313154, -87.168916),
		(13.410986, -87.242702),
		(13.245127, -87.256000),
		(13.243624, -87.098129),
		(13.377191, -87.104679), -- Aqui termino cholutega
		(15.772153, -87.472231),
		(15.799370, -87.398766),
		(15.731685, -87.452148),
		(15.726252, -87.525358),
		(15.803558, -87.555191), -- Aqui termino Tela
		(19.383829, -99.145003),
		(19.579461, -99.130886),
		(19.334760, -99.282407),
		(19.229601, -99.121912),
		(19.336865, -98.987073), -- Aqui termino  ciud Mexico
		(28.625606, -106.071544),
		(28.843141, -106.080880),
		(28.767250, -106.248006),
		(28.555180, -106.214995),
		(28.640363, -105.890878), -- Aqui termino Chihuahua
		(16.859089, -99.838947),
		(17.007680, -99.742421),
		(16.978430, -100.075433),
		(16.701322, -99.640066),
		(17.036500, -99.909663), -- Aqui termino Acapulgo
		(25.607582, -99.944060),
		(27.759877, -100.215706),
		(26.802984, -102.547966),
		(23.426988, -101.701524),
		(25.858185, -97.702223), -- Monterrey,
		(20.410548, -103.818126),
		(23.433769, -103.297167),
		(22.313377, -105.636677),
		(18.548417, -103.415378),
		(21.271978, -100.820313), -- Guadalajara 
		(47.162143, -120.224399),
		(49.186658, -120.045166),
		(47.417055, -124.260965),
		(45.839214, -120.561240),
		(47.214555, -117.270824), -- Washington
		(41.140101, -73.755061),
		(40.760552, -74.340327),
		(40.350847, -74.185610),
		(40.725708, -73.502855),
		(41.096435, -74.245230), -- New York
		(42.302224, -72.015598),
		(42.736840, -73.238221),
		(42.078516, -73.470011),
		(41.596602, -70.567823),
		(42.800609, -70.887795), -- Boston
		(39.366091, -117.002852),
		(41.878337, -114.180978),
		(41.962581, -119.890935),
		(35.697960, -115.257330),
		(38.175492, -114.273309), -- Las Vegas
		(28.531236, -81.867256),
		(30.361651, -81.926618),
		(30.878868, -87.413788),
		(26.162195, -81.559703),
		(28.507182, -80.936970) -- Florida 

-- Informacion de ciudades x pais
INSERT INTO dbo.CDB_CitiesXCountry (idCountry, idCity, isCountry, idLocation1, idLocation2, idLocation3, idLocation4, idCenterLocation)
values  (42,48,1,2,3,4,5,1),
		(42,49,0,7,8,9,10,6),
		(42,50,0,12,13,14,15,11),
		(42,51,0,17,18,19,20,16),
		(42,52,0,22,23,24,25,21),
		(42,53,0,27,28,29,30,26),
		(42,54,0,32,33,34,35,31),
		(43,55,1,37,38,39,40,36),
		(43,56,0,42,43,44,45,41),
		(43,57,0,47,48,49,50,46),
		(43,58,0,52,53,54,55,51),
		(43,59,0,57,58,59,60,56),
		(45,60,1,62,63,64,65,61),
		(45,61,0,67,68,69,70,66),
		(45,62,0,72,73,74,75,71),
		(45,63,0,77,78,79,80,76),
		(45,64,0,82,83,84,85,81),
		(46,66,1,87,88,89,90,86),
		(46,67,0,92,93,94,95,91),
		(46,68,0,97,98,99,100,96),
		(46,69,0,102,103,104,105,101),
		(46,70,0,107,108,109,110,106),
		(47,72,1,112,113,114,115,111),
		(47,73,0,117,118,119,120,116),
		(47,74,0,122,123,124,125,121),
		(47,75,0,127,128,129,130,124),
		(47,76,0,132,133,134,135,131)
        
declare @count as int

set @count = 0

while @count < 10000
	begin
		exec dbo.CDBSP_INSERT_CAMPAIGN
		set @count = @count + 1
	end

set @count = 0

while @count < 2000
	begin
		exec dbo.CDBSP_INSERT_USERSINFO
		set @count = @count + 1
	end

 -- exec dbo.CDBPS_GENERATE_LOGS

-- select * from dbo.CDB_LogsInfo

-- select * from dbo.CDB_Types

-- select * from dbo.CDB_TimesInfo

-- Consulta sobre todas las redes sociales
-- select * from dbo.CDB_Generics
-- where idType = 1

-- select * from dbo.CDB_Generics
-- where idType = 2

-- select * from dbo.CDB_Generics
-- where idType = 3

-- select * from dbo.CDB_Generics
-- where idType = 4

-- select * from dbo.CDB_Generics
-- where idType = 5

-- select * from dbo.CDB_Generics
-- where idType = 6

-- Selecciona todos los accions en generic
 --select * from dbo.CDB_Generics
 --where idType = 7

-- Selecciona todos los media en generic
-- select * from dbo.CDB_Generics
-- where idType = 8
-- select * from dbo.CDB_Ranges
-- select * from dbo.CDB_ActionsInfo
-- select * from dbo.CDB_Location
-- select * from dbo.CDB_CitiesXCountry
-- select * from dbo.CDB_Campaign

-- select * from dbo.CDB_UsersInfo
-- select * from dbo.CDB_Location where idLocation = 148
-- select * from CDB_UTMTags
-- select * from dbo.CDB_TagsXUser
-- select * from dbo.CDB_CitiesXCountryXCampaign
-- select * from dbo.CDB_SocialNetworkXCampaign
-- select * from dbo.CDB_UTMTAGSXCampaign
-- select * from dbo.CDB_TagsXCampaign
-- select * from CDB_Generics where idType = 4 

-- select * from dbo.CDB_Generics where idType = 7 or idType = 9
-- select * from dbo.CDB_ActionsXSection