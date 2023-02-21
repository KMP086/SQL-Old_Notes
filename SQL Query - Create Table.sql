Create table SQL_MNLDB.dbo.tblAP_Ageing_Report(
ID int Not Null IDENTITY Primary key,
DB_Date varchar(50) Not Null,
F_Name varchar(300) Not Null,
Entity varchar(10),
Co_Code varchar(10),
Ext_Date varchar(50),
Brn varchar(10),
Trn_Type varchar(10),
Trn_Number varchar(100),
Posting_Ref varchar(100),
Descrip varchar(300),
Acct varchar(100),
Currency float(3),
Cur float(3),
Due_Date varchar(50),
Local_Cur varchar(50),
Reg_Name varchar(300),
Live_Date varchar(50),
Region varchar(10),
Country varchar(300),
Ageing Int,
Ageing_Bucket varchar(100),
Eqv_Days varchar(100),
Team varchar(50),
Exchange_Rate float(12),
EUR_Amt float(3),
db_cr varchar(50),
Vendor_Name varchar(100),
Custom_NonCustom varchar(100));


Create table SQL_MNLDB.dbo.tblAP_FOREX();


Create table SQL_MNLDB.dbo.tblAPHeaderRef(
ID int Not Null Primary key,
DB_Date varchar(50) Not Null,
EditorName varchar(300) Not Null,
ReportName varchar(100),
HeaderName varchar(200));

insert into SQL_MNLDB.dbo.tblAPHeaderRef(
DB_Date,EditorName,ReportName, HeaderName)
values(GETDATE(),'Kim.Pambid','AP Profile','Quality Assured');
Select * from SQL_MNLDB.dbo.tblAPHeaderRef

select @@SERVERNAME




