-- use Campaign
-- drop procedure CDBSP_INSERT_USERSINFO
CREATE PROCEDURE CDBSP_INSERT_USERSINFO
 as
	
	-- Variables para insertar la informacion de usuario
	declare @userCount as int
	declare @idUnique as uniqueidentifier
	declare @idCityXCountry as int
	declare @idRangeLocation1 as int
	declare @idRangeLocation2 as int
	declare @idRangeTag1 as int
	declare @idRangeTag2 as int
	declare @idRangeCampaign as int
	declare @locations as table (idLocation int)
	declare @location1 as int
	declare @location2 as int
	declare @location3 as int
	declare @location4 as int
	declare @latitude as float
	declare @longitude as float
	declare @tmpLatitude as float
	declare @tmpLongitude as float

	-- Variables para insertar tags x informacion de usuario
	declare @idstags as table (idTag int)
	declare @idTag as int

	-- Variables auxiliares
	declare @first as int
	declare @random as int
	declare @preferdTags as int
	declare @count as int

	set nocount on

	-- Define el id del usuario que se genera
	set @idUnique = NEWID()

	-- Selecciona la cantidad de usuarios + 1 para generar un nuevo nombre
	select @userCount = count(1) + 1 from dbo.CDB_UsersInfo 

	-- Seleccionar una ciudad aleatoria para un usuario
	select @random = cast (RAND() * (select count(1) idCityXCountry from dbo.CDB_CitiesXCountry) as int) + 1
	select @idCityXCountry = idCityXCountry from dbo.CDB_CitiesXCountry where idCityXCountry = @random

	if @idCityXCountry = 44 or @idCityXCountry = 65 or @idCityXCountry = 71
		begin 
			while @idCityXCountry = 44 or @idCityXCountry = 65 or  @idCityXCountry = 71 
				begin
					select @random = cast (RAND() * (select count(1) idCityXCountry from dbo.CDB_CitiesXCountry) as int)
					select @idCityXCountry = idCityXCountry from dbo.CDB_CitiesXCountry where idCityXCountry = @random
				end
		end
		
	BEGIN TRY  

	select @latitude = latitude, @longitude = longitude from dbo.CDB_Location where idLocation = (select idCenterLocation from dbo.CDB_CitiesXCountry where idCityXCountry = @idCityXCountry)
	
	set @tmpLatitude = @latitude - 1.5 
	set @tmpLongitude = @longitude + 1.5
	insert into dbo.CDB_Location (latitude, longitude)
	values (@tmpLatitude, @tmpLongitude)
	select top 1 @location1 = idLocation from dbo.CDB_Location order by idLocation desc

	set @tmpLatitude = @latitude + 1.5
	set @tmpLongitude = @longitude + 1.5
	insert into dbo.CDB_Location (latitude, longitude)
	values (@tmpLatitude, @tmpLongitude)
	select top 1 @location2 = idLocation from dbo.CDB_Location order by idLocation desc

	set @tmpLatitude = @latitude - 1.5 
	set @tmpLongitude = @longitude - 1.5
	insert into dbo.CDB_Location (latitude, longitude)
	values (@tmpLatitude, @tmpLongitude)
	select top 1 @location3 = idLocation from dbo.CDB_Location order by idLocation desc

	set @tmpLatitude = @latitude + 1.5 
	set @tmpLongitude = @longitude - 1.5
	insert into dbo.CDB_Location (latitude, longitude)
	values (@tmpLatitude, @tmpLongitude)
	select top 1 @location4 = idLocation from dbo.CDB_Location order by idLocation desc

	 

	-- Inserta la informacion de un usuario
	insert into dbo.CDB_UsersInfo (idUnique, name, idCityXCountry, location1, location2, location3, location4, idRangeLocation, idRangeTag)
	values	(@idUnique , 'Nombre Usuario ' + cast (@userCount as nvarchar(32)), @idCityXCountry, NULL, NULL, NULL, NULL, 7, 9),
			(@idUnique , 'Nombre Usuario ' + cast (@userCount as nvarchar(32)), @idCityXCountry, NULL, NULL, NULL, NULL, 7, 10),
			(@idUnique , 'Nombre Usuario ' + cast (@userCount as nvarchar(32)), @idCityXCountry, @location1, @location2, @location3, @location4, 8, 9),
			(@idUnique , 'Nombre Usuario ' + cast (@userCount as nvarchar(32)), @idCityXCountry, @location1, @location2, @location3, @location4, 8, 10)
	END TRY  
	BEGIN CATCH  
		SELECT  @random as Random, 
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH  

	-- Obtiene el id del usu
	-- Cantidad de tags preferidos de un usuario entre 5 y 10
	select @preferdTags = cast (RAND () * 6 as int) + 5 
	select @random = cast (RAND () * 6 as int) + 5  

	set @count = @preferdTags + @random

	while (@count > 0)
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

				-- Inserta un tag x campaña
				if @count < @preferdTags 
					begin
						insert into dbo.CDB_TagsXUser (idTag, idUser, preference)
						values (@idTag, @idUnique, 1)
					end
				else
					begin
						insert into dbo.CDB_TagsXUser (idTag, idUser, preference)
						values (@idTag, @idUnique, 0)
					end

				set @count = @count - 1
				continue
			end
		else
			begin
				-- En caso de repetido, continua hasta encontrar otro no repetido
				continue
			end
	end

	