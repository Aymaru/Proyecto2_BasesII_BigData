-- use Campaign
-- drop procedure CDBPS_GENERATE_LOGS
CREATE PROCEDURE CDBPS_GENERATE_LOGS
as

	-- variables para insertar logs en la tabla

	-- Generales para todos los logs de cada usuario
	declare @username as nvarchar(32)
	declare @gender as nvarchar(32) 
	declare @age as nvarchar(32) 

	-- Independiente para cada log
	declare @duration as int 
	declare @action_type as nvarchar(32)
	declare @description as nvarchar(150)
	declare @country as nvarchar(32)
	declare @city as nvarchar(32)
	declare @latitude as float 
	declare @longitude as float 
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
	 
	declare @pointer as int
	declare @idCityXCountry as int
	declare @location1 as int
	declare @location2 as int
	declare @location3 as int
	declare @location4 as int
	
	declare @logsXuser as int
	declare @quantityLogs as int
	declare @quantityUsers as int
	declare @quantityActions as int
	
	declare @tmpcounter as int
	declare @tmpcampaign as int
	declare @tmpuser as uniqueidentifier
	declare @tmpaction as int
	declare @random as int
	declare @tagcounter as int
	declare @campaigncounter as int
	declare @isDirectAction as bit
	declare @isContent as bit

	declare @cursor as cursor

	-- tablas para tener registro de los elementos repetidos

	declare @users as table (id int, userid uniqueidentifier)
	declare @tags as table (id int, tag nvarchar(32))
	declare @campaigns as table (id int, campaign int)
	declare @users_used as table (id int)

	-- variables para generar una fecha aleatoria
	declare @days as int
	declare @hours as int
	declare @minutes as int

	declare @tmpdate as datetime
	declare @date_template as datetime

	-- variables para calcular la latitud y longitud de un log
	declare @lat1 as float
	declare @lat2 as float
	declare @lat3 as float
	declare @lat4 as float
	declare @lon1 as float
	declare @lon2 as float
	declare @lon3 as float
	declare @lon4 as float
	declare @MAXLAT as float
	declare @MAXLON as float
	declare @MINLAT as float
	declare @MINLON as float

	-- variables para determinar rangos
	declare @prob_tags as int -- 85% prob de que los tags sean de preferencia
	declare @prob_location as int -- 20% prob de estar lejos
	declare @prob_campaign as int -- 16% prob de estar asociado a una campaña
	declare @prob_action as int -- Para la tabla de actions info
	declare @prob_repeat as int -- 15% prob de repetir la accion de 1 a 3 veces
	declare @prob_duration as int -- Duracion de las acciones indirectas 65% de 1 a 3 y el resto de 3 a 8

	declare @first as int
	declare @idLog as int
	declare @idTagxlog int


	set nocount on

	-- Iniciar contador en 1
	set @tmpcounter = 1

	set @content_url = 'http:someurl'

	-- ingresa todos los usuarios a una tabla variable
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
		
			--select @quantityLogs = quantityLogs, @quantityUsers = quantityUsers, @quantityActions = quantityActions from dbo.CDB_LogsInfo where @pointer = idLogInfo
			--set @logsXuser = @quantityLogs / @quantityUsers 
			--set @logsXuser = @logsXuser + (@logsXuser * 0.2)
			set @quantityUsers = 10
			set @logsXuser = 50
			-- Limpia la tabla temporal de usuarios usados
			delete from @users_used

			-- Selecciona un usuario aleatorio
			select @random = cast( RAND() * (select count(1) from @users) as int) + 1
			select @tmpuser = userid from @users where id = @random
			-- Agrega el usuario a la tabla de usuarios usados
			insert into @users_used (id) values (@random)

			-- Ciclo para recorrer los usuarios que se utilicen
			while @quantityUsers > 0
				begin
					select @username = name from dbo.CDB_UsersInfo where idUnique = @tmpuser
					-- Genera la edad del usuario, edades entre 13 y 60
					set @random = cast( RAND() * 48 as int)
					set @age = @random + 13
					
					-- Genera el genero aleatorio, los valores de genero son 10 11 y 12, hombre, mujer e indefinido respectivamente
					set @random = cast( RAND() * 3 as int) + 10
					select @gender = generics.name from dbo.CDB_Generics generics where idGeneric = @random

					set @tmpcounter = 0 -- Ciclo para generar los logs x usuario

					while @tmpcounter < @logsXuser
						begin
							-- Limpia todas las variables que se necesiten generar para cada log
							set @duration = null
							set @content_type = null
							set @content_description = null
							set @utm_source = null
							set @utm_medium = null
							set @utm_campaign = null
							set @utm_term = null
							set @utm_content = null
							set @social_network = null
							set @tmpdate = null
							set @campaign_name = null
							delete from @tags
							delete from @campaigns
							
							-- Año base 
							select @date_template = '2019-01-01 00:00:00.000'
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

							select @tmpaction = actions.idAction, @isContent = actions.isContent from dbo.CDB_ActionsInfo actions inner join dbo.CDB_Ranges ranges on (actions.idRange = ranges.idRange) where @prob_action between ranges.startRange and ranges.endRange
							
							-- Seleccionar una accion aleatoria
							select @first = g2.idGeneric from dbo.CDB_Generics g1 inner join CDB_ActionsXSection actionsXsection on (g1.idGeneric = actionsXsection.idActionSection) inner join dbo.CDB_Generics g2 on (g2.idGeneric = actionsXsection.idAction) where actionsXsection.idActionSection = @tmpaction
							select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics g1 inner join CDB_ActionsXSection actionsXsection on (g1.idGeneric = actionsXsection.idActionSection) inner join dbo.CDB_Generics g2 on (g2.idGeneric = actionsXsection.idAction) where actionsXsection.idActionSection = @tmpaction) as int)
							select @action_type = generics.name, @description = generics.description from dbo.CDB_Generics generics where idGeneric = (@first + @random)
							
							select @isDirectAction = axs.is_direct_action from dbo.CDB_ActionsXSection axs inner join dbo.CDB_Generics generics on (axs.idAction = generics.idGeneric) where generics.name = @action_type
							
							if @isDirectAction = 0
								begin
										if @prob_duration < 65
											begin
												set @duration = cast ( RAND() * 3 as int ) + 1
											end
										else
											begin
												set @duration = cast ( RAND() * 6 as int ) + 3
											end
								end

							if @isContent = 1
								begin
									select @first =  min(generics.idGeneric) from dbo.CDB_Generics generics where idType = 8
									select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics generics where idType = 8) as int)
									select @content_type = generics.name, @content_description = generics.description from dbo.CDB_Generics generics where idGeneric = (@first + @random)
								end

							-- Obtiene Nombre de Ciudad y Pais del Usuario
							select  @idCityXCountry = usersinfo.idCityXCountry, @country = g1.name, @city = g2.name, @lat1 = l1.latitude, @lat2 = l2.latitude, @lat3 = l3.latitude, @lat4 = l4.latitude, @lon1 = l1.longitude, @lon2 = l2.longitude, @lon3 = l3.longitude, @lon4 = l4.longitude -- @location1 = usersinfo.location1, @location2 = usersinfo.location2, @location3 = usersinfo.location3, @location4 = usersinfo.location4
							from	dbo.CDB_UsersInfo usersinfo inner join 
									dbo.CDB_CitiesXCountry cxc on (usersinfo.idCityXCountry = cxc.idCityXCountry) inner join
									dbo.CDB_Generics g1 on (g1.idGeneric = cxc.idCountry) inner join 
									dbo.CDB_Generics g2 on (g2.idGeneric = cxc.idCity) inner join
									dbo.CDB_Ranges ranges on (usersinfo.idRangeLocation = ranges.idRange) inner join
									dbo.CDB_Location l1 on (usersinfo.location1 = l1.idLocation) inner join
									dbo.CDB_Location l2 on (usersinfo.location2 = l2.idLocation) inner join
									dbo.CDB_Location l3 on (usersinfo.location3 = l3.idLocation) inner join
									dbo.CDB_Location l4 on (usersinfo.location4 = l4.idLocation)
							where usersinfo.idUnique = @tmpuser	and @prob_location between ranges.startRange and ranges.endRange		
							
							if @location1 = null
								begin
									select  @lat1 = l1.latitude, @lat2 = l2.latitude, @lat3 = l3.latitude, @lat4 = l4.latitude, @lon1 = l1.longitude, @lon2 = l2.longitude, @lon3 = l3.longitude, @lon4 = l4.longitude 
									from dbo.CDB_CitiesXCountry cxc inner join
										dbo.CDB_Location l1 on (cxc.idLocation1 = l1.idLocation) inner join
										dbo.CDB_Location l2 on (cxc.idLocation2 = l2.idLocation) inner join
										dbo.CDB_Location l3 on (cxc.idLocation3 = l3.idLocation) inner join
										dbo.CDB_Location l4 on (cxc.idLocation4 = l4.idLocation)
									where cxc.idCityXCountry = @idCityXCountry
								end								
								
							set @MAXLAT = dbo.CDBFN_CALCMAXVALUE(@lat1,@lat2,@lat3,@lat4)
							set @MINLAT = dbo.CDBFN_CALCMINVALUE(@lat1,@lat2,@lat3,@lat4)
							set @MAXLON = dbo.CDBFN_CALCMAXVALUE(@lon1,@lon2,@lon3,@lon4)
							set @MINLON = dbo.CDBFN_CALCMAXVALUE(@lon1,@lon2,@lon3,@lon4)

							-- Generar latitud y longitud aleatoria
							set @latitude = ROUND (  RAND() * (@MAXLAT - @MINLAT) + @MINLAT, 4 ,1)
							set @longitude = ROUND (  RAND() * (@MAXLON - @MINLON) + @MINLON , 4 ,1)	
							
							-- Obtiene los tags del contenido
							set @tagcounter = 1	

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
										values (@tagcounter, @tmptag)

										set @tagcounter = @tagcounter + 1
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
										values (@tagcounter, @tmptag)

										set @tagcounter = @tagcounter + 1
										fetch next from @cursor
										into @tmptag
									end

									close @cursor
									deallocate @cursor
								end
							
							select @random = cast( RAND() * (select count(1) from @tags) as int) + 1
							select @tmptag = tag from @tags where id = @random
							
							if @prob_campaign between 0 and 16
								begin
									set @campaigncounter = 1
									-- El 86% del tiempo obtiene tags de la preferencia
									set @cursor = cursor for
									select cxcxc.idCampaign
									from dbo.CDB_Campaign campaign inner join
										dbo.CDB_CitiesXCountryXCampaign cxcxc on (campaign.idCampaign = cxcxc.idCampaign)
									where @idCityXCountry = cxcxc.idCityXCountry and @tmpdate between campaign.startDate and campaign.endDate 

									open @cursor
									fetch next from @cursor
									into @tmpcampaign

									while @@FETCH_STATUS = 0
									begin
			
										insert into @campaigns ( id, campaign )
										values (@campaigncounter, @tmpcampaign)

										set @campaigncounter = @campaigncounter + 1

										fetch next from @cursor
										into @tmpcampaign
									end

									close @cursor
									deallocate @cursor

									set @random = cast ( RAND() * (select count(1) from @campaigns) as int) + 1
									select @tmpcampaign = campaign from @campaigns where id = @random

									select @campaign_name = 'Campaña ' + cast( campaign.idCampaign as nvarchar(32)), @social_network = gsnx.name, @utm_source = utm.utm_source, @utm_medium = utm.utm_medium, @utm_campaign = utm.utm_campaign, @utm_term = utm.utm_term, @utm_content = utm.utm_content
									from	@campaigns c inner join dbo.CDB_Campaign campaign on (c.campaign = campaign.idCampaign) inner join
											dbo.CDB_SocialNetworkXCampaign snxc on (campaign.idCampaign = snxc.idCampaign) inner join
											dbo.CDB_Generics gsnx on (snxc.idSocialNetwork = gsnx.idGeneric) inner join
											dbo.CDB_UTMTagsXCampaign utmxc on (campaign.idCampaign = utmxc.idCampaign) inner join
											dbo.CDB_UTMTags utm on (utm.idUTMTag = utmxc.idUTMTag )
									where campaign.idCampaign = @random

								end
							--
							-- insertar log
							--
							insert into dbo.CDB_Logs (username, gender, age, _datetime, action_type, duration, description, country, city, latitude, longitude,content_type, content_description, content_url, campaign_name ,social_network , utm_source, utm_medium, utm_campaign, utm_term, utm_content)
							values (@username, RTRIM(@gender), @age, @tmpdate, RTRIM(@action_type), @duration, @description, RTRIM(@country), RTRIM(@city), @latitude, @longitude, RTRIM(@content_type), @content_description, @content_url, RTRIM(@campaign_name), RTRIM(@social_network), RTRIM(@utm_source), RTRIM(@utm_medium), RTRIM(@utm_campaign), RTRIM(@utm_term), RTRIM(@utm_content))
							
							select @idLog = max(idLog) from dbo.CDB_Logs
							set @idTagxlog = 1
							select @tagcounter = cast ( RAND() * 3 as int) + 3

							while @tagcounter > 0
								begin
									set @random = cast (RAND() * (select count(1) from @tags)as int)
									select @tmptag = tag from @tags where id = @random 


									insert into dbo.CDB_TagsXLog (_id, idLog, tag)
									values (@idTagxlog, @idLog, RTRIM(@tmptag))

									set @tagcounter = @tagcounter - 1
									set @idTagxLog = @idTagxlog + 1
								end
					
						set @tmpcounter = @tmpcounter + 1
						end
					
					-- Selecciona el siguiente usuario
					select @random = cast( RAND() * (select count(1) from @users) as int) + 1
					
					----Se asegura que el usuario seleccionado no se haya usado anteriormente
					--while exists( select count(1) from @users_used where id = @random)
					--begin
					--	select @random = cast( RAND() * (select count(1) from @users) as int) + 1
					--end

					-- Obtiene el identifier del user
					select @tmpuser = userid from @users where id = @random
					insert into @users_used (id) values (@random)
					-- Resta uno a la cantidad de usuarios y continua con el siguiente
					set @quantityUsers = @quantityUsers - 1
				end

			-- Aumento el puntero para avanzar en la tabla de informacion de los logs
			set @pointer = @pointer + 1
		end