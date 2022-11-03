/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data]

  ---Approved  Loans Summary
  select 
	year(DateApproved) year_Approved,
	count(LoanNumber) Number_of_Loans,
	sum(InitialApprovalAmount) sum_of_amount_approved,
	avg(InitialApprovalAmount) avg_of_amount_approved
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data]
  where 
	year(DateApproved)=2020
group by year(DateApproved)

union

select 
	year(DateApproved) year_Approved,
	count(LoanNumber) Number_of_Loans,
	sum(InitialApprovalAmount) sum_of_amount_approved,
	avg(InitialApprovalAmount) avg_of_amount_approved
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data]
  where 
	year(DateApproved)=2021
group by year(DateApproved)


---top 15 originating lenders

select top 15 
	OriginatingLender,
	count(LoanNumber) Number_of_Loans,
	sum(InitialApprovalAmount) sum_of_amount_approved,
	avg(InitialApprovalAmount) avg_of_amount_approved
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data]
group by 
	OriginatingLender
order by 3 desc;


---Top 15 industries that received the loan

select top 15 
	n.Sector,
	count(p.LoanNumber) Number_of_Loans,
	sum(p.InitialApprovalAmount) sum_of_amount_approved
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data] p
  inner join sba_naics_sector_codes_description n on
  left(p.NAICSCode,2)=n.LookupCodes
  group by 
  n.Sector
order by 3 desc;

--Approved Amount in percentage

;with cte as 
(select top 15 
	n.Sector,
	count(p.LoanNumber) Number_of_Loans,
	sum(p.InitialApprovalAmount) sum_of_amount_approved
  FROM [SBA_Data_Exploration].[dbo].[sba_public_data] p
  inner join sba_naics_sector_codes_description n on
  left(p.NAICSCode,2)=n.LookupCodes
  group by 
  n.Sector
order by 3 desc
)
select Sector,Number_of_Loans,sum_of_amount_approved,sum_of_amount_approved/sum(sum_of_amount_approved) over() *100
from cte
order by sum_of_amount_approved desc

