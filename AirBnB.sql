-- Checking if there are any dulpicates id
select id, count(*)
from [dbo].[listings$]
group by id 
having count(*)>1

--Table used for visualization
SELECT [id]
      ,[host_id]
      ,[host_name]
      ,[host_location]
	  ,name
	  ,accommodates
      ,[neighbourhood_cleansed] as Neighbourhood
      ,[room_type]
      ,[price]
      ,[availability_30]
      ,[review_scores_rating]
	  ,latitude
	  ,longitude
FROM [PortfolioProject].[dbo].[listings$]


--Finding Average Price in Neighbourhood
SELECT [neighbourhood_cleansed] as Neighbourhood
      ,avg([price]) as Avg_Price
       FROM [PortfolioProject].[dbo].[listings$]
group by [neighbourhood_cleansed]
order by Avg_Price desc


--Joining the 'Listing' table with 'Review' table
--Filtering out the word 'dirty' from customer reviews
SELECT [host_id]
	  ,[host_name]
      ,[neighbourhood_cleansed] as Neighbourhood
	  ,count(*) as DirtyNum
FROM [PortfolioProject].[dbo].[listings$] l
inner join [PortfolioProject].[dbo].[reviews$] r on l.id=r.listing_id
where r.comments like '%dirty%'
group by [host_id],[host_name], [neighbourhood_cleansed]
order by DirtyNum desc


