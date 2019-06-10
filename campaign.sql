USE [master]
GO
/****** Object:  Database [Campaign]    Script Date: 10/6/2019 13:06:18 ******/
ALTER DATABASE [Campaign] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Campaign].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Campaign] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Campaign] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Campaign] SET ARITHABORT OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Campaign] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Campaign] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Campaign] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Campaign] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Campaign] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Campaign] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Campaign] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Campaign] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Campaign] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Campaign] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Campaign] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Campaign] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Campaign] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Campaign] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Campaign] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Campaign] SET RECOVERY FULL 
GO
ALTER DATABASE [Campaign] SET  MULTI_USER 
GO
ALTER DATABASE [Campaign] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Campaign] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Campaign] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Campaign] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Campaign] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Campaign', N'ON'
GO
ALTER DATABASE [Campaign] SET QUERY_STORE = OFF
GO
USE [Campaign]
GO
/****** Object:  UserDefinedFunction [dbo].[CDBFN_CALCMAXVALUE]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CDBFN_CALCMAXVALUE](@val1 float, @val2 float, @val3 float, @val4 float)
returns float
as
begin
  declare @result as float

	set @result = @val1

	if @val2 > @result
		set @result = @val2

	if @val3 > @result
		set @result = @val3

	if @val4 > @result
		set @result = @val4

	return @result
end		
GO
/****** Object:  UserDefinedFunction [dbo].[CDBFN_CALCMINVALUE]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CDBFN_CALCMINVALUE](@val1 float, @val2 float, @val3 float, @val4 float)
returns float
as
begin
  declare @result as float

	set @result = @val1

	if @val2 < @result
		set @result = @val2

	if @val3 < @result
		set @result = @val3

	if @val4 < @result
		set @result = @val4

	return @result
end		
GO
/****** Object:  Table [dbo].[CDB_ActionsInfo]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_ActionsInfo](
	[idActionInfo] [int] IDENTITY(1,1) NOT NULL,
	[idAction] [int] NOT NULL,
	[percentage] [int] NOT NULL,
	[idRange] [int] NOT NULL,
	[isContent] [bit] NOT NULL,
 CONSTRAINT [PK_CDB_ActionsInfo] PRIMARY KEY CLUSTERED 
(
	[idActionInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_ActionsXSection]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_ActionsXSection](
	[idActionXType] [int] IDENTITY(1,1) NOT NULL,
	[idActionSection] [int] NOT NULL,
	[idAction] [int] NOT NULL,
	[is_direct_action] [bit] NULL,
 CONSTRAINT [PK_CDB_ActionsXSection] PRIMARY KEY CLUSTERED 
(
	[idActionXType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Campaign]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Campaign](
	[idCampaign] [int] IDENTITY(1,1) NOT NULL,
	[idAgeRage] [int] NOT NULL,
	[idGender] [int] NOT NULL,
	[duration] [nvarchar](32) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[totalCost] [money] NOT NULL,
	[description] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_CDB_Campaign] PRIMARY KEY CLUSTERED 
(
	[idCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_CitiesXCountry]    Script Date: 10/6/2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_CitiesXCountry](
	[idCityXCountry] [int] IDENTITY(1,1) NOT NULL,
	[idCountry] [int] NOT NULL,
	[idCity] [int] NOT NULL,
	[isCountry] [bit] NOT NULL,
	[idLocation1] [int] NOT NULL,
	[idLocation2] [int] NOT NULL,
	[idLocation3] [int] NOT NULL,
	[idLocation4] [int] NOT NULL,
	[idCenterLocation] [int] NOT NULL,
 CONSTRAINT [PK_CDB_CitiesXCountry] PRIMARY KEY CLUSTERED 
(
	[idCityXCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_CitiesXCountryXCampaign]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_CitiesXCountryXCampaign](
	[idCitiesXCountryXCampaign] [int] IDENTITY(1,1) NOT NULL,
	[idCityXCountry] [int] NOT NULL,
	[idCampaign] [int] NOT NULL,
 CONSTRAINT [PK_CDB_CitiesXCountryXCampaign] PRIMARY KEY CLUSTERED 
(
	[idCitiesXCountryXCampaign] ASC,
	[idCityXCountry] ASC,
	[idCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Generics]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Generics](
	[idGeneric] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NOT NULL,
	[name] [nchar](32) NOT NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_CDB_Generics] PRIMARY KEY CLUSTERED 
(
	[idGeneric] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Location]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Location](
	[idLocation] [int] IDENTITY(1,1) NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
 CONSTRAINT [PK_CDB_Location] PRIMARY KEY CLUSTERED 
(
	[idLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Logs]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Logs](
	[idLog] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](32) NULL,
	[gender] [nvarchar](32) NULL,
	[age] [int] NULL,
	[_datetime] [datetime] NULL,
	[action_type] [nvarchar](32) NULL,
	[duration] [int] NULL,
	[description] [nvarchar](150) NULL,
	[country] [nvarchar](32) NULL,
	[city] [nvarchar](32) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[content_type] [nvarchar](32) NULL,
	[content_description] [nvarchar](32) NULL,
	[content_url] [nvarchar](32) NULL,
	[utm_source] [nvarchar](32) NULL,
	[utm_medium] [nvarchar](32) NULL,
	[utm_campaign] [nvarchar](32) NULL,
	[utm_term] [nvarchar](32) NULL,
	[utm_content] [nvarchar](32) NULL,
	[campaign_name] [nvarchar](32) NULL,
	[social_network] [nvarchar](32) NULL,
 CONSTRAINT [PK_CDB_Logs] PRIMARY KEY CLUSTERED 
(
	[idLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_LogsInfo]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_LogsInfo](
	[idLogInfo] [int] IDENTITY(1,1) NOT NULL,
	[days] [int] NOT NULL,
	[percentage] [int] NOT NULL,
	[quantityLogs] [int] NOT NULL,
	[quantityActions] [int] NOT NULL,
	[quantityUsers] [int] NOT NULL,
 CONSTRAINT [PK_CDB_LogsInfo] PRIMARY KEY CLUSTERED 
(
	[idLogInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Ranges]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Ranges](
	[idRange] [int] IDENTITY(1,1) NOT NULL,
	[startRange] [int] NOT NULL,
	[endRange] [int] NOT NULL,
 CONSTRAINT [PK_CDB_Ranges] PRIMARY KEY CLUSTERED 
(
	[idRange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_SocialNetworkXCampaign]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_SocialNetworkXCampaign](
	[idSocialNetworkXCampaign] [int] IDENTITY(1,1) NOT NULL,
	[idSocialNetwork] [int] NOT NULL,
	[idCampaign] [int] NOT NULL,
	[publicAmount] [int] NULL,
	[totalCost] [money] NULL,
	[webURL] [nvarchar](90) NOT NULL,
 CONSTRAINT [PK_CDB_SocialNetworkXCampaign] PRIMARY KEY CLUSTERED 
(
	[idSocialNetworkXCampaign] ASC,
	[idSocialNetwork] ASC,
	[idCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_TagsXCampaign]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_TagsXCampaign](
	[idTagsXCampaign] [int] IDENTITY(1,1) NOT NULL,
	[idTag] [int] NOT NULL,
	[idCampaign] [int] NOT NULL,
 CONSTRAINT [PK_TagsXCampaign] PRIMARY KEY CLUSTERED 
(
	[idTagsXCampaign] ASC,
	[idTag] ASC,
	[idCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_TagsXLog]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_TagsXLog](
	[_id] [int] NOT NULL,
	[idLog] [int] NOT NULL,
	[tag] [nvarchar](32) NULL,
 CONSTRAINT [PK_CDB_TagsXLog] PRIMARY KEY CLUSTERED 
(
	[_id] ASC,
	[idLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_TagsXUser]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_TagsXUser](
	[idTagXUser] [int] IDENTITY(1,1) NOT NULL,
	[idTag] [int] NOT NULL,
	[idUser] [uniqueidentifier] NOT NULL,
	[preference] [bit] NOT NULL,
 CONSTRAINT [PK_CDB_TagsXUser] PRIMARY KEY CLUSTERED 
(
	[idTagXUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_TimesInfo]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_TimesInfo](
	[idTime] [int] IDENTITY(1,1) NOT NULL,
	[startHour] [datetime] NULL,
	[endHour] [datetime] NULL,
 CONSTRAINT [PK_CDB_TimesInfo] PRIMARY KEY CLUSTERED 
(
	[idTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_Types]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_Types](
	[idType] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](36) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_CDB_Types] PRIMARY KEY CLUSTERED 
(
	[idType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_UsersInfo]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_UsersInfo](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[idUnique] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[idCityXCountry] [int] NOT NULL,
	[location1] [int] NULL,
	[location2] [int] NULL,
	[location3] [int] NULL,
	[location4] [int] NULL,
	[idRangeLocation] [int] NOT NULL,
	[idRangeTag] [int] NOT NULL,
 CONSTRAINT [PK_CDB_UsersInfo_1] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_UTMTags]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_UTMTags](
	[idUTMTag] [int] IDENTITY(1,1) NOT NULL,
	[utm_source] [nvarchar](32) NOT NULL,
	[utm_medium] [nvarchar](32) NOT NULL,
	[utm_campaign] [nvarchar](32) NOT NULL,
	[utm_term] [nvarchar](32) NULL,
	[utm_content] [nvarchar](32) NULL,
 CONSTRAINT [PK_CDB_UTMTags] PRIMARY KEY CLUSTERED 
(
	[idUTMTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_UTMTagsXCampaign]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_UTMTagsXCampaign](
	[idUTMTagXCampaign] [int] IDENTITY(1,1) NOT NULL,
	[idUTMTag] [int] NULL,
	[idCampaign] [int] NULL,
 CONSTRAINT [PK_CDB_UTMTagsXCampaign] PRIMARY KEY CLUSTERED 
(
	[idUTMTagXCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_CDB_Campaign_7_997578592__K1_K5_K6]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_Campaign_7_997578592__K1_K5_K6] ON [dbo].[CDB_Campaign]
(
	[idCampaign] ASC,
	[startDate] ASC,
	[endDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_CDB_SocialNetworkXCampaign_7_1253579504__K3_K2]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_SocialNetworkXCampaign_7_1253579504__K3_K2] ON [dbo].[CDB_SocialNetworkXCampaign]
(
	[idCampaign] ASC,
	[idSocialNetwork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_CDB_TagsXUser_7_1317579732__K3_K4_K2_1]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_TagsXUser_7_1317579732__K3_K4_K2_1] ON [dbo].[CDB_TagsXUser]
(
	[idUser] ASC,
	[preference] ASC,
	[idTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_CDB_UsersInfo_7_1413580074__K2]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_UsersInfo_7_1413580074__K2] ON [dbo].[CDB_UsersInfo]
(
	[idUnique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_CDB_UsersInfo_7_1413580074__K2_3]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_UsersInfo_7_1413580074__K2_3] ON [dbo].[CDB_UsersInfo]
(
	[idUnique] ASC
)
INCLUDE ( 	[name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_CDB_UsersInfo_7_1413580074__K2_K9_K7_K6_K5_K8_K4]    Script Date: 10/6/2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [_dta_index_CDB_UsersInfo_7_1413580074__K2_K9_K7_K6_K5_K8_K4] ON [dbo].[CDB_UsersInfo]
(
	[idUnique] ASC,
	[idRangeLocation] ASC,
	[location3] ASC,
	[location2] ASC,
	[location1] ASC,
	[location4] ASC,
	[idCityXCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CDB_ActionsInfo] ADD  CONSTRAINT [DF_CDB_ActionsInfo_isContent]  DEFAULT ((0)) FOR [isContent]
GO
ALTER TABLE [dbo].[CDB_ActionsXSection] ADD  CONSTRAINT [DF_CDB_ActionsXSection_is_direct_action]  DEFAULT ((1)) FOR [is_direct_action]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] ADD  CONSTRAINT [DF_CDB_CitiesXCountry_isCountry]  DEFAULT ((0)) FOR [isCountry]
GO
ALTER TABLE [dbo].[CDB_TagsXUser] ADD  CONSTRAINT [DF_CDB_TagsXUser_preference]  DEFAULT ((1)) FOR [preference]
GO
ALTER TABLE [dbo].[CDB_ActionsInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_ActionsInfo_idAction_CDB_Generics_idGeneric] FOREIGN KEY([idAction])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_ActionsInfo] CHECK CONSTRAINT [FK_CDB_ActionsInfo_idAction_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_ActionsInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_ActionsInfo_idRange_CDB_Ranges_idRange] FOREIGN KEY([idRange])
REFERENCES [dbo].[CDB_Ranges] ([idRange])
GO
ALTER TABLE [dbo].[CDB_ActionsInfo] CHECK CONSTRAINT [FK_CDB_ActionsInfo_idRange_CDB_Ranges_idRange]
GO
ALTER TABLE [dbo].[CDB_ActionsXSection]  WITH CHECK ADD  CONSTRAINT [FK_CDB_ActionsXSection_idAction_CDB_Generics_idGeneric] FOREIGN KEY([idAction])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_ActionsXSection] CHECK CONSTRAINT [FK_CDB_ActionsXSection_idAction_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_ActionsXSection]  WITH CHECK ADD  CONSTRAINT [FK_CDB_ActionsXSection_idActionSection_CDB_Generics_idGeneric] FOREIGN KEY([idActionSection])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_ActionsXSection] CHECK CONSTRAINT [FK_CDB_ActionsXSection_idActionSection_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_Campaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_Campaign_idGender_CDB_Generics_idGeneric] FOREIGN KEY([idGender])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_Campaign] CHECK CONSTRAINT [FK_CDB_Campaign_idGender_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idGeneric_CDB_Generics_idCity] FOREIGN KEY([idCity])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idGeneric_CDB_Generics_idCity]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idGeneric_CDB_Generics_idCountry] FOREIGN KEY([idCountry])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idGeneric_CDB_Generics_idCountry]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idCenterLocation] FOREIGN KEY([idCenterLocation])
REFERENCES [dbo].[CDB_Location] ([idLocation])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idCenterLocation]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation1] FOREIGN KEY([idLocation1])
REFERENCES [dbo].[CDB_Location] ([idLocation])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation1]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation2 ] FOREIGN KEY([idLocation2])
REFERENCES [dbo].[CDB_Location] ([idLocation])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation2 ]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation3] FOREIGN KEY([idLocation3])
REFERENCES [dbo].[CDB_Location] ([idLocation])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation3]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation4] FOREIGN KEY([idLocation4])
REFERENCES [dbo].[CDB_Location] ([idLocation])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] CHECK CONSTRAINT [FK_CDB_CitiesXCountry_idLocation_CDB_Location_idLocation4]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountryXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountryXCampaign_idCampaign_CDB_Campaign_idCampaign] FOREIGN KEY([idCampaign])
REFERENCES [dbo].[CDB_Campaign] ([idCampaign])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountryXCampaign] CHECK CONSTRAINT [FK_CDB_CitiesXCountryXCampaign_idCampaign_CDB_Campaign_idCampaign]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountryXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_CitiesXCountryXCampaign_idCityXCountry_CDB_CitiesXCountry_idCityXCountry] FOREIGN KEY([idCityXCountry])
REFERENCES [dbo].[CDB_CitiesXCountry] ([idCityXCountry])
GO
ALTER TABLE [dbo].[CDB_CitiesXCountryXCampaign] CHECK CONSTRAINT [FK_CDB_CitiesXCountryXCampaign_idCityXCountry_CDB_CitiesXCountry_idCityXCountry]
GO
ALTER TABLE [dbo].[CDB_Generics]  WITH CHECK ADD  CONSTRAINT [FK_CDB_Generics_idType_CDB_Types_idType] FOREIGN KEY([idType])
REFERENCES [dbo].[CDB_Types] ([idType])
GO
ALTER TABLE [dbo].[CDB_Generics] CHECK CONSTRAINT [FK_CDB_Generics_idType_CDB_Types_idType]
GO
ALTER TABLE [dbo].[CDB_SocialNetworkXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_SocialNetworkXCampaign_idCampaign_CDB_Campaign_idCampaign] FOREIGN KEY([idCampaign])
REFERENCES [dbo].[CDB_Campaign] ([idCampaign])
GO
ALTER TABLE [dbo].[CDB_SocialNetworkXCampaign] CHECK CONSTRAINT [FK_CDB_SocialNetworkXCampaign_idCampaign_CDB_Campaign_idCampaign]
GO
ALTER TABLE [dbo].[CDB_SocialNetworkXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_SocialNetworkXCampaign_idSocialNetwork_CDB_Generics_idGeneric] FOREIGN KEY([idSocialNetwork])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_SocialNetworkXCampaign] CHECK CONSTRAINT [FK_CDB_SocialNetworkXCampaign_idSocialNetwork_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_TagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_TagsXCampaign_idCampaign_CDB_Campaign_idCampaign] FOREIGN KEY([idCampaign])
REFERENCES [dbo].[CDB_Campaign] ([idCampaign])
GO
ALTER TABLE [dbo].[CDB_TagsXCampaign] CHECK CONSTRAINT [FK_TagsXCampaign_idCampaign_CDB_Campaign_idCampaign]
GO
ALTER TABLE [dbo].[CDB_TagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_TagsXCampaign_idTag_CDB_Generics_idGeneric] FOREIGN KEY([idTag])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_TagsXCampaign] CHECK CONSTRAINT [FK_TagsXCampaign_idTag_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_TagsXLog]  WITH CHECK ADD  CONSTRAINT [FK_CDB_TagsXLog_idLog_CDB_Logs_idLog] FOREIGN KEY([idLog])
REFERENCES [dbo].[CDB_Logs] ([idLog])
GO
ALTER TABLE [dbo].[CDB_TagsXLog] CHECK CONSTRAINT [FK_CDB_TagsXLog_idLog_CDB_Logs_idLog]
GO
ALTER TABLE [dbo].[CDB_TagsXUser]  WITH CHECK ADD  CONSTRAINT [FK_CDB_TagsXUser_idTag_CDB_Generics_idGeneric] FOREIGN KEY([idTag])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_TagsXUser] CHECK CONSTRAINT [FK_CDB_TagsXUser_idTag_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_UsersInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UsersInfo_idCityXCountry_CDB_CitiesXCountry_idCityXCountry] FOREIGN KEY([idCityXCountry])
REFERENCES [dbo].[CDB_CitiesXCountry] ([idCityXCountry])
GO
ALTER TABLE [dbo].[CDB_UsersInfo] CHECK CONSTRAINT [FK_CDB_UsersInfo_idCityXCountry_CDB_CitiesXCountry_idCityXCountry]
GO
ALTER TABLE [dbo].[CDB_UsersInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UsersInfo_idRangeLocation_CDB_Ranges_idRange] FOREIGN KEY([idRangeLocation])
REFERENCES [dbo].[CDB_Ranges] ([idRange])
GO
ALTER TABLE [dbo].[CDB_UsersInfo] CHECK CONSTRAINT [FK_CDB_UsersInfo_idRangeLocation_CDB_Ranges_idRange]
GO
ALTER TABLE [dbo].[CDB_UsersInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UsersInfo_idRangeTag_CDB_Ranges_idRange] FOREIGN KEY([idRangeTag])
REFERENCES [dbo].[CDB_Ranges] ([idRange])
GO
ALTER TABLE [dbo].[CDB_UsersInfo] CHECK CONSTRAINT [FK_CDB_UsersInfo_idRangeTag_CDB_Ranges_idRange]
GO
ALTER TABLE [dbo].[CDB_UTMTagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UTMTagsXCampaign_idCampaign_CDB_Campaign_idCampaign] FOREIGN KEY([idCampaign])
REFERENCES [dbo].[CDB_Campaign] ([idCampaign])
GO
ALTER TABLE [dbo].[CDB_UTMTagsXCampaign] CHECK CONSTRAINT [FK_CDB_UTMTagsXCampaign_idCampaign_CDB_Campaign_idCampaign]
GO
ALTER TABLE [dbo].[CDB_UTMTagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UTMTagsXCampaign_idUTMTag_CDB_UTMTags_idUTMTag] FOREIGN KEY([idUTMTag])
REFERENCES [dbo].[CDB_UTMTags] ([idUTMTag])
GO
ALTER TABLE [dbo].[CDB_UTMTagsXCampaign] CHECK CONSTRAINT [FK_CDB_UTMTagsXCampaign_idUTMTag_CDB_UTMTags_idUTMTag]
GO
/****** Object:  StoredProcedure [dbo].[CDBPS_GENERATE_LOGS]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- use Campaign
-- drop procedure CDBPS_GENERATE_LOGS
CREATE PROCEDURE [dbo].[CDBPS_GENERATE_LOGS]
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
GO
/****** Object:  StoredProcedure [dbo].[CDBSP_GENERATE_RANDOM_GENERIC_ID]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CDBSP_GENERATE_RANDOM_GENERIC_ID](
	@idType as int
) 
 as
	-- Variables auxiliares
	declare @random as int
	declare @first as int
	declare @idGeneric as int


	set nocount on

	select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 2)
	select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 2) as int)
	select @idGeneric = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

	select @idGeneric
GO
/****** Object:  StoredProcedure [dbo].[CDBSP_INSERT_CAMPAIGN]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- use Campaign
-- drop procedure CDBSP_INSERT_CAMPAIGN
CREATE PROCEDURE [dbo].[CDBSP_INSERT_CAMPAIGN] 
 as
	--- Variable para saber el id de la campaña actual
	declare @idCampaign as int

	-- Variables para insertar Campaña
	declare @idAgeRange as int
	declare @idGender as int
	declare @duration as nvarchar(32)
	declare @startDate as datetime
	declare @endDate as datetime
	
	-- Variables para insertar Red Social X Campaña
	declare @idSocialNetwork as int
	declare @publicAmount as int
	
	-- Variables para insertar un utm tag x campaña
	declare @idUTMTag as int

	-- Variables para insertar una ciudad x campaña
	declare @idCityxCountry as int

	-- Variables para insertar tags x campaña
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

	-- Año base 
	select @date_template = '2019-01-01 00:00:00.000'
	-- Genera un dia aleatorio para el inicio de la campaña
	select @random = cast (RAND () * 365 as int) 
	-- Genera una duracion aleatoria entre 5 y 9 dias
	select @random_duration = cast (RAND () * 5 as int) + 5
	-- Genera la fecha inicial de la campaña
	select @startDate = DATEADD(day, @random, @date_template)
	-- Suma la duracion a la fecha inicial y genera la fecha final
	select @endDate = DATEADD(day, @random_duration, @startDate)

	-- Genera un costo aleatorio
	select @cost = cast (RAND () * 9999999 as int)
	 
	-- Inserta la nueva campaña
	insert into dbo.CDB_Campaign (idAgeRage, idGender, duration, startDate, endDate, totalCost, description)
	values (@idAgeRange, @idGender, cast( @random_duration as nvarchar(32)) + ' days', @startDate, @endDate, @cost, 'Some description')
	
	-- Obtiene el id de la campaña insertada
	select @idCampaign = max(idCampaign) from dbo.CDB_Campaign 

	-- Seleccionar una red social aleatoria
	select @first = (select top 1 idGeneric from dbo.CDB_Generics where idType = 1)
	select @random = cast (RAND() * (select count(1) from dbo.CDB_Generics where idType = 1) as int)
	select @idSocialNetwork = idGeneric from dbo.CDB_Generics where idGeneric = (@first + @random)

	-- Genera un costo aleatorio
	select @cost = cast (RAND () * 99999 as int)
	select @publicAmount = cast (RAND () * 9999999 as int)

	-- Inserta una red social asociada a la campaña
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

	-- Inserta un utm tag asociado a una campaña
	insert into dbo.CDB_UTMTAGSXCampaign (idUTMTag, idCampaign)
	values (@idUTMTag, @idCampaign)

	-- Obtiene el id de una ciudad aleatoria
	select @idCityxCountry = cast (RAND() * (select count(1) from dbo.CDB_CitiesXCountry) as int) + 1

	-- Inserta una ciudad asociada a una campaña
	insert into dbo.CDB_CitiesXCountryXCampaign (idCityXCountry, idCampaign)
	values (@idCityxCountry, @idCampaign)

	-- Cantidad de tags de una campaña
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
				-- Inserta un tag x campaña
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
GO
/****** Object:  StoredProcedure [dbo].[CDBSP_INSERT_USERSINFO]    Script Date: 10/6/2019 13:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- use Campaign
-- drop procedure CDBSP_INSERT_USERSINFO
CREATE PROCEDURE [dbo].[CDBSP_INSERT_USERSINFO]
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

	
GO
USE [master]
GO
ALTER DATABASE [Campaign] SET  READ_WRITE 
GO
