USE [OSS_************]
GO

/****** Object:  View [usr].[vGridFI]    Script Date: 13/07/2022 6:01:43 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--drop view [usr].[vGridFI]

CREATE view [usr].[vGridFI]
as
with rawGrid 
as
(select
	   fi.[consignment]
      ,fi.[client]
      ,fi.[delv_country]
      ,fi.[order_date]
      ,fi.[time]
      ,fi.[priority]
      ,fi.[deadline]
      ,fi.[border]
      ,fi.[notes]
      ,fi.[csu_op]
      ,fi.[csu_mail]
      ,fi.[query]
      ,fi.[responsible]
      ,fi.[id]
      ,fi.[add_date]
from [usr].[temp_grid_fi] fi
--order by id asc
)

select
	  [query]
      ,[responsible]
	  ,[consignment]
      ,[client]
      ,[delv_country]
      ,convert(nvarchar,[order_date],120) as 'order_date'
      ,convert(varchar(8),[time],108) as 'time'
	  ,dateadd(hour,-1,convert(nvarchar,[order_date],120) + ' ' + convert(varchar(8),[time],108)) as 'order_datetime' 
      ,[priority]
      ,dateadd(hour, -1,convert(nvarchar,[deadline],120)) as 'deadline'
      ,[border]
      ,[notes]
      ,[csu_op]
      ,[csu_mail]
      ,convert(nvarchar,[add_date]) as 'add_date'
	  ,[id]
	from rawGrid 
	where len([responsible]) < 1 and  len([query]) < 1
	--[responsible] is null 
	--and [query] is null

GO


