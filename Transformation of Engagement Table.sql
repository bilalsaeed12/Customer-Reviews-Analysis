SELECT 
    EngagementID,
	ContentID,
	CampaignID,
	ProductID,
	UPPER(REPLACE(ContentType,'SocialMedia', 'Social Media')) As ContentType,  -- First of All SocialMedia will be replaced with the Social Media and then all the Values will be convereted into Upper Case
	LEFT(ViewsClicksCombined, CHARINDEX('-',ViewsClicksCombined) -1) AS Views,
	Right(ViewsClicksCombined, LEN(ViewsClicksCombined)- CHARINDEX('-',ViewsClicksCombined)) AS Clicks,
	Likes,
	FORMAT(CONVERT(DATE,EngagementDate), 'dd.MM.yyyy') AS EngegmentDate
FROM 
    dbo.engagement_data
WHERE
    ContentType != 'Newsletter'

   