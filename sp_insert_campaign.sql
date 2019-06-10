-- use Campaign
-- drop procedure CDBSP_INSERT_CAMPAIGN
CREATE PROCEDURE CDBSP_INSERT_CAMPAIGN 
 as
	--- Variable para saber el id de la campa�a actual
	declare @idCampaign as int

	-- Variables para insertar Campa�a
	declare @idAgeRange as int
	declare @idGender as int
	declare @duration as nvarchar(32)
	declare @startDate as datetime
	declare @endDate as datetime
	
	-- Variables para insertar Red Social X Campa�a
	declare @idSocialNetwork as int
	declare @publicAmount as int
	
	-- Variables para insertar un utm tag x campa�a
	declare @idUTMTag as int

	-- Variables para insertar una ciudad x campa�a
	declare @idCityxCountry as int

	-- Variables para insertar tags x campa�a
	declare @idTag as int
	declare @idsTags as table (idTag int)

	-- Variables auxiliares
	declare @random as int
	declare @first as int
	declare @random_duration as int
	declare @date_template as datetime
	declare @cost as int

	set nocount on

	-- Seleccionar un rango de edad aleatorio
	select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 2)
	select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 2) as int)
	select @idAgeRange = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

	-- Seleccionar un genero aleatorio
	select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 3)
	select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 3) as int)
	select @idGender = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

	-- A�o base 
	select @date_template = '2019-01-01 00:00:00.000'
	-- Genera un dia aleatorio para el inicio de la campa�a
	select @random = cast (RAND () * 365 as int) 
	-- Genera una duracion aleatoria entre 5 y 9 dias
	select @random_duration = cast (RAND () * 5 as int) + 5
	-- Genera la fecha inicial de la campa�a
	select @startDate = DATEADD(day, @random, @date_template)
	-- Suma la duracion a la fecha inicial y genera la fecha final
	select @endDate = DATEADD(day, @random_duration, @startDate)

	-- Genera un costo aleatorio
	select @cost = cast (RAND () * 9999999 as int)
	 
	-- Inserta la nueva campa�a
	insert into dbo.CDB_Campaign (idAgeRage, idGender, duration, startDate, endDate, totalCost, description)
	values (@idAgeRange, @idGender, cast( @random_duration as nvarchar(32)) + ' days', @startDate, @endDate, @cost, 'Some description')
	
	-- Obtiene el id de la campa�a insertada
	select @idCampaign = max(idCampaign) from dbo.CDB_Campaign 

	-- Seleccionar una red social aleatoria
	select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 1)
	select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 1) as int)
	select @idSocialNetwork = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

	-- Genera un costo aleatorio
	select @cost = cast (RAND () * 99999 as int)
	select @publicAmount = cast (RAND () * 9999999 as int)

	-- Inserta una red social asociada a la campa�a
	insert into dbo.CDB_SocialNetworkXCampaign (idSocialNetwork, idCampaign, publicAmount, totalCost, webURL)
	values (@idSocialNetwork, @idCampaign, @publicAmount, @cost, 'http://websiteurl//')

	-- Inserta un utm tag 
	insert into dbo.CDB_UTMTags (utm_source, utm_medium, utm_campaign, utm_term, utm_content)
	values ('utm_source ' + (select name from dbo.CDB_Generics where idGeneric = @idSocialNetwork),
			'utm_medium cpc',
			'utm_campaign ',-- + cast (NEWID() as nvarchar(32)), 
			'utm_term some term', 
			'utm_content some content' )

	-- Obtiene el id del ultimo utm tag insertado
	select @idUTMTag = (select top 1 idUTMTag from dbo.CDB_UTMTags order by idUTMTag desc)

	-- Inserta un utm tag asociado a una campa�a
	insert into dbo.CDB_UTMTAGSXCampaign (idUTMTag, idCampaign)
	values (@idUTMTag, @idCampaign)

	-- Obtiene el id de una ciudad aleatoria
	select @idCityxCountry = cast (RAND() * (select count(1) from dbo.CDB_CitiesXCountry) as int) + 1

	-- Inserta una ciudad asociada a una campa�a
	insert into dbo.CDB_CitiesXCountryXCampaign (idCityXCountry, idCampaign)
	values (@idCityxCountry, @idCampaign)

	-- Cantidad de tags de una campa�a
	select @random = cast (RAND () * 6 as int) + 5

	while (@random > 0)
	begin
		
		-- Seleccionar un tag aleatorio
		select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 4)
		select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 4) as int)
		select @idTag = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

		-- Verifica que no se repitan tags
		if not exists (select * from @idsTags where @idTag = idTag ) 
			begin
				-- Si no se ha agregado aun, lo agrega a la tabla temporal para validar repetidos
				insert into @idsTags values (@idTag)
				-- Inserta un tag x campa�a
				insert into dbo.CDB_TagsXCampaign (idTag, idCampaign)
				values (@idTag, @idCampaign)

				set @random = @random - 1
				continue
			end
		else
			begin
				-- En caso de repetido, continua hasta encontrar otro no repetido
				continue
			end
	end
