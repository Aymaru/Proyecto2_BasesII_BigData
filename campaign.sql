USE [master]
GO
/****** Object:  Database [Campaign]    Script Date: 4/6/2019 19:59:10 ******/

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
/****** Object:  Table [dbo].[CDB_ActionsInfo]    Script Date: 4/6/2019 19:59:10 ******/
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
/****** Object:  Table [dbo].[CDB_Campaign]    Script Date: 4/6/2019 19:59:10 ******/
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
/****** Object:  Table [dbo].[CDB_CitiesXCountry]    Script Date: 4/6/2019 19:59:10 ******/
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
/****** Object:  Table [dbo].[CDB_CitiesXCountryXCampaign]    Script Date: 4/6/2019 19:59:10 ******/
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
/****** Object:  Table [dbo].[CDB_Generics]    Script Date: 4/6/2019 19:59:10 ******/
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
/****** Object:  Table [dbo].[CDB_Location]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_LogsInfo]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_Ranges]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_SocialNetworkXCampaign]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_TagsXUser]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_TimesInfo]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_Types]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_UsersInfo]    Script Date: 4/6/2019 19:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDB_UsersInfo](
	[idUser] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](32) NULL,
	[idCityXCountry] [int] NOT NULL,
	[location1] [int] NULL,
	[location2] [int] NULL,
	[location3] [int] NULL,
	[location4] [int] NULL,
	[idRangeLocation] [int] NOT NULL,
	[idRangeTag] [int] NULL,
	[idRangeCampaign] [int] NULL,
 CONSTRAINT [PK_CDB_UsersInfo_1] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CDB_UTMTags]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[CDB_UTMTagsXCampaign]    Script Date: 4/6/2019 19:59:11 ******/
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
/****** Object:  Table [dbo].[TagsXCampaign]    Script Date: 4/6/2019 19:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsXCampaign](
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
ALTER TABLE [dbo].[CDB_TagsXUser]  WITH CHECK ADD  CONSTRAINT [FK_CDB_TagsXUser_idTag_CDB_Generics_idGeneric] FOREIGN KEY([idTag])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[CDB_TagsXUser] CHECK CONSTRAINT [FK_CDB_TagsXUser_idTag_CDB_Generics_idGeneric]
GO
ALTER TABLE [dbo].[CDB_TagsXUser]  WITH CHECK ADD  CONSTRAINT [FK_CDB_TagsXUser_idUser_CDB_UsersInfo_idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[CDB_UsersInfo] ([idUser])
GO
ALTER TABLE [dbo].[CDB_TagsXUser] CHECK CONSTRAINT [FK_CDB_TagsXUser_idUser_CDB_UsersInfo_idUser]
GO
ALTER TABLE [dbo].[CDB_UsersInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UsersInfo_idCityXCountry_CDB_CitiesXCountry_idCityXCountry] FOREIGN KEY([idCityXCountry])
REFERENCES [dbo].[CDB_CitiesXCountry] ([idCityXCountry])
GO
ALTER TABLE [dbo].[CDB_UsersInfo] CHECK CONSTRAINT [FK_CDB_UsersInfo_idCityXCountry_CDB_CitiesXCountry_idCityXCountry]
GO
ALTER TABLE [dbo].[CDB_UsersInfo]  WITH CHECK ADD  CONSTRAINT [FK_CDB_UsersInfo_idRangeCampaign_CDB_Ranges_idRange] FOREIGN KEY([idRangeCampaign])
REFERENCES [dbo].[CDB_Ranges] ([idRange])
GO
ALTER TABLE [dbo].[CDB_UsersInfo] CHECK CONSTRAINT [FK_CDB_UsersInfo_idRangeCampaign_CDB_Ranges_idRange]
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
ALTER TABLE [dbo].[TagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_TagsXCampaign_idCampaign_CDB_Campaign_idCampaign] FOREIGN KEY([idCampaign])
REFERENCES [dbo].[CDB_Campaign] ([idCampaign])
GO
ALTER TABLE [dbo].[TagsXCampaign] CHECK CONSTRAINT [FK_TagsXCampaign_idCampaign_CDB_Campaign_idCampaign]
GO
ALTER TABLE [dbo].[TagsXCampaign]  WITH CHECK ADD  CONSTRAINT [FK_TagsXCampaign_idTag_CDB_Generics_idGeneric] FOREIGN KEY([idTag])
REFERENCES [dbo].[CDB_Generics] ([idGeneric])
GO
ALTER TABLE [dbo].[TagsXCampaign] CHECK CONSTRAINT [FK_TagsXCampaign_idTag_CDB_Generics_idGeneric]
GO
USE [master]
GO
ALTER DATABASE [Campaign] SET  READ_WRITE 
GO
