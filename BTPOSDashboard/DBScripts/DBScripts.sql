USE [POSDashboard]
GO
/****** Object:  Table [dbo].[FleetOwner]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleetOwner](
	[Id] [int] NULL,
	[UserId] [varchar](50) NULL,
	[BTPOSgroupid] [varchar](50) NULL,
	[Active] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fares]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fares](
	[Id] [int] NULL,
	[FromStop] [varchar](50) NULL,
	[ToStop] [varchar](50) NULL,
	[Fare] [varchar](50) NULL,
	[Active] [varchar](50) NULL,
	[RouteId] [varchar](50) NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expenses](
	[amount] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[Id] [varchar](50) NOT NULL,
	[MasterId] [int] NOT NULL,
	[paidBy] [varchar](50) NOT NULL,
	[paidFor] [varchar](50) NOT NULL,
	[transactionId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EditHistoryDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EditHistoryDetails](
	[EditHistoryId] [int] NULL,
	[FromValue] [varchar](50) NULL,
	[ToValue] [varchar](50) NULL,
	[ChangeType] [varchar](50) NULL,
	[Field1] [varchar](50) NULL,
	[Field2] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EditHistory]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EditHistory](
	[Field] [varchar](50) NOT NULL,
	[SubItem] [varchar](50) NOT NULL,
	[Comment] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ChangedBy] [varchar](50) NOT NULL,
	[ChangedType] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[ID] [numeric](18, 0) NULL,
	[Name] [nchar](10) NULL,
	[Code] [nchar](10) NULL,
	[Active] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyGroups]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyGroups](
	[active] [int] NOT NULL,
	[admin] [varchar](50) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[descr] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusDetails](
	[busId] [int] NOT NULL,
	[busTypeId] [int] NOT NULL,
	[conductorId] [int] NOT NULL,
	[conductorName] [varchar](50) NOT NULL,
	[driverId] [int] NOT NULL,
	[driverName] [varchar](50) NOT NULL,
	[fleetOwnerId] [int] NOT NULL,
	[groupname] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[POSID] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[route] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[statusid] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BTPOSSheduleUploads]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSSheduleUploads](
	[Id] [numeric](18, 0) NULL,
	[POSID] [numeric](18, 0) NULL,
	[UploadOn] [nchar](10) NULL,
	[UploadedOn] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[UploadData] [nchar](10) NULL,
	[Ipconfig] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSSecheduledUpdates]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSSecheduledUpdates](
	[Id] [numeric](18, 0) NULL,
	[POSID] [numeric](18, 0) NULL,
	[UploadOn] [nchar](10) NULL,
	[UploadedOn] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[UploadData] [nchar](10) NULL,
	[IpConfig] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSRegistration]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSRegistration](
	[Id] [numeric](18, 0) NULL,
	[POSID] [numeric](18, 0) NULL,
	[Status] [nchar](10) NULL,
	[FleetOwenerId] [numeric](18, 0) NULL,
	[RegisteredOn] [nchar](10) NULL,
	[IpConfig] [nchar](10) NULL,
	[RegStatus] [nchar](10) NULL,
	[LincenseNo] [nchar](10) NULL,
	[ActivatedOn] [nchar](10) NULL,
	[ExpiryDate] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSRecords]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSRecords](
	[Id] [numeric](18, 0) NULL,
	[BTPOSId] [numeric](18, 0) NULL,
	[IpConfig] [nchar](10) NULL,
	[RecordData] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSPortSettings]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSPortSettings](
	[Id] [numeric](18, 0) NULL,
	[BTPOSID] [numeric](18, 0) NULL,
	[Ipconfig] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSInventorySales]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BTPOSInventorySales](
	[amount] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[inventoryId] [int] NOT NULL,
	[perunit] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[soldon] [varchar](50) NOT NULL,
	[transactionId] [int] NOT NULL,
	[transactiontype] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BTPOSFaultsCatageries]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSFaultsCatageries](
	[Active] [numeric](18, 0) NULL,
	[BTPOSFaultCategory] [nchar](10) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[TypeGrpid] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTPOSDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BTPOSDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[POSID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BTPOSAuditDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSAuditDetails](
	[BTPOSID] [numeric](18, 0) NULL,
	[EditHistoryId] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocklist]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocklist](
	[Id] [numeric](18, 0) NULL,
	[ItemId] [numeric](18, 0) NULL,
	[ItemTypeId] [numeric](18, 0) NULL,
	[Formdate] [nchar](10) NULL,
	[Todate] [nchar](10) NULL,
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Reason] [nchar](10) NULL,
	[Blockedby] [nchar](10) NULL,
	[UnBlockedby] [nchar](10) NULL,
	[Blockedon] [nchar](10) NULL,
	[UnBlockedon] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetMessages]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMessages]
(@MessageType int)
  
AS
BEGIN

SELECT [Id]
      ,[Date]
      ,[Message]
      ,[MessageType]
  FROM [POSDashboard].[dbo].[AlertsNotifications]
  WHERE MessageType =@MessageType
 RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuditDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAuditDetails]
AS
BEGIN
	
select * from AuditDetails
end
GO
/****** Object:  Table [dbo].[SMSProviderConfig]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSProviderConfig](
	[Id] [numeric](18, 0) NULL,
	[ProviderName] [nchar](10) NULL,
	[BTPOSGRPID] [nchar](10) NULL,
	[Active] [nchar](10) NULL,
	[UserId] [numeric](18, 0) NULL,
	[Passkey] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMSEmailSubscribers]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSEmailSubscribers](
	[AlertId] [int] NOT NULL,
	[emailid] [varchar](50) NOT NULL,
	[enddate] [datetime] NOT NULL,
	[frequency] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[phNo] [varchar](50) NOT NULL,
	[startdate] [datetime] NOT NULL,
	[userid] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMSEmailConfiguration]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSEmailConfiguration](
	[AlertTypeId] [int] NOT NULL,
	[enddate] [datetime] NOT NULL,
	[hashkey] [datetime] NOT NULL,
	[Id] [int] NOT NULL,
	[providername] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[saltkey] [datetime] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[getRoutesFares]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutesFares]
as
begin
select * from RoutesFares
end
GO
/****** Object:  Table [dbo].[RoutesConfiguration]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoutesConfiguration](
	[distanceFromDest] [int] NOT NULL,
	[distanceFromLastStop] [int] NOT NULL,
	[distanceFromPrevStop] [int] NOT NULL,
	[distanceFromSource] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[routeId] [int] NOT NULL,
	[stops] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Route] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [varchar](50) NOT NULL,
	[BTPOSGroupId] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RouteFares]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteFares](
	[active] [int] NOT NULL,
	[fareCodeId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[routeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RouteDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [varchar](50) NOT NULL,
	[Stopname] [varchar](50) NOT NULL,
	[Descr] [varchar](50) NOT NULL,
	[StopCode] [varchar](50) NOT NULL,
	[DistFromSource] [int] NOT NULL,
	[DistFromDestination] [int] NOT NULL,
	[DistFromPrevStop] [int] NOT NULL,
	[DistFromNextStop] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[Active] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportsFields]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportsFields](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ReportType] [varchar](50) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[active] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistrationBTPOS]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistrationBTPOS](
	[code] [varchar](50) NOT NULL,
	[uniqueId] [varchar](50) NOT NULL,
	[ipconfig] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[register]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ConfirmPassword] [nvarchar](50) NULL,
	[Emailaddress] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceivingsMaster]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivingsMaster](
	[Id] [numeric](18, 0) NULL,
	[Date] [smalldatetime] NULL,
	[ReceivedFor] [nchar](10) NULL,
	[Desc] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receivings]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receivings](
	[Id] [numeric](18, 0) NULL,
	[Amount] [nchar](10) NULL,
	[MasterId] [numeric](18, 0) NULL,
	[ReceivedBy] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POSTerminal]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSTerminal](
	[Id] [int] NULL,
	[POSId] [varchar](10) NULL,
	[Status] [int] NULL,
	[GroupId] [int] NULL,
	[Location] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentReceivings]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentReceivings](
	[amount] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[date] [varchar](50) NOT NULL,
	[desc] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[inventoryId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[receivedOn] [varchar](50) NOT NULL,
	[transactionId] [int] NOT NULL,
	[transactiontype] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentGatewayType]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGatewayType](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[PaymentGatewayType] [nchar](10) NULL,
	[TypeGripId] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentGatewaySettings]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentGatewaySettings](
	[enddate] [datetime] NOT NULL,
	[hashkey] [datetime] NOT NULL,
	[Id] [int] NOT NULL,
	[PaymentGatewayTypeId] [int] NOT NULL,
	[providername] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[saltkey] [datetime] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentgateway]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentgateway]
AS
BEGIN
	
select * from Paymentgateway
end
GO
/****** Object:  Table [dbo].[PaymentCatergory]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentCatergory](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[PaymentCatergory] [nchar](10) NULL,
	[TypegripId] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[Card] [varchar](50) NOT NULL,
	[MobilePayment] [varchar](50) NOT NULL,
	[Cash] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayablesMaster]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayablesMaster](
	[Id] [numeric](18, 0) NULL,
	[Date] [smalldatetime] NULL,
	[PaidFor] [nchar](10) NULL,
	[Desc] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetPayables]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayables]
AS
BEGIN
	
select * from Payables
end
GO
/****** Object:  StoredProcedure [dbo].[GetNOCBTPOSTracking]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetNOCBTPOSTracking]
AS
BEGIN
	
select * from NOCBTPOSTracking
end
GO
/****** Object:  Table [dbo].[menu]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[Ticketgeneration] [varchar](50) NOT NULL,
	[Settings] [varchar](50) NOT NULL,
	[Reports] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[LicensePayments](
	[expiryOn] [datetime] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[licenseFor] [varchar](50) NOT NULL,
	[licenseId] [int] NOT NULL,
	[licenseType] [varchar](50) NOT NULL,
	[paidon] [datetime] NOT NULL,
	[renewedon] [datetime] NOT NULL,
	[transId] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenseKeyFile]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LicenseKeyFile](
	[Id] [int] NOT NULL,
	[LicenseType] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[active] [int] NOT NULL,
	[key] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LicenceStatus]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenceStatus](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[LicenseStatusType] [nchar](10) NULL,
	[TypeGripidId] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenceCatergories]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenceCatergories](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[LicenseCategory] [nchar](10) NULL,
	[TypegripId] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryReceivings]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryReceivings](
	[amount] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[date] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[inventoryId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[reason] [varchar](50) NOT NULL,
	[refundamt] [int] NOT NULL,
	[returnedOn] [varchar](50) NOT NULL,
	[transactionId] [int] NOT NULL,
	[transactiontype] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[Active] [int] NOT NULL,
	[availableQty] [int] NOT NULL,
	[category] [varchar](50) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[InventoryId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[PerUnitPrice] [int] NOT NULL,
	[recorderpoint] [int] NOT NULL,
	[subcat] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserLogins](
	[LoginInfo] [nvarchar](50) NOT NULL,
	[PassKey] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[salt] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[UserLogins] ADD  CONSTRAINT [DF_UserLogins_Active]  DEFAULT ((1)) FOR [Active]
GO


/****** Object:  StoredProcedure [dbo].[InsUpdDelELPayables]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELPayables](@Id numeric(30),
           @Amount VARCHAR(50),
           @MasterId numeric(30),
           @Paidby varchar(50))
AS
BEGIN
	

INSERT INTO 
[Payables] VALUES
           (@Id, 
          @Amount,
           @MasterId,
           @Paidby)
          
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELNOCBTPOSTracking]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELNOCBTPOSTracking](@Id numeric(10),
              
           @BTPOSId numeric(10),
           @Xcord varchar(50),
           @Ycord Varchar(50),
           @Time varchar(20),
           @Date date)
AS
BEGIN
	

INSERT INTO 
[NOCBTPOSTracking] VALUES
           (@Id,
              
           @BTPOSId,
           @Xcord,
           @Ycord,
           @Time,
           @Date)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELAlertsNotifications]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELAlertsNotifications]
@Id int

           
AS
BEGIN
	

Delete from AlertsNotifications where Id=@Id
   
	END
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCode](
	[Id] [numeric](18, 0) NULL,
	[Code] [nchar](10) NULL,
	[Active] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[UserType] [varchar](50) NULL,
	[EmpNo] [int] NULL,
	[Email] [varchar](40) NULL,
	[AdressId] [int] NULL,
	[MobileNo] [varchar](50) NULL,
	[Role] [varchar](40) NULL,
	[Active] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] NULL,
	[UserId] [int] NULL,
	[Role] [int] NULL,
	[GroupId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Desc] [varchar](50) NULL,
	[TypeGroup] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeGroups]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Desc] [varchar](50) NOT NULL,
	[Active] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TroubleTicketingStatus]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroubleTicketingStatus](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[TtStatusTpe] [nchar](10) NULL,
	[TypeGripId] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TroubleTicketingSlaType]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroubleTicketingSlaType](
	[Active] [numeric](18, 0) NULL,
	[Desc] [nchar](10) NULL,
	[Id] [numeric](18, 0) NULL,
	[TTSLAType] [nchar](10) NULL,
	[TypeGripId] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TroubleTicketingHandlers]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroubleTicketingHandlers](
	[handledOn] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[TTId] [int] NOT NULL,
	[userid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TroubleTicketingDevice]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroubleTicketingDevice](
	[deviceid] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[ticketTypeId] [int] NOT NULL,
	[TTId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TroubleTicketingDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TroubleTicketingDetails](
	[addInfo] [varchar](50) NOT NULL,
	[createdBy] [varchar](50) NOT NULL,
	[createdOn] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[raisedBy] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[ticketinfo] [varchar](50) NOT NULL,
	[ticketTypeId] [int] NOT NULL,
	[TTId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TroubleTicketingCategories]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TroubleTicketingCategories](
	[active] [int] NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[TTCategory] [varchar](50) NOT NULL,
	[typegrpid] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[active] [int] NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[TransactionTypes] [varchar](50) NOT NULL,
	[typegrpid] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[barcode] [varchar](50) NOT NULL,
	[BTPOSid] [varchar](50) NOT NULL,
	[busNumber] [varchar](50) NOT NULL,
	[busId] [int] NOT NULL,
	[change] [varchar](50) NOT NULL,
	[company] [varchar](50) NOT NULL,
	[companyId] [varchar](50) NOT NULL,
	[ConductorId] [varchar](50) NOT NULL,
	[ConductorName] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[destination] [varchar](50) NOT NULL,
	[fare] [varchar](50) NOT NULL,
	[greetingMssg] [varchar](50) NOT NULL,
	[luggageType] [varchar](50) NOT NULL,
	[passengerType] [varchar](50) NOT NULL,
	[passengerId] [varchar](50) NOT NULL,
	[paymentId] [varchar](50) NOT NULL,
	[printdataId] [varchar](50) NOT NULL,
	[route] [varchar](50) NOT NULL,
	[routecode] [varchar](50) NOT NULL,
	[routeId] [varchar](50) NOT NULL,
	[source] [varchar](50) NOT NULL,
	[time] [datetime] NOT NULL,
	[ticketHolderId] [varchar](50) NOT NULL,
	[ticketHolderName] [varchar](50) NOT NULL,
	[TicketNumber] [varchar](50) NOT NULL,
	[ticketValidityPeriod] [varchar](50) NOT NULL,
	[totalamt] [int] NOT NULL,
	[amtpaid] [int] NOT NULL,
	[TransactionCode] [varchar](50) NOT NULL,
	[TransId] [varchar](50) NOT NULL,
	[transType] [varchar](50) NOT NULL,
	[userid] [int] NOT NULL,
	[ChangeRendered] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionMaster]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionMaster](
	[Id] [int] NOT NULL,
	[TransCode] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[Id] [int] NULL,
	[TransId] [varchar](50) NULL,
	[TotalAmt] [int] NULL,
	[PaymentId] [varchar](50) NULL,
	[BTPOSid] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketGeneration]    Script Date: 03/19/2016 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketGeneration](
	[Source] [varchar](50) NOT NULL,
	[Target] [varchar](50) NOT NULL,
	[NoOfTickets] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELSTATE]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELSTATE](@Id NUMERIC(10),
           @Name VARCHAR(20),
           @Count VARCHAR(20),
           @Code VARCHAR(20),
           @Active varchar(20))
AS
BEGIN
	

INSERT INTO 
[STATE] VALUES
           (@ID,
           @Name,
           @Count,
           @Code,
           @Active)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetSTATE]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSTATE]
AS
BEGIN
	
select * from STATE
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELPaymentgateway]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELPaymentgateway](@Id numeric(20),
           @ProviderName varchar(20),
           @BTPOSGRPID VARCHAR(20),
           @Active numeric(20),
           @userId numeric(20),
           @Passkey varchar(20),
           @Url varchar(20),
           @Testurl varchar(20),
           @Salt varchar(20),
           @Hash varchar(20),
           @PaymentGatwayTypeId varchar(20))
AS
BEGIN
	

INSERT INTO 
[Paymentgateway] VALUES
           (@Id,
           @ProviderName,
           @BTPOSGRPID,
           @Active,
           @UserId,
           @Passkey,
           @Url,
           @Testurl,
           @Salt,
           @Hash,
           @PaymentGatwayTypeId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELPaymentCatergory]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELPaymentCatergory](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @PaymentCatergory varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[PaymentGatewayType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @PaymentCatergory,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELPayablesMaster]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELPayablesMaster](@Id numeric,
           @Date smalldatetime,
           @PaidFor VARCHAR,
           @Desc VARCHAR)
AS
BEGIN
	

INSERT INTO 
[PayablesMaster] VALUES
           (@Id
           ,@Date
           ,@PaidFor
           ,@Desc)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_login](@UserName varchar(max),
@Password varchar(max),

@result int OUTPUT)
as
begin

select @result = count(*)  from login where UserName=@UserName and [Password]=@Password

end

--select count(*)  from login where UserName='pavani' and Password='pavani'
--[sp_login] 'a', 'b',1
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_InsTypeGroups](@Id int,@Name varchar(50),@Desc varchar(50),@Active int)
as
begin
insert into TypeGroups (Name,[Desc],Active) values(@Name,@Desc,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELSMSProviderConfig]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELSMSProviderConfig](@Id numeric(20),
           @ProviderName varchar(20),
           @BTPOSGRPID varchar(20),
           @Active varchar(20),
           @UserId numeric(20),
           @Passkey varchar(20))
AS
BEGIN
	

INSERT INTO 
[SMSProviderConfig] VALUES
           (@Id,
           @ProviderName,
           @BTPOSGRPID,
           @Active,
           @UserId,
           @Passkey)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELregisterform]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelELregisterform](@UserName varchar(max),
@Password varchar(max),@ConfirmPassword varchar(max),@Emailaddress varchar(max),
@FirstName varchar(max),@LastName varchar(max))
as
begin

INSERT INTO 
[register] VALUES
           (@UserName,
              
          
           @Password,
		     @ConfirmPassword,
			    @Emailaddress,
           @FirstName,
           @LastName
         
         )
   

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELReceivingsMaster]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELReceivingsMaster](@Id Numeric(20),
           @Date smalldatetime,
           @ReceivedFor varchar(20),
           @Desc varchar(20))
AS
BEGIN
	

INSERT INTO 
[ReceivingsMaster] VALUES
           (@Id, 
           @Date, 
           @ReceivedFor,
           @Desc)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELReceivings]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELReceivings](@Id Numeric(10),
           @Amount VARCHAR(20),
           @MasterId numeric(10),
           @ReceivedBy Varchar(20))
AS
BEGIN
	

INSERT INTO 
[Receivings] VALUES

       (@Id,
       @Amount,
         @MasterId,
           @ReceivedBy)  
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELPaymentGatewayType]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELPaymentGatewayType](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @PaymentGatewayType varchar(30),
           @TypeGripId numeric(20))
AS
BEGIN
	

INSERT INTO 
[PaymentGatewayType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @PaymentGatewayType,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelEditHistoryDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelEditHistoryDetails](@EditHistoryId int,@FromValue varchar(50),@ToValue varchar(50),@ChangeType varchar(50),@Field1 varchar(50),@Field2 varchar(50))
as
begin
insert into EditHistoryDetails values(@EditHistoryId,@FromValue,@ToValue,@ChangeType,@Field1,@Field2)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelEditHistory]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelEditHistory](@Field varchar(50),@SubItem varchar(50),@Comment varchar(50),@Date datetime,@ChangedBy varchar(50),@ChangedType varchar(50))
as
begin
insert into EditHistory values(@Field,@SubItem,@Comment,@Date,@ChangedBy,@ChangedType)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyGroups]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelCompanyGroups](@active int,@admin varchar(50),@code varchar(50),@descr varchar(50),@Id int,@Name varchar(50))
as
begin
insert into CompanyGroups (active,admin,code,descr,Name) values(@active,@admin,@code,@descr,@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBusDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelBusDetails](@busId int,@busTypeId int,@conductorId int,@conductorName varchar(50),@driverId int,@driverName varchar(50),@fleetOwnerId int,@groupname varchar(50),@Id int,@POSID int,@RegNo varchar(50),@route varchar(50),@Status varchar(50),@statusid int)
as
begin
insert into BusDetails values(@busId,@busTypeId,@conductorId,@conductorName,@driverId,@driverName,@fleetOwnerId,@groupname,@Id,@POSID,@RegNo,@route,@Status,@statusid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSInventorySales]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelBTPOSInventorySales](@amount int,@code varchar (50),@Id int,@inventoryId int,@perunit int,@quantity int,@soldon varchar (50),@transactionId int,@transactiontype varchar (50))
as
begin
insert into BTPOSInventorySales values(@amount,@code,@Id,@inventoryId,@perunit,@quantity,@soldon,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELLicenceStatus]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELLicenceStatus](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @LicenseStatusType varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[LicenceStatus] VALUES
           (@Active,
           @Desc,
           @Id,
           @LicenseStatusType,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELLicenceCatergories]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELLicenceCatergories](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @LicenseCategory varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[LicenceCatergories] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @LicenseCategory,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELCOUNTRY]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELCOUNTRY](@Id NUMERIC(10),
           @Name VARCHAR(50),   
           @Code VARCHAR(50),
           @Active VARCHAR(50))
AS
BEGIN
	

INSERT INTO 
[COUNTRY] VALUES
           (@Id,
           @Name,
           @Code
           ,@Active)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSSheduleUploads]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELBTPOSSheduleUploads](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @UploadOn varchar(50),
           @UploadedOn varchar(50),
           @Status varchar(50),
           @UploadData varchar(50),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSSheduleUploads] VALUES
           (@Id,
              
           @POSID,
           @UploadOn,
           @UploadedOn,
           @Status,
           @UploadData,
           @Ipconfig )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSSecheduledUpdates]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELBTPOSSecheduledUpdates](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @UploadOn varchar(50),
           @UploadedOn varchar(50),
           @Status varchar(50),
           @UploadData varchar(50),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSSecheduledUpdates] VALUES
           (@Id,
              
           @POSID,
           @UploadOn,
           @UploadedOn,
           @Status,
           @UploadData,
           @Ipconfig )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSRegistration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELBTPOSRegistration](@Id NUMERIC(10),
              
           @POSID numeric(10),
           @Status VARCHAR(50),
           @FleetOwenerId numeric(10),
           @RegisteredOn Varchar(50),
           @IpConfig varchar(50),
           @RegStatus varchar(50),
           @LincenseNo varchar(50),
           @ActivedOn varchar(50),
           @ExpiryDate varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSRegistration] VALUES
           (@Id,
              
           @POSID,
           @Status,
           @FleetOwenerId,
           @RegisteredOn,
           @IpConfig,
           @RegStatus,
           @LincenseNo,
           @ActivedOn,
           @ExpiryDate )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSRecords]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELBTPOSRecords](@Id NUMERIC(10),
              
           @BTPOSID numeric(10),
           @IpConfig varchar(50),
           @RecordData varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSRecords] VALUES
           (@Id,
              
           @BTPOSID,
           @Ipconfig,
           @RecordData)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSPortSettings]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELBTPOSPortSettings](@Id NUMERIC(10),
              
           @BTPOSId numeric(10),
           @Ipconfig varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSPortSettings] VALUES
           (@Id,
              
           @BTPOSId,
           @Ipconfig)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSFaultsCatageries]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELBTPOSFaultsCatageries](@Active NUMERIC(10),
              
           @BTPOSFaultCategory Varchar(30),
           @Desc varchar(50),
           @Id numeric(10),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[BTPOSFaultsCatageries] VALUES
           (@Active,
              
          @BTPOSFaultCategory,
           @Desc,
           @Id,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELBTPOSDetails](@Id NUMERIC(10),
           @GroupId numeric(10),   
           @POSID numeric(10),
           @Status VARCHAR(50),
           @IMEI varchar(50),
           @Location Varchar(50),
           @GroupName varchar(50))
 
AS
BEGIN
	

INSERT INTO 
[BTPOSDetails]  (
           GroupId,   
           POSID,
           Status,
           IMEI,
           Location,
          GroupName)
            VALUES
           (
           @GroupId,   
           @POSID,
           @Status,
           @IMEI,
           @Location,
           @GroupName)
           
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBTPOSAuditDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELBTPOSAuditDetails](@BTPOSId NUMERIC(10),
              
           @EditHistoryId numeric(10))
AS
BEGIN
	

INSERT INTO 
[BTPOSAuditDetails] VALUES
           (@BTPOSId,
              
           @EditHistoryId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELBlocklist]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELBlocklist](@Id numeric(20)
,
           @ItemId NUMERIC(20),
           @ItemTypeId numeric(30),
           @Formdate varchar(50),
           @Todate varchar(50),
           @Active numeric(30),
           @Desc varchar(50),
           @Reason varchar(50),
           @Blockedby varchar(50),
           @UnBlockedby varchar(50),
           @Blockedon varchar(50),
           @UnBlockedon varchar(50))
AS
BEGIN
	

INSERT INTO 
[Blocklist] VALUES
           (@Id, 
          @ItemId,
           @ItemTypeId,
           @Formdate,
           @Todate,
           @Active,
           @Desc,
           @Reason,
           @Blockedby,
           @UnBlockedby,
           @Blockedon ,
           @UnBlockedon )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[GetZipCode]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetZipCode]
AS
BEGIN
	
select * from ZipCode
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers]
AS
BEGIN

SELECT * from Users 
end
GO
/****** Object:  StoredProcedure [dbo].[GetTypesByGroupId]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTypesByGroupId]
@typegrpid int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, [desc],Active,IsVisible, TypeGrpId, [Key], Value
	 from [Types] where (TypeGrpId = @typegrpid or @typegrpid = -1)
END
GO
/****** Object:  StoredProcedure [dbo].[getTypes]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTypes]
as
begin
select * from Types
end
GO
/****** Object:  StoredProcedure [dbo].[getTypeGroups]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTypeGroups]
as
begin
select * from TypeGroups
end
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingStatus]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTroubleTicketingStatus]
AS
BEGIN
	
select * from TroubleTicketingStatus
end
GO
/****** Object:  StoredProcedure [dbo].[GetTroubleTicketingSlaType]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTroubleTicketingSlaType]
AS
BEGIN
	
select * from TroubleTicketingSlaType
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingHandlers]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingHandlers]
as
begin
select * from TroubleTicketingHandlers
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDevice]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingDevice]
as
begin
select * from TroubleTicketingDevice
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingDetails]
as
begin
select * from TroubleTicketingDetails
end
GO
/****** Object:  StoredProcedure [dbo].[getTroubleTicketingCategories]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTroubleTicketingCategories]
as
begin
select * from TroubleTicketingCategories
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionTypes]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionTypes]
as
begin
select * from TransactionTypes
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactions]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactions]
as
begin
select * from Transactions
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionMaster]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionMaster]
as
begin
select * from TransactionMaster
end
GO
/****** Object:  StoredProcedure [dbo].[getTransactionDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTransactionDetails]
as
begin
select * from TransactionDetails
end
GO
/****** Object:  StoredProcedure [dbo].[getTicketGeneration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getTicketGeneration]
as
begin
select * from TicketGeneration
end
GO
/****** Object:  StoredProcedure [dbo].[insUsers]    Script Date: 03/19/2016 13:31:51 ******/
GO
/****** Object:  StoredProcedure [dbo].[insUsers]    Script Date: 03/24/2016 11:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdUsers](@Id int,@FirstName varchar(40),@LastName varchar(40),@MiddleName varchar(40)
,@UserTypeId varchar(50),@EmpNo int,@Email varchar(40),@AdressId int,@MobileNo varchar(50)
,@RoleId varchar(40),@Active int,@UserName varchar(30),@Password varchar(30),@insupdflag varchar(1),@userid int = -1)
 as begin
 
 declare @currid int
 declare @cnt int = 0
 declare @logincnt int = 0
 
 select @cnt = COUNT(*)  from Users where UPPER(EmpNo) = @EmpNo
 
 select @logincnt = COUNT(*) from userlogins where upper(logininfo) = UPPER(@username) 
 
 if @insupdflag = 'I' and @cnt > 0
 RAISERROR ('Already user exists',16,1);
 
 if @insupdflag = 'U' and @logincnt > 0
 RAISERROR ('Already user login exists',16,1);
 
 if @cnt = 0 
 begin
 insert into Users(FirstName,LastName,MiddleName, UserTypeId,EmpNo,Email,AdressId,MobileNo,[RoleId],Active)
 values(@FirstName,@LastName,@MiddleName, @UserTypeId,@EmpNo,@Email,@AdressId,@MobileNo,@RoleId,@Active) 
 
 
 
 SELECT @currid = @@IDENTITY
  
   if @logincnt = 0
	insert into userlogins(logininfo,PassKey,active,userid)values(@UserName,@Password,1,@currid)
 
   
 end
 else
 
 begin
 update Users 
 set FirstName = @FirstName,
 LastName = @LastName,
 MiddleName = @MiddleName,
 Email = @Email,
 MobileNo = @MobileNo,
 RoleId = @RoleId,
 UserTypeId=@UserTypeId,
 Active = @Active 
 where id = @userid
 
 if @logincnt = 0
	update userlogins
	set logininfo = @UserName
	,PassKey = @Password
	,active = @active
	where userid = @currid
 
 end
 
 end
 

 
GO
/****** Object:  StoredProcedure [dbo].[InsUpDelTroubleTicketingCategories]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpDelTroubleTicketingCategories](@active int,@desc varchar(50),@Id int,@TTCategory varchar(50),@typegrpid int)
as
begin
insert into TroubleTicketingCategories values(@active,@desc,@Id,@TTCategory,@typegrpid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTypes]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelTypes](@Id int,@Name varchar(50),@Desc varchar(50),@TypeGroup varchar(50),@Active varchar(50))
as
begin
insert into [Types] (Name,[Desc],TypeGroup,Active) values (@Name,@Desc,@TypeGroup,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingHandlers]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTroubleTicketingHandlers](@handledOn int,@Id int,@status int,@TTId int,@userid int)
as
begin
insert into TroubleTicketingHandlers values(@handledOn,@Id,@status,@TTId,@userid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDevice]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTroubleTicketingDevice](@deviceid int,@Id int,@ticketTypeId int,@TTId int)
as
begin
insert into TroubleTicketingDevice values(@deviceid,@Id,@ticketTypeId,@TTId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDetails]    Script Date: 03/19/2016 13:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTroubleTicketingDetails](@addInfo varchar(50),@createdBy varchar(50),@createdOn int,@Id int,@raisedBy varchar(50),@status int,@ticketinfo varchar(50),@ticketTypeId int,@TTId int)
as
begin
insert into TroubleTicketingDetails (addInfo,createdBy,createdOn,raisedBy,status,ticketinfo,ticketTypeId,TTId) values(@addInfo,@createdBy,@createdOn,@raisedBy,@status,@ticketinfo,@ticketTypeId,@TTId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionTypes]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionTypes](@active int,@desc varchar(50),@Id int,@TransactionTypes varchar(50),@typegrpid int)
as
begin
insert into TransactionTypes values(@active,@desc,@Id,@TransactionTypes,@typegrpid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactions]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactions](@Id int,@barcode varchar(50),@BTPOSid varchar(50),@busNumber varchar(50),
@busId int,@change varchar(50),@company varchar(50),@companyId varchar(50),@ConductorId varchar(50),@ConductorName varchar(50),
@Date varchar(50),@destination varchar(50),@fare varchar(50),@greetingMssg varchar(50),@luggageType varchar(50),
@passengerType varchar(50),@passengerId varchar(50),@paymentId varchar(50),@printdataId varchar(50),@route varchar(50),
@routecode varchar(50),@routeId varchar(50),@source varchar(50),@time datetime,@ticketHolderId varchar(50),
@ticketHolderName  varchar(50),@TicketNumber  varchar(50),@ticketValidityPeriod  varchar(50),@totalamt int,@amtpaid int,
@TransactionCode varchar(50),@TransId varchar(50),@transType varchar(50),@userid int,@ChangeRendered varchar(50))

as
begin	
insert into Transactions (barcode,BTPOSid,busNumber,
busId,change,company,companyId,ConductorId,ConductorName,
Date,destination,fare,greetingMssg,luggageType,
passengerType,passengerId,paymentId,printdataId,route,
routecode,routeId,source,time,ticketHolderId,
ticketHolderName,TicketNumber,ticketValidityPeriod,totalamt,amtpaid,
TransactionCode,TransId,transType,userid,ChangeRendered) values(@barcode,@BTPOSid,@busNumber,
@busId,@change,@company,@companyId,@ConductorId,@ConductorName,
@Date,@destination,@fare,@greetingMssg,@luggageType,
@passengerType,@passengerId,@paymentId,@printdataId,@route,
@routecode,@routeId,@source,@time,@ticketHolderId,
@ticketHolderName,@TicketNumber,@ticketValidityPeriod,@totalamt,@amtpaid,
@TransactionCode,@TransId,@transType,@userid,@ChangeRendered)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionMaster]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionMaster](@Id int,@TransCode varchar(50),@Date DateTime,@TransType varchar(50))
as
begin
insert into TransactionMaster values(@Id,@TransCode,@Date,@TransType)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTransactionDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactionDetails](@Id int,@TransId varchar(50),@TotalAmt int,@PaymentId varchar(50),@BTPOSid varchar(50))
as
begin
insert into TransactionDetails values(@Id,@TransId,@TotalAmt,@PaymentId,@BTPOSid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelTicketGeneration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTicketGeneration](@Source varchar(50),@Target varchar(50),@NoOfTickets int)
as
begin
insert into TicketGeneration values (@Source,@Target,@NoOfTickets)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailSubscribers]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSMSEmailSubscribers](@AlertId int,@emailid varchar(50),@enddate datetime,@frequency int,@Id int,@phNo varchar(50),@startdate datetime,@userid int)
as
begin
insert into SMSEmailSubscribers values(@AlertId,@emailid,@enddate,@frequency,@Id,@phNo,@startdate,@userid)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSMSEmailConfiguration](@AlertTypeId int,@enddate datetime,@hashkey datetime,@Id int,@providername varchar(50),@pwd varchar(50),@saltkey datetime,@startdate datetime,@username varchar(50))
as
begin
insert into SMSEmailConfiguration values(@AlertTypeId,@enddate,@hashkey,@Id,@providername,@pwd,@saltkey,@startdate,@username)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutesConfiguration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoutesConfiguration](@distanceFromDest int,@distanceFromLastStop int,@distanceFromPrevStop int,@distanceFromSource int,@Id int,@routeId int,@stops varchar(50))
as
begin
insert into RoutesConfiguration values(@distanceFromDest,@distanceFromLastStop,@distanceFromPrevStop,@distanceFromSource,@Id,@routeId,@stops)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutes]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoutes](@Id int,@Route varchar(50),@Description varchar(50),@Active varchar(50),@Code varchar(50),@BTPOSGroupId varchar(50),@Source varchar(50),@Destination varchar(50))
as
begin
insert into Routes ([Route],[Description],Active,Code,BTPOSGroupId,Source,Destination) values(@Route,@Description,@Active,@Code,@BTPOSGroupId,@Source,@Destination)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteFares]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRouteFares](@active int,@fareCodeId int,@Id int,@routeId int)
as
begin
insert into RouteFares (active,fareCodeId,routeId) values(@active,@fareCodeId,@routeId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRouteDetails](@Id int,@RouteId varchar(50),@Stopname varchar(50),@Descr varchar(50),@StopCode varchar(50),@DistFromSource int,@DistFromDestination int,@DistFromPrevStop int,@DistFromNextStop int)
as
begin
insert into RouteDetails (RouteId,Stopname,Descr,StopCode,DistFromSource,DistFromDestination,DistFromPrevStop,DistFromNextStop) values(@RouteId,@Stopname,@Descr,@StopCode,@DistFromSource,@DistFromDestination,@DistFromPrevStop,@DistFromNextStop)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoles](@Id int,@Name varchar(50),@Desc varchar(50),@Active varchar(50))
as
begin
insert into Roles (Name,[Desc],Active) values(@Name,@Desc,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelRegistrationBTPOS]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRegistrationBTPOS](@code varchar(50),@uniqueId varchar(50),@ipconfig varchar(50),
                                                    @Active int)
as
begin
insert into RegistrationBTPOS values (@code,@uniqueId,@ipconfig,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentReceivings]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPaymentReceivings](@amount int,@code varchar(50),@date varchar(50),@desc int,@Id int,@inventoryId int,@quantity int,@receivedOn varchar(50),@transactionId int,@transactiontype varchar(50))
as
begin
insert into PaymentReceivings values(@amount,@code,@date,@desc,@Id,@inventoryId,@quantity,@receivedOn,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewaySettings]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPaymentGatewaySettings](@enddate datetime,@hashkey datetime,@Id int,@PaymentGatewayTypeId int,@providername varchar(50),@pwd varchar(50),@saltkey datetime,@startdate datetime,@username varchar(50))
as
begin
insert into PaymentGatewaySettings values(@enddate,@hashkey,@Id,@PaymentGatewayTypeId,@providername,@pwd,@saltkey,@startdate,@username)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayment]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPayment](@Card varchar(50),@MobilePayment varchar(50),@Cash varchar(50))
as
begin
insert into Payment values(@Card,@MobilePayment,@Cash)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelMenu]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelMenu](@Ticketgeneration varchar(50),@Settings varchar(50),@Reports varchar(50))
as
begin
insert into menu values (@Ticketgeneration,@Settings,@Reports)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelloginpage]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelloginpage](@userid varchar(50),@password varchar(50))
as
begin
insert into  loginpage  values (@userid,@password)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePayments]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelLicensePayments](@expiryOn datetime,@Id int,@licenseFor varchar(50),@licenseId int,@licenseType varchar(50),@paidon datetime,@renewedon datetime,@transId varchar (50))
as
begin
insert into LicensePayments (expiryOn,licenseFor,licenseId,licenseType,paidon,renewedon,transId) values(@expiryOn,@licenseFor,@licenseId,@licenseType,@paidon,@renewedon,@transId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventoryReceivings]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelInventoryReceivings](@amount int,@code varchar(50),@date varchar(50),@Id int,@inventoryId int,@quantity int,@reason varchar(50),@refundamt int,@returnedOn varchar(50),@transactionId int,@transactiontype varchar(50))
as
begin
insert into InventoryReceivings values(@amount,@code,@date,@Id,@inventoryId,@quantity,@reason,@refundamt,@returnedOn,@transactionId,@transactiontype)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelInventory](@Active int,@availableQty int,@category varchar(50)
,@code varchar(50),@desc varchar(50),@InventoryId int,@name varchar(50),@PerUnitPrice int,@reorderpoint int,@subcat varchar(50))
as
begin
insert into Inventory values(@Active,@availableQty,@category,@code,@desc,@InventoryId,@name,@PerUnitPrice,@reorderpoint,@subcat)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwner]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelFleetOwner](@Id int,@UserId varchar(50),@BTPOSgroupid varchar(50),@Active varchar(50))
as
begin
insert into FleetOwner values(@Id,@UserId,@BTPOSgroupid,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFares]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelFares](@Id int,@FromStop varchar(50),@ToStop varchar(50),@Fare varchar(50),@Active varchar(50),@RouteId varchar(50),@Name varchar(50))
as
begin
insert into Fares values(@Id,@FromStop,@ToStop,@Fare,@Active,@RouteId,@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelExpenses]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelExpenses](@amount int,@Date varchar(50),@desc varchar(50),@Id int,@MasterId int,@paidBy varchar(50),@paidFor varchar (50),@transactionId int)
as
begin
insert into Expenses values(@amount,@Date,@desc,@Id,@MasterId,@paidBy,@paidFor,@transactionId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELZipCode]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELZipCode](@Id NUMERIC(20),
           @Code varchar(30),
           @Active varchar(30))
           
AS
BEGIN
	

INSERT INTO 
[ZipCode] VALUES
           (@Id
           ,@Code,
           @Active)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELTroubleTicketingStatus]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelELTroubleTicketingStatus](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @TtStatusType varchar(30),
           @TypeGripId varchar(50))
AS
BEGIN
	

INSERT INTO 
[TroubleTicketingStatus] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @TtStatusType,
           @TypeGripId )
   
	END
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelELTroubleTicketingSlaType]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelELTroubleTicketingSlaType](@Active NUMERIC(10),
              
           @Desc Varchar(30),
           
           @Id numeric(10),
           @TTSLAType varchar(30),
           @TypeGripId numeric(20))
AS
BEGIN
	

INSERT INTO 
[TroubleTicketingSlaType] VALUES
           (@Active,
              
          
           @Desc,
           @Id,
           @TTSLAType,
           @TypeGripId)
   
	END
GO
/****** Object:  StoredProcedure [dbo].[GetSMSProviderConfig]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetSMSProviderConfig]
AS
BEGIN
	
select * from SMSProviderConfig
end
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailSubscribers]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getSMSEmailSubscribers]
as
begin
select * from SMSEmailSubscribers
end
GO
/****** Object:  StoredProcedure [dbo].[getSMSEmailConfiguration]    Script Date: 03/19/2016 13:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getSMSEmailConfiguration]
as
begin
select * from SMSEmailConfiguration
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentCatergory]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPaymentCatergory]
AS
BEGIN
	
select * from PaymentCatergory
end
GO
/****** Object:  StoredProcedure [dbo].[GetPayablesMaster]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPayablesMaster]
AS
BEGIN
	
select * from PayablesMaster
end
GO
/****** Object:  StoredProcedure [dbo].[Get TroubleTicketingSlaType]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get TroubleTicketingSlaType]
AS
BEGIN
	
select * from TroubleTicketingSlaType
end
GO
/****** Object:  StoredProcedure [dbo].[Get LicenceCatergories]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get LicenceCatergories]
AS
BEGIN
	
select * from LicenceCatergories
end
GO
/****** Object:  StoredProcedure [dbo].[getRoutesConfiguration]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutesConfiguration]
as
begin
select * from RoutesConfiguration
end
GO
/****** Object:  StoredProcedure [dbo].[getRoutes]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutes]
as
begin
select * from Routes
end
GO
/****** Object:  StoredProcedure [dbo].[getRouteFares]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRouteFares]
as
begin
select * from RouteFares
end
GO
/****** Object:  StoredProcedure [dbo].[getRouteDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRouteDetails]
as
begin
select * from RouteDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRoles]
as
begin
select * from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[getRegistrationBTPOS]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getRegistrationBTPOS]
as
begin
select * from RegistrationBTPOS
end
GO
/****** Object:  StoredProcedure [dbo].[Getregister]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getregister]
as begin
select * from register
end
GO
/****** Object:  StoredProcedure [dbo].[GetReceivingsMaster]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceivingsMaster]
AS
BEGIN
	
select * from ReceivingsMaster
end
GO
/****** Object:  StoredProcedure [dbo].[GetReceivings]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReceivings]
AS
BEGIN
	
select * from Receivings
end
GO
/****** Object:  StoredProcedure [dbo].[GetPOSDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPOSDetails]
AS
BEGIN

SELECT t.[Id]
      ,[POSId]
      ,[Status]
      ,g.GroupName
      ,g.Id
      ,[Location]
  FROM [POSDashboard].[dbo].[POSTerminal] t
  inner join dbo.Groups g on g.Id = t.GroupId

END
GO
/****** Object:  StoredProcedure [dbo].[getPayments]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPayments]
as
begin
select * from Payment
end
GO
/****** Object:  StoredProcedure [dbo].[getPaymentReceivings]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPaymentReceivings]
as
begin
select * from PaymentReceivings
end
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayType]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPaymentGatewayType]
AS
BEGIN
	
select * from PaymentGatewayType
end
GO
/****** Object:  StoredProcedure [dbo].[getPaymentGatewaySettings]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPaymentGatewaySettings]
as
begin
select * from PaymentGatewaySettings
end
GO
/****** Object:  StoredProcedure [dbo].[getmenu]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getmenu]
as
begin
select * from menu
end
GO
/****** Object:  StoredProcedure [dbo].[getloginpage]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getloginpage]
as
begin
select * from loginpage	
end
GO
/****** Object:  StoredProcedure [dbo].[getLicensePayments]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getLicensePayments]
as
begin
select * from LicensePayments
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceStatus]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLicenceStatus]
AS
BEGIN
	
select * from LicenceStatus
end
GO
/****** Object:  StoredProcedure [dbo].[GetLicenceCatergories]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetLicenceCatergories]
AS
BEGIN
	
select * from LicenceCatergories
end
GO
/****** Object:  StoredProcedure [dbo].[getInventoryReceivings]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getInventoryReceivings]
as
begin
select * from InventoryReceivings
end
GO
/****** Object:  StoredProcedure [dbo].[getInventory]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getInventory]
as
begin
select * from Inventory
end
GO
/****** Object:  StoredProcedure [dbo].[getFleetOwner]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getFleetOwner]
as
begin
select * from FleetOwner
end
GO
/****** Object:  StoredProcedure [dbo].[getFares]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getFares]
as
begin
select * from Fares
end
GO
/****** Object:  StoredProcedure [dbo].[getExpenses]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getExpenses]
as
begin
select * from Expenses
end
GO
/****** Object:  StoredProcedure [dbo].[getEditHistoryDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistoryDetails]
as
begin
select * from EditHistoryDetails
end
GO
/****** Object:  StoredProcedure [dbo].[getEditHistory]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistory]
as
begin
select * from EditHistory
end
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDashboardDetails]
as
begin

select p.Id ,Name as GroupName, GroupId, POSId, Status, IMEI, Location 
from BTPOSDetails p
inner join CompanyGroups c on c.Id = p.GroupId

select * from CompanyGroups

select * from Users
end
GO
/****** Object:  StoredProcedure [dbo].[GetCOUNTRY]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCOUNTRY]
AS
BEGIN
	
select * from COUNTRY
end
GO
/****** Object:  StoredProcedure [dbo].[getCompanyGroups]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCompanyGroups]
as
begin
select * from CompanyGroups
end
GO
/****** Object:  StoredProcedure [dbo].[getBusDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getBusDetails]
as
begin
select * from BusDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSheduleUploads]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSSheduleUploads]
AS
BEGIN
	
select * from [BTPOSSheduleUploads]
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSSecheduledUpdates]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSSecheduledUpdates]
AS
BEGIN
	
select * from BTPOSSecheduledUpdates
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRegistration]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSRegistration]
AS
BEGIN
	
select * from BTPOSRegistration
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSRecords]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSRecords]
AS
BEGIN
	
select * from  BTPOSRecords
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSPortSettings]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSPortSettings]
AS
BEGIN
	
select * from BTPOSPortSettings
end
GO
/****** Object:  StoredProcedure [dbo].[getBTPOSInventorySales]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getBTPOSInventorySales]
as
begin
select * from BTPOSInventorySales
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSFaultsCatageries]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSFaultsCatageries]
AS
BEGIN
	
select * from BTPOSFaultsCatageries
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetBTPOSDetails]
AS
BEGIN
	
select * from BTPOSDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSAuditDetails]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSAuditDetails]
AS
BEGIN
	
select * from BTPOSAuditDetails
end
GO
/****** Object:  StoredProcedure [dbo].[GetBlockList]    Script Date: 03/19/2016 13:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBlockList]
AS
BEGIN
	
select * from Blocklist
end
GO

CREATE procedure [dbo].[ValidateCredentials](@logininfo varchar(50) = null, @passkey varchar(50) = null)
as
begin

select logininfo,firstname, lastname,userid  
from userlogins ul 
inner join users u on 
u.id = ul.userid
where LoginInfo=@logininfo and [PassKey]=@passkey

end
