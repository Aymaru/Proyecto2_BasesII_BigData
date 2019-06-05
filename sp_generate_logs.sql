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
								tag5 nvarchar(32),
								tag6 nvarchar(32),
								tag7 nvarchar(32),
								tag8 nvarchar(32),
								tag9 nvarchar(32),
								tag10 nvarchar(32)
							)
	declare @pointer as int
	declare @logsXuser as int
	declare @quantityLogs as int
	declare @quantityUsers as int
	declare @quantityActions as int

	declare @users as table (userid uniqueidentifier)
	declare @actions as table (idaction int)

	select * from dbo.CDB_ActionsInfo
	set nocount on

	set @pointer = 1

	while exists (select idLogInfo from dbo.CDB_LogsInfo where idLogInfo = @pointer)
		begin
		
		select @quantityLogs = quantityLogs, @quantityUsers = quantityUsers, @quantityActions = quantityActions from dbo.CDB_LogsInfo where @pointer = idLogInfo
		set @logsXuser = @quantityLogs / @quantityUsers 
		set @logsXuser = @logsXuser + (@logsXuser * 0.2)





		end