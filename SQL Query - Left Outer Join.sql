﻿USE [******]
GO
/****** Object:  StoredProcedure [dbo].[ApRFPSOAReport]    Script Date: 20/09/2023 12:42:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ApRFPSOAReport] 
	-- Add the parameters for the stored procedure here
	@viewer nvarchar(10) null,
	@emplynamed nvarchar(100) null,
	@beforemonth nvarchar(100) null,
	@aftermonth nvarchar(100) null,
	@beforeyear nvarchar(100) null,
	@afteryear nvarchar(100) null,
	@dayselect nvarchar(100) null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@viewer = 'No')
		Begin
			Select 
			RFP.receiveid,
			RFP.registerdate,
			RFP.emplynamed,
			RFP.idref as 'rfpref',
			SOA.idref as 'soaref',
			RFP.receiveddate,
			RFP.brn,
			RFP.itemtype,
			RFP.transactionnum,
			RFP.postingref,
			RFP.descripted,
			RFP.acctnum,
			RFP.invoicedAmt,
			RFP.currency,
			RFP.duedatecw,
			RFP.totaldue,
			RFP.vendorname,
			RFP.paydaycw,
			RFP.paytermscw,
			replace(SOA.amount, ',', '.') as amount,			
			(CAST(replace(RFP.totaldue, ',', '.') as float) - CAST(replace(SOA.amount, ',', '.') as float)) as 'amtdiff',
			SOA.comments,
			replace(RFP.totaldue, ',', '.') as 'amtpd',
			SOA.soareceivedate
			from [SQL_MNLDB].[dbo].[tblAPRFP] as RFP
			Left Outer Join tblAPSOA as SOA
			ON RFP.idref = SOA.idref
			where (MONTH(RFP.registerdate) between @beforemonth and @aftermonth) and
				  (Year(RFP.registerdate)  between @beforeyear and @afteryear) and
				  (Day(RFP.registerdate) = cast(@dayselect as int)) 
			Order by RFP.receiveid ASC
		End
	else 
		Begin
			select 
			RFP.receiveid,
			RFP.registerdate,
			RFP.emplynamed,
			RFP.idref as 'rfpref',
			SOA.idref as 'soaref',
			RFP.receiveddate,
			RFP.brn,
			RFP.itemtype,
			RFP.transactionnum,
			RFP.postingref,
			RFP.descripted,
			RFP.acctnum,
			RFP.invoicedAmt,
			RFP.currency,
			RFP.duedatecw,
			RFP.totaldue,
			RFP.vendorname,
			RFP.paydaycw,
			RFP.paytermscw,
			replace(SOA.amount, ',', '.') as amount,			
			(CAST(replace(RFP.totaldue, ',', '.') as float) - CAST(replace(SOA.amount, ',', '.') as float)) as 'amtdiff',
			SOA.comments,
			replace(RFP.totaldue, ',', '.') as 'amtpd',
			SOA.soareceivedate
			from [SQL_MNLDB].[dbo].[tblAPRFP] as RFP
			Left Outer Join tblAPSOA as SOA
			ON RFP.idref = SOA.idref
			where (MONTH(RFP.registerdate) between cast(@beforemonth as int) and cast(@aftermonth as int)) and
				  (Year(RFP.registerdate)  between cast(@beforeyear as int) and cast(@afteryear as int)) and 
				  (Day(RFP.registerdate) = cast(@dayselect as int)) and 
				  RFP.emplynamed = @emplynamed
			Order by RFP.receiveid ASC	
		End
END
