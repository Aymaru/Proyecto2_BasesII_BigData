USE [Campaign]

CREATE VIEW view_configuration_campaign
AS SELECT campaign.idCampaign, idAgeRage, idGender, duration, startDate, endDate, campaign.totalCost, description, idCitiesXCountryXCampaign, idCityXCountry, idSocialNetworkXCampaign, idSocialNetwork, publicAmount, webURL, idUTMTagXCampaign, idUTMTag, idTagsXCampaign, idTag
FROM
	dbo.CDB_Campaign campaign  inner join
	dbo.CDB_CitiesXCountryXCampaign cxcxc on (campaign.idCampaign = cxcxc.idCampaign) inner join
	dbo.CDB_SocialNetworkXCampaign snxc on (campaign.idCampaign = snxc.idCampaign)  inner join
	dbo.CDB_UTMTagsXCampaign utmxc on (campaign.idCampaign = utmxc.idCampaign) inner join 
	dbo.CDB_TagsXCampaign txc on (campaign.idCampaign = txc.idCampaign)