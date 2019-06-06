-- use Campaign
-- drop procedure 
CREATE PROCEDURE CDBPS_GENERATE_LOGS
as

	-- Variables para generar los logs
	declare @logs as table (	id_user uniqueidentifier,
								username nvarchar(32),
								gender nvarchar(32),
								age int,
								date_time datetime,
								action_type nvarchar(32),
								is_direct_action bit,
								duration int,
								description nvarchar(150),
								country nvarchar(32),
								city nvarchar(32),
								latitude float,
								longitude float,
								content nvarchar(32),
								content_type nvarchar(32),
								content_description nvarchar(150),
								content_url nvarchar(90),
								utm_source nvarchar(32),
								utm_medium nvarchar(32),
								utm_campaign nvarchar(32),
								utm_term nvarchar(32),
								utm_content nvarchar(32),
								campaign_name nvarchar(32),
								social_network nvarchar(32),
								tag1 nvarchar(32),
								tag2 nvarchar(32),
								tag3 nvarchar(32),
								tag4 nvarchar(32),
								tag5 nvarchar(32)
							)
	-- variables para insertar logs en la tabla
	declare @username as nvarchar(32)
	declare @gender as nvarchar(32)
	declare @action_type as nvarchar(32)
	declare @description as nvarchar(150)
	declare @country as nvarchar(32)
	declare @city as nvarchar(32)
	declare @latitude as float
	declare @longitude as float
	declare @content as nvarchar(32)
	declare @content_type as nvarchar(32)
	declare @content_description nvarchar(150)
	declare @content_url nvarchar(90)
	declare @utm_source nvarchar(32)
	declare @utm_medium nvarchar(32)
	declare @utm_campaign nvarchar(32)
	declare @utm_term nvarchar(32)
	declare @utm_content nvarchar(32)
	declare @campaign_name nvarchar(32)
	declare @social_network nvarchar(32)
	declare @tmptag as nvarchar(32)
	declare @tag1 nvarchar(32)
	declare @tag2 nvarchar(32)
	declare @tag3 nvarchar(32)
	declare @tag4 nvarchar(32)
	declare @tag5 nvarchar(32)
	 
	declare @pointer as int
	
	declare @logsXuser as int
	declare @quantityLogs as int
	declare @quantityUsers as int
	declare @quantityActions as int
	
	declare @tmpcounter as int
	declare @tmpuser as uniqueidentifier
	declare @tmpaction as int
	declare @random as int

	declare @cursor as cursor

	-- tablas para tener registro de los elementos repetidos

	declare @users as table (id int, userid uniqueidentifier)
	declare @tags as table (id int, tag nvarchar(32))
	declare @users_used as table (id int)
	declare @actions as table (idaction int)

	-- variables para generar una fecha aleatoria
	declare @days as int
	declare @hours as int
	declare @minutes as int

	declare @tmpdate as datetime
	declare @date_template as datetime

	-- variables para determinar rangos
	declare @prob_tags as int -- 85% prob de que los tags sean de preferencia
	declare @prob_location as int -- 20% prob de estar lejos
	declare @prob_campaign as int -- 16% prob de estar asociado a una campaña
	declare @prob_action as int -- Para la tabla de actions info
	declare @prob_repeat as int -- 15% prob de repetir la accion de 1 a 3 veces
	declare @prob_duration as int -- Duracion de las acciones indirectas 65% de 1 a 3 y el resto de 3 a 8

	declare @first as int

	set nocount on

	-- Iniciar contador en 1
	set @tmpcounter = 1

	-- Año base 
	select @date_template = '2019-01-01 00:00:00.000'
	
	-- ingresa todos los usuarios a una tabla temporal
	delete @users
	begin
		set @cursor = cursor for
		select idUnique from dbo.CDB_UsersInfo group by idUnique

		open @cursor
		fetch next from @cursor
		into @tmpuser

		while @@FETCH_STATUS = 0
		begin
			
			insert into @users ( id, userid )
			values (@tmpcounter, @tmpuser)

			set @tmpcounter = @tmpcounter + 1
			fetch next from @cursor
			into @tmpuser
		end

		close @cursor
		deallocate @cursor

	end

	set @pointer = 1

	while exists (select idLogInfo from dbo.CDB_LogsInfo where idLogInfo = @pointer)
		begin
		
			select @quantityLogs = quantityLogs, @quantityUsers = quantityUsers, @quantityActions = quantityActions from dbo.CDB_LogsInfo where @pointer = idLogInfo
			set @logsXuser = @quantityLogs / @quantityUsers 
			set @logsXuser = @logsXuser + (@logsXuser * 0.2)

			-- Limpia la tabla temporal de usuarios usados
			delete @users_used

			-- Selecciona un usuario aleatorio
			select @random = cast( RAND() * (select count(1) from @users) as int) + 1
			select @tmpuser = userid from @users where id = @random
			-- Agrega el usuario a la tabla de usuarios usados
			insert into @users_used (id) values (@random)

			-- Ciclo para recorrer los usuarios que se utilicen
			while @quantityUsers > 0
				begin
					
					set @tmpcounter = 0 -- Ciclo para generar los logs x usuario
					while @tmpcounter < @logsXuser
						begin
							-- Generar fecha aleatoria
							select @days = cast (RAND () * 365 as int) 
							select @hours = cast (RAND () * 24 as int) 
							select @minutes = cast (RAND () * 60 as int) 
							select @tmpdate = DATEADD(day, @days, @date_template)
							select @tmpdate = DATEADD(hour, @days, @tmpdate)
							select @tmpdate = DATEADD(minute, @minutes, @tmpdate)

							-- Generar randoms para la info
							select @prob_action = cast( RAND() * 100 as int) -- tabla
							select @prob_campaign = cast( RAND() * 100 as int) 
							select @prob_duration = cast( RAND() * 100 as int) 
							select @prob_location = cast( RAND() * 100 as int) -- tabla
							select @prob_repeat = cast( RAND() * 100 as int) 
							select @prob_tags = cast( RAND() * 100 as int) -- tabla

							select @tmpaction = idAction from dbo.CDB_ActionsInfo actions inner join dbo.CDB_Ranges ranges on (actions.idRange = ranges.idRange) where @prob_action between ranges.startRange and ranges.endRange

							-- Seleccionar una accion aleatoria
							select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 9)
							select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 9) as int)
							select @action_type = generics.name, @description = generics.description from dbo.CDB_Generics generics where idGeneric = (@first + @random)
							-- Obtiene Nombre de Ciudad y Pais del Usuario
							select @country = generics.name from dbo.CDB_UsersInfo usersinfo inner join dbo.CDB_CitiesXCountry cities on (usersinfo.idCityXCountry = cities.idCityXCountry) inner join dbo.CDB_Generics generics on (generics.idGeneric = cities.idCountry)
							select @city = generics.name from dbo.CDB_UsersInfo usersinfo inner join dbo.CDB_CitiesXCountry cities on (usersinfo.idCityXCountry = cities.idCityXCountry) inner join dbo.CDB_Generics generics on (generics.idGeneric = cities.idCity)
							
							-- Obtiene los tags del contenido
							set @tmpcounter = 1							
							delete @tags

							if @prob_tags between 0 and 86
								begin
								-- El 86% del tiempo obtiene tags de la preferencia
									set @cursor = cursor for
									select generics.name from dbo.CDB_TagsXUser tagsuser inner join dbo.CDB_Generics generics on (tagsuser.idTag = generics.idGeneric) where tagsuser.idUser = @tmpuser and tagsuser.preference = 1

									open @cursor
									fetch next from @cursor
									into @tmptag

									while @@FETCH_STATUS = 0
									begin
			
										insert into @tags ( id, tag )
										values (@tmpcounter, @tmptag)

										set @tmpcounter = @tmpcounter + 1
										fetch next from @cursor
										into @tmptag
									end

									close @cursor
									deallocate @cursor
								end
							else
								begin
								-- El 14% del tiempo obtiene tags que no son parte de las preferencias principales
									set @cursor = cursor for
									select generics.name from dbo.CDB_TagsXUser tagsuser inner join dbo.CDB_Generics generics on (tagsuser.idTag = generics.idGeneric) where tagsuser.idUser = @tmpuser and tagsuser.preference = 0

									open @cursor
									fetch next from @cursor
									into @tmptag

									while @@FETCH_STATUS = 0
									begin
			
										insert into @tags ( id, tag )
										values (@tmpcounter, @tmptag)

										set @tmpcounter = @tmpcounter + 1
										fetch next from @cursor
										into @tmptag
									end

									close @cursor
									deallocate @cursor
								end

							if @prob_campaign between 0 and 84
							begin
								select * from
							end
							--
							-- insertar log
							--

							set @tmpcounter = @tmpcounter + 1
						end
					
					-- Selecciona el siguiente usuario
					select @random = cast( RAND() * (select count(1) from @users) as int) + 1
					--Se asegura que el usuario seleccionado no se haya usado anteriormente
					while exists ( select count(1) from @users_used where id = @random)
					begin
						select @random = cast( RAND() * (select count(1) from @users) as int) + 1
					end
					-- Obtiene el identifier del user
					select @tmpuser = userid from @users where id = @random
					insert into @users_used (id) values (@random)
					-- Resta uno a la cantidad de usuarios y continua con el siguiente
					set @quantityUsers = @quantityUsers - 1
				end




			-- Aumento el puntero para avanzar en la tabla de informacion de los logs
			set @pointer = @pointer + 1
		end