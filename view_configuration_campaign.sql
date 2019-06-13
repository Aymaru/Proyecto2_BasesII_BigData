CREATE VIEW View_Configuration_Campaign
AS SELECT campaign.idCampaign as 'ID de la campaña', campaign.description as 'Descripción de la Campaña', startDate as 'Fecha Inicio', endDate as 'Fecha Final', duration as 'Duración de la campaña', campaign.totalCost as 'Costo Total', 
 publicAmount as 'Publico', webURL as 'URL de campaña', g1.name as 'Pais de la campaña', g2.name as 'Ciudad de la campaña', g4.name as 'Tag Asociado a la campaña'
FROM
	dbo.CDB_Campaign campaign  inner join 
	dbo.CDB_CitiesXCountryXCampaign cxcxc on (campaign.idCampaign = cxcxc.idCampaign) inner join
	dbo.CDB_CitiesXCountry cxc on (cxc.idCityXCountry = cxcxc.idCityXCountry) inner join
	dbo.CDB_Generics g1 on (g1.idGeneric = cxc.idCountry) inner join
	dbo.CDB_Generics g2 on (g2.idGeneric = cxc.idCity) inner join 
	dbo.CDB_SocialNetworkXCampaign snxc on (campaign.idCampaign = snxc.idCampaign)  inner join
	dbo.CDB_UTMTagsXCampaign utmxc on (campaign.idCampaign = utmxc.idCampaign) inner join 
	dbo.CDB_UTMTags utm on (utmxc.idUTMTag = utm.idUTMTag) inner join 
	dbo.CDB_TagsXCampaign txc on (campaign.idCampaign = txc.idCampaign) inner join 
	dbo.CDB_Generics g4 on (g4.idGeneric = txc.idTag) 