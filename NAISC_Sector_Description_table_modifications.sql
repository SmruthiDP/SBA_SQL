/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * 
into sba_naics_sector_codes_description
from(
	SELECT
		[NAICS_Industry _Description],
		iif([NAICS_Industry _Description] like '%–%',substring([NAICS_Industry _Description],8,2),'') LookupCodes,
		iif([NAICS_Industry _Description] like '%–%',substring([NAICS_Industry _Description],CHARINDEX('–',[NAICS_Industry _Description])+2,LEN([NAICS_Industry _Description])),'') Sector
	FROM [SBA_Data_Exploration].[dbo].[sba_industry_standards]
	where "NAICS_Codes"=''
	) main
 where LookupCodes!='';


