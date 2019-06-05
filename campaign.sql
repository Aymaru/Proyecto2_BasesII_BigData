USE [master]
GO
/****** Object:  Database [Campaign]    Script Date: 5/6/2019 03:42:56 ******/

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
/****** Object:  Table [dbo].[CDB_ActionsInfo]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_Campaign]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_CitiesXCountry]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_CitiesXCountryXCampaign]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_Generics]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_Location]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_LogsInfo]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_Ranges]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_SocialNetworkXCampaign]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_TagsXCampaign]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_TagsXUser]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_TimesInfo]    Script Date: 5/6/2019 03:42:56 ******/
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
/****** Object:  Table [dbo].[CDB_Types]    Script Date: 5/6/2019 03:42:57 ******/
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
/****** Object:  Table [dbo].[CDB_UsersInfo]    Script Date: 5/6/2019 03:42:57 ******/
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
/****** Object:  Table [dbo].[CDB_UTMTags]    Script Date: 5/6/2019 03:42:57 ******/
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
/****** Object:  Table [dbo].[CDB_UTMTagsXCampaign]    Script Date: 5/6/2019 03:42:57 ******/
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
ALTER TABLE [dbo].[CDB_ActionsInfo] ADD  CONSTRAINT [DF_CDB_ActionsInfo_isContent]  DEFAULT ((0)) FOR [isContent]
GO
ALTER TABLE [dbo].[CDB_CitiesXCountry] ADD  CONSTRAINT [DF_CDB_CitiesXCountry_isCountry]  DEFAULT ((0)) FOR [isCountry]
GO
ALTER TABLE [dbo].[CDB_TagsXUser] ADD  CONSTRAINT [DF_CDB_TagsXUser_preference]  DEFAULT ((1)) FOR [preference]
GO
ALTER TABLE [dbo].[CDB_ActionsInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_ActionsInfo_idRange_CDB_Ranges_idRange] FOREIGN KEY([idRange])
REFERENCES [dbo].[CDB_Ranges] ([idRange])
GO
ALTER TABLE [dbo].[CDB_ActionsInfo] CHECK CONSTRAINT [FK_CDB_ActionsInfo_idRange_CDB_Ranges_idRange]
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
/****** Object:  StoredProcedure [dbo].[CDBSP_GENERATE_RANDOM_GENERIC_ID]    Script Date: 5/6/2019 03:42:57 ******/
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
/****** Object:  StoredProcedure [dbo].[CDBSP_INSERT_CAMPAIGN]    Script Date: 5/6/2019 03:42:57 ******/
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
	select @idCampaign = ISNULL(1, (select top 1 idCampaign from dbo.CDB_Campaign order by idCampaign desc) + 1)

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
	values ('?utm_source=' + (select name from dbo.CDB_Generics where idGeneric = @idSocialNetwork),
			'&utm_medium=cpc',
			'&utm_campaign=',-- + cast (NEWID() as nvarchar(32)), 
			'&utm_term=some%20term', 
			'&utm_content=some%20content' )

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
/****** Object:  StoredProcedure [dbo].[CDBSP_INSERT_USERSINFO]    Script Date: 5/6/2019 03:42:57 ******/
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
