/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [NAICS_Industry _Description]
      ,[LookupCodes]
      ,[Sector]
  FROM [SBA_Data_Exploration].[dbo].[sba_naics_sector_codes_description]
  ORDER BY LookupCodes;


 
 INSERT INTO [SBA_Data_Exploration].[dbo].[sba_naics_sector_codes_description] VALUES
 ('Sector 31 – 33 – Manufacturing',32,'Manufacturing'),
 ('Sector 31 – 33 – Manufacturing',32,'Manufacturing'),
 ('Sector 44 - 45 – Retail Trade',45,'Retail Trade'),
 ('Sector 48 - 49 – Transportation and Warehousing',49,'Transportation and Warehousing')

 UPDATE [SBA_Data_Exploration].[dbo].[sba_naics_sector_codes_description]
 SET Sector='Manufacturing'
 WHERE LookupCodes=31; 