

/****** Object:  Table [dbo].[Alerts]    Script Date: 05/05/2016 18:38:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Alerts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Message] [varchar](50) NOT NULL,
	[MessageTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[UserId] [int] NOT NULL  DEFAULT ((1)),
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Notifications]    Script Date: 06/03/2016 17:10:29 ******/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Message] [varchar](500) NOT NULL,
	[MessageTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[UserId] [int] NOT NULL  DEFAULT ((1)),
	[Name] [varchar](50) NOT NULL,
	[Source] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[EditHistory]    Script Date: 05/04/2016 17:20:55 ******/
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
	[ChangedType] [varchar](50) NOT NULL,
	[Task] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EditHistoryDetails]    Script Date: 05/04/2016 17:21:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EditHistoryDetails](
	[EditHistoryId] [int] NOT NULL,
	[FromValue] [varchar](50) NULL,
	[ToValue] [varchar](50) NULL,
	[ChangeType] [varchar](50) NOT NULL,
	[Field1] [varchar](50) NULL,
	[Field2] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [dbo].[InsEditHistory]    Script Date: 05/04/2016 17:21:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsEditHistory]
(@Task varchar(50) =null,@Field varchar(50) =null
           ,@SubItem varchar(50) =null
           ,@Comment varchar(50) =null
           ,@Date datetime
           ,@ChangedBy varchar(50) =null
           ,@ChangedType varchar(50) =null           
           ,@edithistoryid int = -1 OUTPUT)
as
begin


INSERT INTO [dbo].[EditHistory]
           ([Field]
           ,[SubItem]
           ,[Comment]
           ,[Date]
           ,[ChangedBy]
           ,[ChangedType]
           ,[Task])
     VALUES
           (@Field
           ,@SubItem
           ,@Comment
           ,@Date
           ,@ChangedBy
           ,@ChangedType
           ,@Task)

 select @edithistoryid = SCOPE_IDENTITY()

end

GO

/****** Object:  StoredProcedure [dbo].[InsEditHistoryDetails]    Script Date: 05/04/2016 17:21:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsEditHistoryDetails]
(@EditHistoryId  int
         ,@FromValue varchar(50) = null
           ,@ToValue varchar(50)= null
           ,@ChangeType varchar(50)
           ,@Field1 varchar(50) = null
           ,@Field2 varchar(50) = null)
AS
BEGIN
	INSERT INTO [dbo].[EditHistoryDetails]
           ([EditHistoryId]
           ,[FromValue]
           ,[ToValue]
           ,[ChangeType]
           ,[Field1]
           ,[Field2])
     VALUES
           (@EditHistoryId
           ,@FromValue
           ,@ToValue
           ,@ChangeType
           ,@Field1
           ,@Field2)

END



GO

GO

/****** Object:  Table [dbo].[Company]    Script Date: 07/01/2016 12:23:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Desc] [varchar](50) NULL,
	[Active] [int] NOT NULL,
	[Logo] [image] NULL,
	[Address] [varchar](500) NOT NULL,
	[ContactNo1] [varchar](50) NOT NULL,
	[ContactNo2] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Title] [varchar](50) NULL,
	[Caption] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [int] NULL,
	[State] [varchar](50) NULL,
	[FleetSize] [int] NULL,
	[StaffSize] [int] NULL,
	[AddressId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[CompanyRoles]    Script Date: 05/05/2016 10:16:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO



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

/****** Object:  Table [dbo].[BTPOSRecords]    Script Date: 06/08/2016 18:57:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BTPOSRecords](
	[Id] [int] NOT NULL,
	[POSID] [int] NOT NULL,
	[RecordData] [binary](2000) NULL,
	[FileName] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Downloaded] [datetime] NULL,
	[LastDownloadtime] [datetime] NULL,
	[IsDirty] [int] NULL default 1
) ON [PRIMARY]

GO

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[POSID] [varchar](20) NOT NULL,
	[StatusId] [int] NOT NULL,
	[IMEI] [varchar](50) NULL,
	[ipconfig] [varchar](20) NULL,
	[active] [int] NULL,
	[FleetOwnerId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTPOSAuditDetails](
	[BTPOSID] [numeric](18, 0) NULL,
	[EditHistoryId] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POSTerminal](
	[Id] [int] NULL,
	[POSId] [varchar](10) NULL,
	[Status] [int] NULL,
	[GroupId] [int] NULL,
	[Location] [varchar](100) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteName] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [int] NOT NULL CONSTRAINT [DF_Routes_Active]  DEFAULT ((1)),
	[SourceId] [int] NOT NULL,
	[DestinationId] [int] NOT NULL,
	[Distance] [decimal](18, 0) NULL
) ON [PRIMARY]

SET ANSI_NULLS ON
GO


SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoutes]
as
begin
SELECT r.[Id]
      ,[RouteName]
      ,r.[Code]
      ,r.[Description]
      ,r.[Active]
      ,src.name as Source
      ,dest.name as Destination
      ,[SourceId]
      ,[DestinationId]
      ,[Distance]
  FROM [dbo].[Routes] r
  inner join stops src on src.id = r.sourceid
  inner join stops dest on dest.id = destinationid
  order by RouteName
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE[dbo].[PaymentGatewaySettings](
	[enddate] [datetime] NOT NULL,
	[hashkey] [datetime] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentGatewayTypeId] [int] NOT NULL,
	[providername] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[saltkey] [datetime] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[ClientId] [int] NULL,
	[SecretId] [int] NULL
) ON [PRIMARY]

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Card] [varchar](50) NOT NULL,
	[MobilePayment] [varchar](50) NOT NULL,
	[Cash] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPayables](@Id numeric(30),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[Path] [varchar](500) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectAccesses](
	[Id] [int] NOT NULL,
	[ObjectId] [int] NOT NULL,
	[AccessId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelNOCBTPOSTracking](@Id numeric(10),              
           @BTPOSId numeric(10),
           @Xcord varchar(50),
           @Ycord Varchar(50),
           @Time varchar(20),
           @Date Datetime)
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mulitiplicationsave](
	[rows] [numeric](18, 0) NULL,
	[columns] [numeric](18, 0) NULL,
	[layoutId] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[Ticketgeneration] [varchar](50) NOT NULL,
	[Settings] [varchar](50) NOT NULL,
	[Reports] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginpage](
	[userid] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventorySales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PerUnitPrice] [int] NOT NULL,
	[PurchaseDate] [varchar](50) NOT NULL,
	[InVoiceNumber] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


/****** Object:  Table [dbo].[Inventory]    Script Date: 05/25/2016 12:09:07 ******/
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
	[InventoryItemId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[PerUnitPrice] [int] NOT NULL,
	[reorderpoint] [int] NOT NULL,
	[subcat] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  Table [dbo].[InventoryPurchases]    Script Date: 05/06/2016 23:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryPurchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PerUnitPrice] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[PurchaseOrderNumber] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [int] NOT NULL,
	[TypeGroupId] [int] NOT NULL,
	[listkey] [varchar](10) NULL,
	[listvalue] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [int] NULL
) ON [PRIMARY]

GO
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
  FROM [dbo].[POSTerminal] t
  inner join dbo.Groups g on g.Id = t.GroupId

END

/****** Object:  Table [dbo].[TroubleTicketingDetails]    Script Date: 06/08/2016 17:03:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TroubleTicketingDetails](
	[Type] [varchar](50) NOT NULL,
	[createdBy] [varchar](50) NOT NULL,
	[Raised] [int] NOT NULL,
	[TicketTitle] [int] NOT NULL,
	[IssueDetails] [varchar](50) NOT NULL,
	[AddInfo] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Asign] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RefId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroubleTicketingCategories](
	[active] [int] NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[TTCategory] [varchar](50) NOT NULL,
	[typegrpid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[active] [int] NOT NULL,
	[desc] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[TransactionTypes] [varchar](50) NOT NULL,
	[typegrpid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[barcode] [varchar](50) NOT NULL,
	[BTPOSid] [varchar](50) NOT NULL,
	[busNumber] [varchar](50) NOT NULL,
	[busId] [int] NULL,
	[change] [varchar](50) NULL,
	[company] [varchar](50) NOT NULL,
	[companyId] [varchar](50) NULL,
	[ConductorId] [varchar](50) NULL,
	[ConductorName] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[destination] [varchar](50) NOT NULL,
	[fare] [varchar](50) NULL,
	[greetingMessage] [varchar](50) NOT NULL,
	[luggageType] [varchar](50) NOT NULL,
	[passengerType] [varchar](50) NOT NULL,
	[passengerId] [varchar](50) NULL,
	[paymentId] [varchar](50) NOT NULL,
	[printdataId] [varchar](50) NOT NULL,
	[route] [varchar](50) NULL,
	[routecode] [varchar](50) NOT NULL,
	[routeId] [varchar](50) NULL,
	[source] [varchar](50) NOT NULL,
	[time] [datetime] NOT NULL,
	[ticketHolderId] [varchar](50) NULL,
	[ticketHolderName] [varchar](50) NULL,
	[TicketNumber] [varchar](50) NOT NULL,
	[ticketValidityPeriod] [varchar](50) NULL,
	[totalamount] [int] NOT NULL,
	[amountpaid] [int] NOT NULL,
	[TransactionCode] [varchar](50) NOT NULL,
	[TransactionId] [varchar](50) NULL,
	[transactionType] [varchar](50) NOT NULL,
	[userid] [int] NOT NULL,
	[ChangeRendered] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionMaster](
	[Id] [int] NOT NULL,
	[TransCode] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransType] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGeneration](
	[Source] [varchar](50) NOT NULL,
	[Target] [varchar](50) NOT NULL,
	[NoOfTickets] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table2](
	[Travels] [nvarchar](50) NULL,
	[DepartArriveDuration] [nvarchar](50) NULL,
	[Seats] [nvarchar](50) NULL,
	[Rating] [nvarchar](50) NULL,
	[Fare] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[Id] [int] NULL,
	[TransId] [varchar](50) NULL,
	[TotalAmt] [int] NULL,
	[PaymentId] [varchar](50) NULL,
	[BTPOSid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[CategoryId] [int] NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[SMSEmailConfiguration]    Script Date: 07/11/2016 14:30:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SMSEmailConfiguration](
	[enddate] [datetime] NOT NULL,
	[hashkey] [datetime] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[providername] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[saltkey] [datetime] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[Port] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[SecretId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutesVehicle](
	[Id] [int] NOT NULL,
	[VehicleId] [nvarchar](50) NOT NULL,
	[RouteId] [nvarchar](50) NOT NULL,
	[EffectiveFrom] [nvarchar](50) NOT NULL,
	[EffectiveTill] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Description] [varchar](30) NULL,
	[Code] [varchar](10) NOT NULL,
	[Active] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Table [dbo].[RouteFare]    Script Date: 06/10/2016 08:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteFare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[SourceStopId] [int] NOT NULL,
	[DestinationStopId] [int] NOT NULL,
	[Distance] [decimal](18, 0) NOT NULL,
	[PerUnitPrice] [decimal](18, 0) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[FareTypeId] [int] NOT NULL,
	[RouteStopId] [int] NOT NULL
) ON [PRIMARY]



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteFareDetails](
	[Id] [int] NOT NULL,
	[RouteId] [varchar](50) NOT NULL,
	[FleetOwnerId] [int] NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [nvarchar](50) NOT NULL,
	[Stop] [nvarchar](50) NOT NULL,
	[Kilometers] [int] NOT NULL,
	[Fare] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[StopId] [int] NOT NULL,
	[DistanceFromSource] [decimal](18, 0) NULL,
	[DistanceFromDestination] [decimal](18, 0) NULL,
	[DistanceFromPreviousStop] [decimal](18, 0) NULL,
	[DistanceFromNextStop] [decimal](18, 0) NULL,
	[PreviousStopId] [int] NOT NULL,
	[NextStopId] [int] NOT NULL,
	[StopNo] [int] null
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Roles]    Script Date: 05/20/2016 21:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Active] [int] NOT NULL,
	[IsPublic] [int] NULL CONSTRAINT [DF_Roles_IsPublic]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleObjectAccesses](
	[Id] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ObjectId] [int] NOT NULL,
	[AccessId] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRoledetails]
as begin 
select * from RoleDetails
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationBTPOS](
	[code] [varchar](50) NOT NULL,
	[uniqueId] [varchar](50) NOT NULL,
	[ipconfig] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelSTATE](@Id NUMERIC(10),
           @Name VARCHAR(20),
           @Count VARCHAR(20),
           @Code VARCHAR(20),
           @Active varchar(20))
AS
BEGIN
	

INSERT INTO 
[STATE] VALUES
           (@Id,
           @Name,
           @Count,
           @Code,
           @Active)
	END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelObjects](@Id int,
@Name varchar(50),
@Description varchar(100) = '',
@Path Varchar(500),
@insupdflag varchar(1),
@Active int = 1)
as
begin
declare @cnt int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from Objects where UPPER(name) = UPPER(@Name)

if @cnt =0


INSERT INTO [dbo].[Objects]
           ([Name]
           ,[Description]
           ,[Path] 
           ,[Active])
     VALUES
           (@Name
           ,@Description
           ,@Path 
           ,@Active)
           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Objects where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt > 0


update Objects 
set 
[Name]=@Name
,[Active] = @Active
,[Description] = @Description
,[Path]=@Path
where Name = @Name




end
if @insupdflag = 'D'
begin
DELETE FROM [dbo].[Objects]
      WHERE Id = @Id
end
end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelObjectAccess](@Id int,
@ObjectId int,
@AccessId int,@Name varchar(50))

as
begin
insert into ObjectAccess (ObjectId,AccessId,Name) values(@ObjectId,@AccessId,@Name)
end

GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/22/2016 12:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40)  NOT NULL,
	[LastName] [varchar](40)  NOT NULL,
	[EmpNo] [varchar](50)  NOT NULL,
	[Email] [varchar](40)  NULL,
	[AddressId] [int] NULL,
	[MobileNo] [varchar](15) NULL,
	[Active] [int] NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[CompanyId] [int] NOT NULL,
	[ManagerId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleDetails](
	[busId] [money] NOT NULL,
	[busTypeId] [int] NOT NULL,
	[conductorId] [int] NOT NULL,
	[conductorName] [varchar](50) NOT NULL,
	[driverId] [int] NOT NULL,
	[driverName] [varchar](50) NOT NULL,
	[fleetOwnerId] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[POSID] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[route] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[statusid] [int] NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelRoledetails](@Id int,

@ObjectName varchar(50),
@Path varchar(50)
)
as
begin
insert into Object (ObjectName,Path) values(@ObjectName, @Path)
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPaymentgateway](@Id numeric(20),
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
           @userId,
           @Passkey,
           @Url,
           @Testurl,
           @Salt,
           @Hash,
           @PaymentGatwayTypeId)
   
	END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[ReOrderPoint] [int] NOT NULL,
	[ItemImage] [image] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[FleetBtpos]    Script Date: 05/25/2016 08:33:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetBtpos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[BTPOSId] [int] NOT NULL
) ON [PRIMARY]


GO

GO
/****** Object:  Table [dbo].[FleetDetails]    Script Date: 06/08/2016 22:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleetDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleRegNo] [varchar](15)  NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[FleetOwnerId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[Active] [int] NOT NULL,
	[LayoutTypeId] [int] NOT NULL,
	[EngineNo] [varchar](50) NULL,
	[FuelUsed] [varchar](50)  NULL,
	[MonthAndYrOfMfr] [datetime] NULL,
	[ChasisNo] [varchar](50)  NULL,
	[SeatingCapacity] [int] NULL,
	[DateOfRegistration] [datetime] NULL
) ON [PRIMARY]

GO


SET ANSI_PADDING OFF
GO



SET ANSI_PADDING OFF
GO



GO

SET ANSI_PADDING OFF
GO

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetRoutes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[EffectiveFrom] [datetime] NULL,
	[EffectiveTill] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FleetStaff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FromDate] [datetime]  NULL,
	[ToDate] [datetime]  NULL,
	[VehicleId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL
) ON [PRIMARY]



GO

/****** Object:  Table [dbo].[FleetAvailability]    Script Date: 05/25/2016 10:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetAvailability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL
) ON [PRIMARY]


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FleetOwnerRouteStop](
	[FleetOwnerId] [int] NOT NULL,
	[RouteStopId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]


GO

/****** Object:  Table [dbo].[FleetOwnerRouteFare]    Script Date: 05/31/2016 08:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetOwnerRouteFare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FORouteStopId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[Distance] [decimal](18, 0) NOT NULL,
	[PerUnitPrice] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[FareTypeId] [int] NOT NULL,
	[Active] [int] NULL CONSTRAINT [DF_FleetOwnerRouteFare_Active]  DEFAULT ((1)),
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[VehicleId] [int] NOT NULL
) ON [PRIMARY]



GO

/****** Object:  Table [dbo].[FleetOwnerRoute]    Script Date: 05/29/2016 06:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetOwnerRoute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FleetOwnerId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Active] [int] NULL CONSTRAINT [DF_FleetOwnerRoute_Active]  DEFAULT ((1))
) ON [PRIMARY]


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginInfo] [nvarchar](50) NOT NULL,
	[PassKey] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[salt] [varchar](50) NULL,
	[Active] [int] NOT NULL CONSTRAINT [DF_UserLogins_Active]  DEFAULT ((1))
) ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyId] [int] NULL,
	[Active] [int] NOT NULL,
	[FleetOwnerCode] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getEditHistoryDetails]
(@edithistoryid int =-1)
as
begin
SELECT [EditHistoryId]
      ,[FromValue]
      ,[ToValue]
      ,[ChangeType]
      ,[Field1]
      ,[Field2]
      ,e.Task
      ,e.SubItem
  FROM [dbo].[EditHistoryDetails] ed
  inner join EditHistory e on e.Id = ed.EditHistoryId
  WHERE EditHistoryId = @edithistoryid
  
end

GO

CREATE procedure [dbo].[getEditHistory]
as
begin
SELECT [Field]
      ,[SubItem]
      ,[Comment]
      ,[Date]
      ,[ChangedBy]
      ,[ChangedType]
      ,[Task]
      ,[Id]
  FROM [dbo].[EditHistory]
end

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelCOUNTRY](@Id NUMERIC(10),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers]
(@cmpId int = -1)
AS
BEGIN

SELECT U.[Id]
      ,U.[FirstName]
      ,U.[LastName]      
      ,U.[EmpNo]
      ,U.[Email]
      ,U.[AddressId]
      ,U.[MobileNo]    
      ,U.[Active]
      ,U.[MiddleName]
      ,mgr.Firstname + ' ' +mgr.LastName as mgrName
      ,mgr.Id
      ,ul.logininfo as UserName
      ,ul.passkey as [Password]            
      ,c.name as [Company]
  FROM [dbo].[Users] U
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id    
  where (c.id = @cmpId or   @cmpId = -1)
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRoles]
(@allroles int = -1)
as
begin

if @allroles = -1

select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles

else

if @allroles = 0

select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles 
where ispublic = 0

else
 
select distinct Roles.Id, Roles.Name, Description, Roles.Active,IsPublic
from Roles 
where ispublic = 1

end 

go

/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyRoles]    Script Date: 07/18/2016 14:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 05/04/2016 17:22:18 ******/

/****** Object:  StoredProcedure [dbo].[InsUpdDelCompanyRoles]    Script Date: 08/08/2016 17:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 05/04/2016 17:22:18 ******/

create procedure [dbo].[InsUpdDelCompanyRoles](
@active int,
@Id int,
@roleid int,
@CompanyId int,
@insupdflag int = 0
)
as
begin
declare @edithistoryid int
declare @cnt int
declare @dt datetime
set @dt = GETDATE()


select @cnt = count(*) from companyroles where [CompanyId] = @CompanyId and [RoleId] = @roleid

if @insupdflag = 0
begin
if @cnt = 0
INSERT INTO [CompanyRoles]
           ([CompanyId]
           ,[RoleId]
           ,[Active])
     VALUES
           (@CompanyId,@roleid,@active)
           
           --insert into edit history
			exec InsEditHistory 'companyroles', 'Name',@CompanyId,'companyroles creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@CompanyId,'Insertion','CompanyId',null
			exec InsEditHistoryDetails @edithistoryid,null,@RoleId,'Insertion','RoleId',null
			
           
end

else

if @insupdflag = 1
begin
 delete from [CompanyRoles] where [CompanyId] = @CompanyId and RoleId = @roleid
end

end







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCompanies]
(@userid int =-1)
as
begin
SELECT distinct c.[active]
       ,[code]
      ,[desc]
      ,[ContactNo1]
      ,[ContactNo2]
      ,[EmailId]
      ,[Address]
      ,[Fax]
      ,[Title]
      ,[Caption]
      ,[Country]
      ,[ZipCode]
      ,[State]      
      ,c.[Id]
      ,[Name]
  FROM [dbo].[Company] c
  inner join Users u on  (u.companyId = c.id or  @userid = -1)
  order by [Name]
end

/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 07/18/2016 14:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelCompany]    Script Date: 05/04/2016 17:22:18 ******/

create procedure [dbo].[InsUpdDelCompany](
@active int,
@code varchar(50),
@desc varchar(50) = null,
@Id int,
@Name varchar(50),
@Address varchar(500),
@EmailId varchar(50),
@ContactNo1 varchar(50),
@ContactNo2 varchar(50)= null,
@Fax varchar(50)= null,
@Title varchar(50)= null,
@Caption varchar(50)= null,
@Country varchar(50)= null,
@ZipCode int = null,
@State varchar(50),
--@FleetSize int ,
--@StaffSize int,
@insupdflag varchar(1),
@userid int = -1
)
as
begin
declare @cnt int
declare @edithistoryid int
set @cnt = 0

declare @newCmpId int
set @newCmpId = 0;

declare @dt datetime
set @dt = GETDATE()

declare @neweid int



if @insupdflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from company where upper(name) = upper(@name)

			if @cnt = 0 
			begin
			insert into Company (active,code,[desc],Name,Address,ContactNo1,ContactNo2,Fax,EmailId,Title,Caption,Country,ZipCode,State) values(@active,@code,@desc,@Name,@Address,@ContactNo1,@ContactNo2,@Fax,@EmailId,@Title,@Caption,@Country,@ZipCode,@State)
			
			SELECT @newCmpId = SCOPE_IDENTITY()
			
			--insert into edit history
			exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		           
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
			exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@desc,'Insertion','Desc',null
			exec InsEditHistoryDetails @edithistoryid,null,@active,'Insertion','Active',null

		  --  --insert Fleet owner role by default
				--insert Fleet owner role by default
				 exec  InsUpdDelCompanyRoles 1,-1,6,@newCmpId,0 
				--insert Supervisor role by default
				 exec  InsUpdDelCompanyRoles 1,-1,7,@newCmpId,0 
				--insert Manager role by default
				 exec  InsUpdDelCompanyRoles 1,-1,8,@newCmpId,0 
				--insert Fleet Conductor role by default
				 exec  InsUpdDelCompanyRoles 1,-1,9,@newCmpId,0 
				--insert Fleet Ticket Salesperson Front Office by default
				 exec  InsUpdDelCompanyRoles 1,-1,10,@newCmpId,0 
				--insert Guest User role by default
				 exec  InsUpdDelCompanyRoles 1,-1,12,@newCmpId,0 
				--insert Fleet driver role by default
				 exec  InsUpdDelCompanyRoles 1,-1,13,@newCmpId,0 
		   
				 --declare @m varchar(500)
			--set @m = 'Company '+@Name+' created successfully.'
			--exec InsUpdDelNotification @dt,@m,-1,-1,1,'Admin','fleet owner creation'
			
	        --set @m = 'fleet owner '+'FL00'+@fc+' created successfully.'
	       -- exec InsUpdDelNotification @dt,@m,-1,-1,1,'Admin','fleet owner creation'
		   
			end
			else
			RAISERROR ('Company already exists',16,1); 
		end
else

   if @insupdflag = 'U'
		begin
				--check if already a company with the new name exists
				select @cnt = count(1) from company where upper(name) = upper(@name) and id <> @id
			    
				if @cnt = 0 
				begin
					update Company
					set Name = @Name, code = @code, [desc] = @desc,Address =@Address,EmailId = @EmailId,ContactNo1 =@ContactNo1,active = @active
					where Id = @Id						
						
						--insert into edit history
					exec InsEditHistory 'Company', 'Name',@Name,'Company creation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null
					exec InsEditHistoryDetails @edithistoryid,null,@code,'Insertion','Code',null
					exec InsEditHistoryDetails @edithistoryid,null,@desc,'Insertion','Desc',null					
					exec InsEditHistoryDetails @edithistoryid,null,@active,'Insertion','Active',null
				
				end
				else
					RAISERROR ('Company already exists',16,1);
		end
   else
	if @insupdflag = 'D'
	begin
     delete from Company where Id = @Id
end
end

Go


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[GetFleetDetails] 
	-- Add the parameters for the stored procedure here
	(@cmpId int = -1, @fleetOwnerId int = -1, @vehicleId int=-1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT v.[Id]
      ,[VehicleRegNo]
      ,vt.[Name] as VehicleType
      ,vt.Id AS VehicleTypeId
      ,lt.Name AS vehiclelayout
      ,lt.Id as vehiclelayoutId
      ,st.Name as ServiceType
      ,st.Id as ServiceTypeId
      , u.FirstName +' '+u.LastName as FleetOwnerName 
      ,c.[Name] as CompanyName
      ,v.[Active]
      ,[LayoutTypeId]
      ,[EngineNo]
      ,[FuelUsed]
      ,[MonthAndYrOfMfr]
      ,[ChasisNo]
      ,[SeatingCapacity]
      ,[DateOfRegistration]
     FROM [dbo].[FleetDetails]v
    inner join Types vt on vt.Id=v.VehicleTypeId
    inner join Types st on st.Id=v.ServiceTypeId
   inner join Types lt on lt.Id = v.layouttypeid
    inner join company c on c.Id=v.CompanyId
    inner join FleetOwner f on f.id=v.FleetOwnerId
   inner join Users u on u.Id = f.UserId
 --   inner join BTPOSDetails bd on bd.FleetOwnerId=f.Id
 --   inner join VehicleDetails vd on vd.fleetOwnerId=f.Id
    
	 where  ((v.Id= @vehicleId or @vehicleId = -1)
	 and (v.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1)
	 and (v.CompanyId = @cmpId or @cmpId = -1))
   
    -- Insert statements for procedure here
    
    
END

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSSheduleUploads](@Id NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSSecheduledUpdates](@Id NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSRegistration](@Id NUMERIC(10),
              
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
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--create PROCEDURE[dbo].[InsUpdDelBTPOSRecords](@Id NUMERIC(10),
              
--           @BTPOSID numeric(10),
--           @IpConfig varchar(50),
--           @RecordData varchar(50))
--AS
--BEGIN
	

----INSERT INTO 
----[BTPOSRecords] VALUES
----           (@Id,
              
----           @BTPOSID,
----           @Ipconfig,
----           @RecordData)
  
--	END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSRecords]

(@cmpId int = -1, @fleetOwnerId int = -1, @POSId int=-1)
AS
BEGIN
	
select br.[Id],
       br.[FileName],
       br.[Description],
       br.[LastDownloadtime]
       from  BTPOSRecords br
    inner join FleetDetails fd on fd.Id=br.Id
     inner join Company c on c.Id=br.Id
     
     
  

where  
	  (fd.FleetOwnerId = @fleetOwnerId or @fleetOwnerId = -1)
	 and (c.Id = @cmpId or @cmpId = -1)
end



GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSPortSettings](@Id NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSFaultsCatageries](@Active NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBTPOSDetails]
(@cmpId int = -1, @fleetownerId int =-1,@pageNum int = 5,@pageSize int = 10)
AS
BEGIN
--declare Row_Number int 

	
SELECT b.[Id]
      ,c.[Id] as CompanyId
      ,c.Name as companyname
      ,[POSID]
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,f.Id as fleetownerid
  FROM [dbo].[BTPOSDetails] b
  left outer join Types t on t.Id = statusid
  left outer join Company c on c.Id = CompanyId
  left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
where (c.Id = @cmpId or @cmpId = -1)
and(f.Id = @fleetownerId or @fleetownerId = -1)

select COUNT(*) as Row_count from BTPOSDetails

DECLARE @PageNumber AS INT, @RowspPage AS INT
--SET @PageNumber = 2
--SET @Pagesize = 10
SELECT * FROM (
             SELECT ROW_NUMBER() OVER(ORDER BY b.Id) AS ROWNUMBER,
      c.Name as companyname
      ,[POSID]
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,f.Id as fleetownerid FROM BTPOSDetails b
      left outer join Types t on t.Id = statusid
  left outer join Company c on c.Id = CompanyId
  left outer join fleetowner f on f.id = FleetOwnerId 
  left outer join Users u on u.Id = f.userId 
               ) AS TBL
WHERE ROWNUMBER > ((@pageNum - 1) * @pageSize ) AND 
ROWNUMBER <= (@pageNum * @Pagesize)
end

--exec [dbo].[GetBTPOSDetails] @pageNum = 6,@pageSize = 3

/****** Object:  StoredProcedure [dbo].[InsUpdDelBTPOSDetails]    Script Date: 07/18/2016 12:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelBTPOSDetails](
		  @Id int,
           @CompanyId int,   
           @POSID varchar(20),
           @StatusId int,
           @IMEI varchar(20),
           @ipconfig varchar(20),
           @active int = 1,
           @fleetownerid int = null,
           @insupdflag varchar(10)
           )
 
AS
BEGIN	

declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int,@cnt int
declare @oldPOSID varchar(20)
declare @oldIMEI varchar(20)
declare @oldipconfig varchar(20)

select @cnt = COUNT(*) from [dbo].[BTPOSDetails] where upper([IMEI]) = upper(@IMEI) and [IMEI] is not null

if @cnt > 0 
begin
RAISERROR ('IMEI already exists',16,1);
return
end

if @insupdflag = 'I' 
Begin



INSERT INTO [dbo].[BTPOSDetails]
           ([CompanyId]
           ,[POSID]
           ,[StatusId]
           ,[IMEI]
           ,[ipconfig]
           ,[active]
           ,[FleetOwnerId])
     VALUES
           --(--@GroupId
           --@POSID
           --,@StatusId
           --,@IMEI
           --,@ipconfig
           --,@active
           --,@FleetOwnerId)
             (1,
           @POSID
           ,1
           ,@IMEI
           ,@ipconfig
           ,1
           ,null)
           
        exec InsEditHistory 'BTPOSDetails','Name', @POSID,'BTPOSDetails Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
	    exec InsEditHistoryDetails @edithistoryid,null,@POSID,'Insertion','POSID',null			
		exec InsEditHistoryDetails @edithistoryid,null,@IMEI,'Insertion','IMEI',null
		exec InsEditHistoryDetails @edithistoryid,null,@ipconfig,'Insertion','ipconfig',null

     
 end         
           
  if @insupdflag = 'U' 
  Begin
  select @oldPOSID = POSID, @oldIMEI= IMEI, @oldipconfig= ipconfig from BTPOSDetails where Id = @Id
end
UPDATE [dbo].[BTPOSDetails]
   SET
      [POSID] = @POSID
      ,[CompanyId] = @CompanyId
      ,[StatusId] = @StatusId
      ,[IMEI] = @IMEI
      ,[ipconfig] = @ipconfig
      ,[active] = @active
      ,[FleetOwnerId] = @fleetownerid
 WHERE Id = @Id
 exec InsEditHistory 'BTPOSDetails','Name', @POSID,'BTPOSDetails updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldPOSID <> @POSID
Begin
exec InsEditHistoryDetails @edithistoryid,@oldPOSID,@POSID,'Modication','POSID',null		
end
if @oldIMEI <> @IMEI
Begin
exec InsEditHistoryDetails @edithistoryid,@oldIMEI,@IMEI,'Modication','IMEI',null		
end
if @oldipconfig<> @ipconfig
begin
exec InsEditHistoryDetails @edithistoryid,@oldipconfig,@ipconfig,'Modication','ipconfig',null		

 end
 
 
 else
 if @insupdflag = 'D' 
 begin
   delete from BTPOSDetails where Id = @Id
End
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registerbtpos]
	@fleetownercode varchar(10),
	@ipconfig varchar(20),
	@result int out 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	declare @fleetownerid int
	declare @posid int
	
	select @fleetownerid = userID from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	select @posid = ID from BTPOSDetails where FleetOwnerId = @fleetownerid and ipconfig = @ipconfig
	
	UPDATE BTPOSDetails
        SET POSID = 'POS'+ UPPER(@fleetownercode)+ cast(@posid as varchar(3))
    FROM BTPOSDetails
    where FleetOwnerId = @fleetownerid and ipconfig = @ipconfig
   
	select @result = COUNT(*) from BTPOSDetails where  POSID = 'POS'+ UPPER(@fleetownercode)+ cast(@posid as varchar(3))

    -- Insert statements for procedure here
	return @result
END

/****** Object:  StoredProcedure [dbo].[InsUpdDelVehicleDetails]    Script Date: 07/18/2016 17:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelVehicleDetails](
	@busId money,
	@busTypeId int,
	@conductorId int,
	@conductorName varchar(50),
	@driverId int,
	@driverName varchar(50),
	@fleetOwnerId int,
	@CompanyName varchar(50),
	@Id int,
	@POSID int,
	@RegNo varchar(50),
	@route varchar(50),
	@Status varchar(50),
	@statusid int,
	@Active int = 1,
	 @insupdflag varchar(10)
)
AS
BEGIN
if @insupdflag = 'I'
begin
INSERT INTO [dbo].[VehicleDetails]
           ([busId]
           ,[busTypeId]
           ,[conductorId]
           ,[conductorName]
           ,[driverId]
           ,[driverName]
           ,[fleetOwnerId]
           ,[CompanyName]
           ,[POSID]
           ,[RegNo]
           ,[route]
           ,[Status]
           ,[statusid]
           ,[Active])
     VALUES
           (@busId
           ,@busTypeId
           ,@conductorId
           ,@conductorName
           ,@driverId
           ,@driverName
           ,@fleetOwnerId
           ,@CompanyName
           ,@POSID
           ,@RegNo
           ,@route
           ,@Status
           ,@statusid
           ,@Active
  )         
  end        
else
 if @insupdflag = 'U' 
 begin
 UPDATE [dbo].[VehicleDetails]
   SET [busId] = @busId
      ,[busTypeId] = @busTypeId
      ,[conductorId] = @conductorId
      ,[conductorName] = @conductorName
      ,[driverId] = @driverId
      ,[driverName] = @driverName
      ,[fleetOwnerId] = @fleetOwnerId
      ,[CompanyName] = @CompanyName
      ,[POSID] = @POSID
      ,[RegNo] = @RegNo
      ,[route] = @route
      ,[Status] = Status
      ,[statusid] = @statusid
      ,[Active] = @Active
      WHERE Id = @Id
      end
  
else
   delete from BTPOSDetails where Id = @Id

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatebtpos]
	@fleetownercode varchar(10),
	@units int,
	@result int out 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	declare @fleetownerid int
	declare @cmpid int
	
	select @fleetownerid = userID from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	
	select @cmpid = CompanyId from Users where Id = @fleetownerid
	
	UPDATE BTPOSDetails
        SET FleetOwnerId = @fleetownerid
        ,CompanyId = @cmpid
    FROM BTPOSDetails
    INNER jOIN (
        SELECT TOP(@units) ID FROM BTPOSDetails WHERE FleetOwnerId = 1
         ORDER BY ID
    ) AS InnerMyTable ON BTPOSDetails.ID = InnerMyTable.ID
	
	select @result = COUNT(*) from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)

    -- Insert statements for procedure here
	return @result
END


GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBTPOSAuditDetails](@BTPOSId NUMERIC(10),
              
           @EditHistoryId numeric(10))
AS
BEGIN
	

INSERT INTO 
[BTPOSAuditDetails] VALUES
           (@BTPOSId,
              
           @EditHistoryId)
   
	END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelBlocklist](@Id numeric(20)
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelregisterform](@UserName varchar(max),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Getregister]
as begin
select * from register
end

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelReceivingsMaster](@Id Numeric(20),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelReceivings](@Id Numeric(10),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InsUpdDelPaymentCatergory](@Active NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPaymentGatewayType](@Active NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getPaymentGatewaySettings]
as
begin
SELECT  [enddate]
      ,[hashkey]
      ,p.[Id]
      ,[PaymentGatewayTypeId]
      ,[providername]
      ,[pwd]
      ,[saltkey]
      ,[startdate]
      ,[username]
	  ,[ClientId]
      ,[SecretId]
      ,Ty.Name
    
  FROM [dbo].[PaymentGatewaySettings] p
  inner join TypeGroups Ty on Ty.Id = p.Id 
    
end

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPaymentGatewaySettings]    Script Date: 07/18/2016 16:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPaymentGatewaySettings]
(
@enddate datetime,
@hashkey datetime,
@PaymentGatewayTypeId int,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[PaymentGatewaySettings]
           ([enddate]
           ,[hashkey]
           ,[PaymentGatewayTypeId]
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
             ,[ClientId]      
              ,[SecretId]        
             )  values
(@enddate,
@hashkey,
@PaymentGatewayTypeId,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@clientId,
@SecretId)
end

          else
  if @insupdflag = 'U' 
  begin
UPDATE [dbo].[PaymentGatewaySettings]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate      
end
end
GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelPayablesMaster](@Id numeric,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetObjectAccesses] 	
AS
BEGIN
	select t.name,t.ID accessid, o.Name as objname from Types t
inner join ObjectAccesses oa on oa.AccessId = t.Id
inner join Objects o on o.Id = oa.ObjectId
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getObjects](@objid int = -1)
as
begin
declare @oid int
set @oid = @objid

select  o.Id, o.Name, o.Description, Path,active 
from Objects o
where o.Id = @objid or @objid = -1

select t.name,t.ID from Types t
inner join ObjectAccesses oa on oa.AccessId = t.Id
inner join Objects o on o.Id = oa.ObjectId
where  o.Id = @objid or @objid = -1
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoleObjectAccesses] 	
@roleid int = -1
AS
BEGIN
	select t.name,t.ID accessid, o.Name  as objname, r.Name as rolename from Types t
inner join RoleObjectAccesses roa on roa.AccessId = t.Id
inner join Objects o on o.Id = roa.ObjectId
inner join Roles r on r.Id = roa.RoleId
where r.Id = @roleid or @roleid = -1

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getmulitiplicationsave]
AS
BEGIN
	
select * from mulitiplicationsave
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelmulitiplicationsave](@rows int,@columns int, @layoutId int)
AS
BEGIN
	

INSERT INTO 
[mulitiplicationsave] VALUES
           (@rows,
             @columns,
             @layoutId)
   
	END

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelLicenceStatus](@Active NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelLicenceCatergories](@Active NUMERIC(10),
              
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInventorySales]
As
BEGIN
SELECT sl.[Id]
      ,sl. ItemName
      ,sl.[Quantity]
      ,sl.PerUnitPrice
      ,sl.[PurchaseDate]
      ,sl.[InVoiceNumber]
  FROM [dbo].[InventorySales] sl
  


 


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
END



/****** Object:  StoredProcedure [dbo].[InsupddelInventorySales]    Script Date: 04/27/2016 17:49:02 ******/
SET ANSI_NULLS ON

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsupddelInventorySales] (@Id int,@ItemName varchar(50),@Quantity int,@PerUnitPrice int,@PurchaseDate varchar(50),@InVoiceNumber int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[InventorySales]
           ([ItemName]
           ,[Quantity]
           ,[PerUnitPrice]
           ,[PurchaseDate]
           ,[InVoiceNumber])
     VALUES
    (@ItemName,@Quantity,@PerUnitPrice,@PurchaseDate,@InVoiceNumber)




END


GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInventoryPurchases]
as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
      ,[ItemName]
      ,[Quantity]
      ,[PerUnitPrice]
      ,[PurchaseDate]
      ,[PurchaseOrderNumber]
  FROM [dbo].[InventoryPurchases]



END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsupdInventoryPurchases]  (@Id int,@ItemName varchar(50)
           ,@Quantity int
           ,@PerUnitPrice int 
           ,@PurchaseDate datetime
           ,@PurchaseOrderNumber varchar(20))
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[InventoryPurchases]
           ([ItemName]
           ,[Quantity]
           ,[PerUnitPrice]
           ,[PurchaseDate]
           ,[PurchaseOrderNumber])
     VALUES
           (@ItemName
           ,@Quantity
           ,@PerUnitPrice
           ,@PurchaseDate
           ,@PurchaseOrderNumber)

END
/****** Object:  StoredProcedure [dbo].[GetAlerts]    Script Date: 04/28/2016 11:12:57 ******/
SET ANSI_NULLS ON

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInventorySubCategories] 	
AS
BEGIN
	
	SELECT S.[Id]
      ,S.[Name]
      ,S.[Description]
      ,[CategoryId]
      ,t.NAME CATEGORY
      ,S.[Active]
  FROM [dbo].[SubCategory] S
  INNER jOIN Types T ON T.ID = S.CATEGORYID
  INNER jOIN TypeGroups TG ON TG.Id = T.TypeGroupId AND TG.ID = 1
   



	
END

GO
/****** Object:  StoredProcedure [dbo].[InsUpdTypes]    Script Date: 06/30/2016 11:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdTypes](@Id int,@Name varchar(50),@Description varchar(50) = null,@TypeGroupId varchar(50),@Active varchar(30),@insupdflag varchar(1))
as
begin

declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from Types where UPPER(name) = UPPER(@Name)

if @cnt =0
INSERT INTO [dbo].[Types]
           ([Name]
           ,[Description]
           ,[TypeGroupId] 
           ,[Active])
     VALUES
           (@Name
           ,@Description
           ,@TypeGroupId 
           ,@Active)
           
           
           exec InsEditHistory 'Types','Name', @Name,'Type Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Types where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt =0

select @oldname = name, @olddesc = description, @oldactive = active from types where Id = @Id


update types 
set 
[Name]=@Name
,[Active] = @Active
,[Description] = @Description

where Id = @Id

 exec InsEditHistory 'Types','Name', @Name,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		

end
if @insupdflag = 'D'
begin
DELETE FROM [dbo].[Types]
      WHERE Id = @Id
end
end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTypes]

as
begin
SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	

END

GO
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
	SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where (TypeGroupId = @typegrpid or @typegrpid = -1)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSubCategories] 
(@catid int =-1)	
AS
BEGIN
	
	SELECT S.[Id]
      ,S.[Name]
      ,S.[Description]
      ,[CategoryId]
      ,t.NAME CATEGORY
      ,S.[Active]
  FROM [dbo].[SubCategory] S
  INNER jOIN Types T ON T.ID = S.CATEGORYID
  INNER jOIN TypeGroups TG ON TG.Id = T.TypeGroupId 
  where (S.CATEGORYID = @catid or @catid = -1)
   	
END

GO
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
/****** Object:  StoredProcedure [dbo].[InsUpdTypeGroups]    Script Date: 06/30/2016 11:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdTypeGroups](@Id int,@Name varchar(50)
,@Description varchar(50) = null,@Active int, @insupdflag varchar(1))
as
begin
declare @dt datetime
set @dt = GETDATE()
declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int

if @insupdflag = 'I'
begin

select @cnt = COUNT(*) from TypeGroups where UPPER(name) = UPPER(@Name)

if @cnt =0

INSERT INTO [dbo].[TypeGroups]
           ([Name]
           ,[Description]
           ,[Active])
     VALUES
           (@Name
           ,@Description
           ,@Active)

exec InsEditHistory 'TypeGroups','Name', @Name,'TypeGroups Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null




end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from TypeGroups where UPPER(name) = UPPER(@Name) 
and Id <> @Id
              
if @cnt =0
           
   select @oldname = name, @olddesc = description, @oldactive = active from TypeGroups where Id = @Id        

UPDATE [dbo].[TypeGroups]
   SET [Name] = @Name
      ,[Description] = @Description
      ,[Active] = @Active
 WHERE Id = @Id
	
	exec InsEditHistory 'TypeGroups','Name', @Name,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		


              
end
if @insupdflag = 'D'
begin
DELETE FROM [dbo].[TypeGroups]
      WHERE Id = @Id
end
end
          
   



GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelTroubleTicketingSlaType](@Active NUMERIC(10),
              
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
/****** Object:  StoredProcedure [dbo].[InsUpdDelTroubleTicketingDetails]    Script Date: 07/30/2016 16:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelTroubleTicketingDetails]
(@RefId Int,
@Type int,
@createdBy Varchar(50),
--@Id int,
@raised int,
@status int,
@TicketTitle int, 
@IssueDetails Varchar(50),
@AddInfo Varchar(50),
@Asign int)
as
begin
insert into TroubleTicketingDetails
(
Type,
createdBy,
--Id ,
raised,
status ,
TicketTitle,
IssueDetails,
AddInfo ,
RefId,
Asign ) 
values
( --@Id,
@Type ,
@createdBy,
@raised ,
@status ,
@TicketTitle ,
@IssueDetails ,
@AddInfo ,
@RefId,
@Asign)
end



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[getTroubleTicketingDetails]
as
begin
select * from TroubleTicketingDetails
end



GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelTransactions]
(@Id int
,@barcode varchar(50)=''
,@BTPOSid varchar(50)
,@busNumber varchar(50)
,@busId int=''
,@change varchar(50)=''
,@company varchar(50)
,@companyId varchar(50)=''
,@ConductorId varchar(50)=''
,@ConductorName varchar(50)=''
,@Date datetime=''
,@destination varchar(50)=''
,@fare varchar(50)=''
,@greetingMessage varchar(50)
,@luggageType varchar(50)
,@passengerType varchar(50)
,@passengerId varchar(50)
,@paymentId varchar(50)=''
,@printdataId varchar(50)
,@route varchar(50)=''
,@routecode varchar(50)=''
,@routeId varchar(50)
,@source varchar(50)=''
,@time datetime
,@ticketHolderId varchar(50)=''
,@ticketHolderName  varchar(50)
,@TicketNumber  varchar(50)
,@ticketValidityPeriod  varchar(50)=''
,@totalamount int
,@amountpaid int
,@TransactionCode varchar(50)
,@TransactionId varchar(50)=''
,@transactionType varchar(50)
,@userid int
,@ChangeRendered varchar(50)='fgg')

as
begin	
insert into Transactions (barcode,BTPOSid,busNumber,
busId,change,company,companyId,ConductorId,ConductorName,
Date,destination,fare,greetingMessage,luggageType,
passengerType,passengerId,paymentId,printdataId,route,
routecode,routeId,source,time,ticketHolderId,
ticketHolderName,TicketNumber,ticketValidityPeriod,totalamount,amountpaid,
TransactionCode,TransactionId,transactionType,userid,ChangeRendered) values(@barcode,@BTPOSid,@busNumber,
@busId,@change,@company,@companyId,@ConductorId,@ConductorName,
@Date,@destination,@fare,@greetingMessage,@luggageType,
@passengerType,@passengerId,@paymentId,@printdataId,@route,
@routecode,@routeId,@source,@time,@ticketHolderId,
@ticketHolderName,@TicketNumber,@ticketValidityPeriod,@totalamount,@amountpaid,
@TransactionCode,@TransactionId,@transactionType,@userid,@ChangeRendered)
end

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Gettable2]
AS
BEGIN
	
select * from table2
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetInventoryItem]
as 
begin
SELECT I.[Id]
      ,[ItemName]
      ,[Code]
      ,I.[Description]
      ,t.name as Category
      ,t.id as categoryid
      ,s.name as SubCategory
      ,s.id as SubCategoryId
      ,[ReOrderPoint]
  FROM [dbo].[InventoryItem]I
 inner join types t on t.id = i.categoryid
 INNER jOIN SubCategory s  ON s.id = I.SubCategoryid
  
end

/****** Object:  StoredProcedure [dbo].[InsUpdelStops]    Script Date: 07/18/2016 17:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsUpdelStops]
	-- Add the parameters for the stored procedure here
(@Id int,
      @Name varchar(30),
      @Description varchar(30) = null,
      @Code varchar(10),
      @Active int,
     @insupdflag varchar(1))
     
     
     
AS
BEGIN
declare @cnt int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldname varchar(50)
declare @oldDescription varchar(250)
declare @oldCode varchar(250)
declare @oldactive int
	-- SET NOCOUNT ON added to prevent extra result sets from
	if @insupdflag='I'
	begin

select @cnt = COUNT(*) from Stops where UPPER(name) = UPPER(@Name)

if @cnt =0
INSERT INTO Stops
           (Name,
           [Description],
           Code,
           Active)
           values
           (@Name,
           @Description,
           @Code,
           @Active)
    exec InsEditHistory 'Stops','Name', @Name,'Stops Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


                   
           
           
           
           
           end
else
if @insupdflag = 'U'
begin

select @cnt = COUNT(*) from Stops where UPPER(name) = UPPER(@Name) 
and Id <> @Id

if @cnt =0
select @oldname = name, @oldDescription = description,@oldCode=Code, @oldactive = active from Stops where Id = @Id


UPDATE Stops
   SET Name = @Name ,
      [Description] = @Description  ,
      Code = @Code ,
      Active = @Active 
 WHERE id=@id

exec InsEditHistory 'Stops','Name', @Name,'Stops updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @oldDescription<> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		
if @oldCode <> @Code
exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		
if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		
end
 if @insupdflag = 'D'
 begin
  delete from stops where id = @id
end
END







GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStops]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Code]
      ,[Active]
  FROM [dbo].[Stops]




END

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelSMSProviderConfig](@Id numeric(20),
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
/****** Object:  StoredProcedure [dbo].[getSMSEmailConfiguration]    Script Date: 07/11/2016 14:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getSMSEmailConfiguration]
as
begin
 SELECT  Distinct 
      [enddate]
      ,[hashkey]
      ,[Id]
      ,[providername]
      ,[pwd]
      ,[saltkey]
      ,[startdate]
      ,[username] 
     ,[Port]
     ,[ClientId]
     ,[SecretId]
  FROM [dbo].[SMSEmailConfiguration] 

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSEmailConfiguration]    Script Date: 07/18/2016 17:07:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelSMSEmailConfiguration]
(@enddate datetime,
@hashkey datetime,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@Port int,
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[SMSEmailConfiguration]
           ([enddate]
           ,[hashkey]           
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
           ,[Port]
             ,[ClientId]      
              ,[SecretId] )         
values
(@enddate,
@hashkey,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@Port,
@ClientId,
@SecretId)
end
          
          else
  if @insupdflag = 'U' 
  begin
UPDATE [dbo].[SMSEmailConfiguration]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[Port]= @Port
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate 
end
end


GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetRouteFare]
(@RouteId int)
AS
BEGIN
	
SELECT 
      rs.[Id]
      ,rs.[RouteId]     
      ,rs.[FromStopId]
      ,rs.[ToStopId]
      ,rs.[Distance]     
      ,case when rf.perunitprice is null then 0 else rf.perunitprice 
end as PerUnitPrice
          ,case when rf.Amount is null then 0 else rf.Amount 
end as Amount
  FROM [dbo].[RouteStops] rs
left outer join [dbo].[RouteFare] rf
on rf.routestopid = rs.id
  where rs.RouteId = @RouteId

select S.Name,S.Id from routedetails rd
inner join stops S on rd.StopId = S.Id 
where rd.RouteId = @RouteId

end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getRouteDetails]
(@routeid int = -1)
as
begin

SELECT r.[Id]
      ,r.routename as routename
	  ,r.code as routecode      
      ,src.name source
      , dest.name dest
  FROM [dbo].[Routes] r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
where r.Id = @routeid or @routeid = -1

SELECT rd.[Id]
      ,r.routename as routename
	  ,r.code as routecode
      ,[RouteId]      
      ,stopid
      ,src.name StopName
      ,src.code StopCode
	  ,[PreviousStopId]
      ,[NextStopId]
      ,prevstops.name prevstop
      ,nextstops.name nextstop
      ,[DistanceFromSource]
      ,[DistanceFromDestination]
      ,[DistanceFromPreviousStop]
      ,[DistanceFromNextStop]   
	  ,[StopNo]   
  FROM [dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
inner join routes r on r.id = rd.routeid
inner join stops prevstops on prevstops.id =previousstopid
inner join stops nextstops on nextstops.id = nextstopid
  where (@routeid = -1 or routeid = @routeid)
  order by stopno

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 07/18/2016 16:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[InsUpdDelRouteDetails]    Script Date: 04/13/2016 11:13:24 ******/

create procedure [dbo].[InsUpdDelRouteDetails]
(           @RouteId int
           ,@StopId int
           ,@DistanceFromSource decimal(18,0)
           ,@DistanceFromDestination decimal(18,0)
           ,@DistanceFromPreviousStop decimal(18,0)
           ,@DistanceFromNextStop decimal(18,0)
           ,@PreviousStopId int
           ,@NextStopId int
           ,@StopNo int
           ,@insupddelflag varchar
)
as
begin

declare @cnt int
set @cnt = -1

if @insupddelflag = 'I'
begin

INSERT INTO [dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
           ,[StopNo])
     VALUES
           (@RouteId
           ,@StopId
           ,@DistanceFromSource
           ,@DistanceFromDestination
           ,@DistanceFromPreviousStop
           ,@DistanceFromNextStop
           ,@PreviousStopId
           ,@NextStopId
           ,@StopNo)
           end

else
  if @insupddelflag = 'U'
  begin
UPDATE [dbo].[RouteDetails]
   SET [DistanceFromSource] = @DistanceFromSource
      ,[DistanceFromDestination] = @DistanceFromDestination
      ,[DistanceFromPreviousStop] = @DistanceFromPreviousStop
      ,[DistanceFromNextStop] = @DistanceFromNextStop
      ,[PreviousStopId] = @PreviousStopId
      ,[NextStopId] = @NextStopId
      ,[StopNo] = @StopNo
 WHERE [RouteId] = @RouteId and [StopId] = @StopId
end
else
  if @insupddelflag = 'D'
  begin
  delete from [dbo].[RouteDetails] where routeid = @RouteId and StopId = @StopId  
  end

declare @sid int
declare @Var2 int
declare @sstopno int
declare @Vstopno2 int
declare @distance decimal

DECLARE db_cursor CURSOR FOR  
SELECT distinct stopid,stopno from [dbo].[RouteDetails] where routeid = @RouteId order by stopno


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @sid,@sstopno  

WHILE @@FETCH_STATUS = 0  
BEGIN  

 declare Cursor2 CURSOR for 
    SELECT distinct stopid,stopno from [dbo].[RouteDetails] where routeid = @RouteId order by stopno

	OPEN Cursor2 
     Fetch Next From Cursor2 into @Var2,@Vstopno2;

     While @@Fetch_Status=0

				Begin
					if @Vstopno2 > @sstopno 
                    begin
--					begin
--					Fetch Next From Cursor2 into @Var2;
--					continue;
--					end

                    begin
						begin try
							select @distance = distancefromnextstop from routedetails where stopid = @sid and nextstopid = @Var2
						end try
						begin catch
							set @distance = 0;
						end catch
                    end
					select @cnt = count(1) from [dbo].[RouteStops] where fromstopid = @sid and tostopid = @Var2 and RouteId = @RouteId           

					if @cnt = 0 
					INSERT INTO [dbo].[RouteStops]
						   ([RouteId]
						   ,[FromStopId]
						   ,[ToStopId]
						   ,distance)
					 VALUES
						   (@RouteId
						   ,@sid
						   ,@Var2
						   ,@distance)
					end
						   Fetch Next From Cursor2 into @Var2,@Vstopno2;
					
				End

			Close Cursor2;

		DeAllocate Cursor2;
       

       FETCH NEXT FROM db_cursor INTO @sid,@sstopno  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor 


end

/****** Object:  StoredProcedure [dbo].[InsUpdDelRoles]    Script Date: 07/01/2016 16:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelRoles](@Id int,@Name varchar(50)
,@Description varchar(50) = null,@Active int = 1
,@IsPublic int = 1)
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @oldDescription  varchar(250)
declare @oldActive int
declare @oldIsPublic int

select @oldname = name, @oldDescription = Description, @oldactive = active from types where Id = @Id

update roles 
set Name = @name,
Description = @Description,
Active = @Active,
IsPublic = @IsPublic
where id = @Id
exec InsEditHistory 'roles ','Name', @Name,'roles  updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @oldDescription <> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null	
if @oldIsPublic <> @IsPublic
exec InsEditHistoryDetails @edithistoryid,@oldIsPublic,@IsPublic,'Modication','IsPublic',null			

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		





if @@rowcount = 0
begin
insert into Roles (Name,[Description],Active,IsPublic) 
values(@Name,@Description,@Active,@IsPublic)
  
  exec InsEditHistory 'roles','Name', @Name,'roles Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@IsPublic,'Insertion','IsPublic',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null


end

end



GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDashboardDetails]
(@userid int = -1, @roleid int = -1)
as
begin
--
--get btpos details
SELECT distinct top 6  b.[Id]
     -- ,[GroupId]
      ,c.Name as company
      ,[POSID]
      ,[StatusId]
      ,t.Name as [status]
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,u.FirstName + ' '+ u.LastName as fleetowner
      ,u.Id as fleetownerid
  FROM [dbo].[BTPOSDetails] b
 left outer join Types t on t.Id = b.StatusId
 left outer  join Company c on b.CompanyId = c.Id  
  left outer  join Users u on u.Id = b.FleetOwnerId
where (u.Id = @userid or @userid = -1)

--get license details
--get alerts
select top 6 t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName,
t2.LastName
 from Alerts t1
 inner join Users t2 on t2.Id=t1.UserId
 
--get notifications

select top 6 t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName,
t2.LastName
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId

end

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelUserRoles]    Script Date: 07/18/2016 12:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[InsUpdDelUserRoles](
@Id int,
@roleid int,
@UserId int,
@CompanyId int = null,
@insupdflag varchar
)
as
begin

declare @cnt int

select @cnt = count(*) from UserRoles where [UserId] = @UserId and [roleid] = @roleid

if @insupdflag = 'I'
begin
if @cnt = 0
INSERT INTO [dbo].[UserRoles]
           ([UserId]
           ,[RoleId]
           ,[CompanyId])
     VALUES
           (@UserId
           ,@RoleId
           ,@CompanyId)
    end
 else
   if @insupdflag = 'U'
 begin
UPDATE [dbo].[UserRoles]
  SET [UserId] = @UserId
     ,[RoleId] = @RoleId
     ,[CompanyId] = @CompanyId
  WHERE Id = @Id
 end
 else

if @insupdflag = 'D'
 begin
delete from [UserRoles] where [UserId] = @UserId and RoleId = @roleid and CompanyId  = @CompanyId

end

end

Go


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

create procedure [dbo].[InsUpdUsers](
@FirstName varchar(40)
,@LastName varchar(40)
,@MiddleName varchar(40) = ''
,@EmpNo varchar(15)
,@Email varchar(40) = ''
,@AdressId int
,@MobileNo varchar(50) = ''
,@RoleId int
,@cmpId int
,@Active int
,@UserName varchar(30)  = null
,@Password varchar(30)  = ''
,@insupdflag varchar(10)
,@ManagerId int = null
,@userid int = -1)
 as begin
 
 declare @currid int
 declare @cnt int
 declare @logincnt int
 declare @ulogincnt int
 declare @edithistoryid int
 declare @dt datetime
set @dt = GETDATE()
declare @fc varchar(10)
 declare @flogincnt int

 if @insupdflag = 'I'
 begin
 
 select @cnt = COUNT(*)  from Users where UPPER(EmpNo) = @EmpNo
 
 select @logincnt = COUNT(*) from userlogins where upper(logininfo) = UPPER(@username) 
 
 if @cnt > 0
 RAISERROR ('User already exists',16,1);
 
  
 if @cnt = 0 
 begin
	insert into Users(FirstName,LastName,MiddleName, EmpNo,Email,AddressId,MobileNo,Active,CompanyId,ManagerId)
	values(@FirstName,@LastName,@MiddleName, @EmpNo,@Email,@AdressId,@MobileNo,@Active,@cmpId,@ManagerId) 
  
  --insert into edit history
	exec InsEditHistory 'Users', 'Name',@FirstName,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@FirstName,'Insertion','First Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@LastName,'Insertion','Last Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@EmpNo,'Insertion','EmpNo',null
    exec InsEditHistoryDetails @edithistoryid,null,@Email,'Insertion','Email',null

 
   SELECT @currid = SCOPE_IDENTITY()
 end
  
  if @logincnt > 0
	RAISERROR ('Already user login exists',16,1);
 
		-- insert user role
		exec InsUpdDelUserRoles -1,@RoleId, @currid, @cmpId,'I' 
   if @logincnt = 0 
   begin

			   --check if it is normal user or fleet owner. for fleet owner we have different logic
			   if @RoleId = 6 
			   begin
			     
							 set @fc = case when (select COUNT(*) from fleetowner) = 0
													   then '1' 
													   else (select ltrim(rtrim(STR((max(Id)+1)))) from fleetowner ) 
													   end  

							

							----the login will be assigned once the user buys the license. this is for testing
							--select @flogincnt = COUNT(*) from userlogins where upper(logininfo) = 'FL00'+@fc

							-- if @flogincnt = 0
							--   begin
							--	insert into userlogins(logininfo,PassKey,active,userid)values('FL00'+@fc,'FL00'+@fc,1,@currid)
							--   end
			   end
			   else
			    if  @UserName is not null
				insert into userlogins(logininfo,PassKey,active,userid)values(@UserName,@Password,1,@currid)
			   
      end
    
end
 else
 
 begin
 
 SELECT @currid = @userid
 
 update Users 
 set FirstName = @FirstName,
 LastName = @LastName,
 MiddleName = @MiddleName,
 Email = @Email,
 MobileNo = @MobileNo, 
 Active = @Active 
 --ManagerId = @ManagerId 
 where id = @userid
 
-- insert user role
		exec InsUpdDelUserRoles -1,@RoleId, @currid, @cmpId,'I'
 
 select @logincnt = COUNT(*) from userlogins where  userid = @userid
 
 
 if @logincnt = 0 
   begin

			   --check if it is normal user or fleet owner. for fleet owner we have different logic
			   if @RoleId = 6 
			   begin
			      
							 set @fc = case when (select COUNT(*) from fleetowner) = 0
													   then '1' 
													   else (select ltrim(rtrim(STR((max(Id)+1)))) from fleetowner ) 
													   end  

							

							--the login will be assigned once the user buys the license. this is for testing
							select @flogincnt = COUNT(*) from userlogins where upper(logininfo) = 'FL00'+@fc

							 if @flogincnt = 0
							   begin
								insert into userlogins(logininfo,PassKey,active,userid)values('FL00'+@fc,'FL00'+@fc,1,@currid)
							   end
			   end
			   else
			    if @UserName is not null
				insert into userlogins(logininfo,PassKey,active,userid)values(@UserName,@Password,1,@currid)
			   
      end
 
 else
 begin
 --check if updation causes duplicates
 select @ulogincnt = COUNT(*) from userlogins where upper(logininfo) = UPPER(@username) and userid <> @userid
 
 if @ulogincnt = 0
 	update userlogins
	set logininfo = @UserName
	,PassKey = @Password
	,active = @active
	where userid = @currid
else
 RAISERROR ('User login already exists',16,1);

 end

 
 end --end of 'i' check
 
 --if role is fleet owner then insert the code into fleet owner table
 
 declare @fcnt int
 
 if @RoleId = 6
 begin
 
 select @fcnt = COUNT(*) from FleetOwner where UserId = @currid
 
			 if @fcnt = 0 
				INSERT INTO [dbo].[FleetOwner]
					   ([UserId]
					   ,[CompanyId]
					   ,[Active]
					   ,[FleetOwnerCode])
				 VALUES
					   (@currid
						,@cmpId
					   ,1
					   ,@EmpNo)
								
				else
					UPDATE [dbo].[FleetOwner]
						SET 
						[CompanyId] = @cmpId
						,[Active] = 1
						,[FleetOwnerCode] = @EmpNo
					 WHERE [UserId] = @currid
 
 end
 
 end
 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidateCredentials](@logininfo varchar(50) = null, @passkey varchar(50) = null)
as
begin

select logininfo,firstname, lastname,u.Id,firstname+' '+lastname as uname ,r.Name as RoleName,ur.roleid,u.CompanyId,FO.UserId
from userlogins ul 
inner join users u on 
u.id = ul.userid
left outer join UserRoles ur on ur.UserId=u.Id
left outer join roles r on r.id = ur.roleid
left outer join FleetOwner FO on FO.UserId=u.Id
where LoginInfo=@logininfo and [PassKey]=@passkey

end



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[InsUpdDelZipCode](@Id NUMERIC(20),
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getVehicleDetails]
as
begin
select * from VehicleDetails
end

GO
/****** Object:  StoredProcedure [dbo].[InsupdDelInventoryItem]    Script Date: 08/08/2016 18:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsupdDelInventoryItem]
(@Id int,
@ItemName varchar(50),
@Code varchar(50),
@Description varchar(50) = null,
@CategoryId int,
@SubCategoryId int,
@ReOrderPoint int)
as 
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldItemName varchar(50)
declare @oldCode varchar(50)
declare @oldDescription varchar(50)
declare @oldSubCategoryId int
declare @oldReOrderPoint int

UPDATE [dbo].[InventoryItem]
   SET [ItemName] = @ItemName
      ,[Code] = @Code
      ,[Description] = @Description
      ,[CategoryId] = @CategoryId
      ,[SubCategoryId] = @SubCategoryId
      ,[ReOrderPoint] = @ReOrderPoint
 WHERE Id = @Id
     exec InsEditHistory 'InventoryItem','Name', @ItemName,'InventoryItem updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

       if @ItemName <> @ItemName
     exec InsEditHistoryDetails @edithistoryid,@oldItemName,@ItemName,'Modication','ItemName',null		

       if @Code <> @Code
     exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		

       if @Description <> @Description
     exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		
        
        if @SubCategoryId <> @SubCategoryId
     exec InsEditHistoryDetails @edithistoryid,@oldSubCategoryId,@SubCategoryId,'Modication','SubCategoryId',null		

       if @ReOrderPoint <> @ReOrderPoint
     exec InsEditHistoryDetails @edithistoryid,@oldReOrderPoint,@ReOrderPoint,'Modication','ReOrderPoint',null		

       
if @@rowcount = 0 
begin
insert into InventoryItem
(ItemName,Code,
 [Description],
  CategoryId,
  SubCategoryId,
  ReOrderPoint)
  values
 (@ItemName,
  @Code,
  @Description,
  @CategoryId,
  @SubCategoryId,
  @ReOrderPoint)

            exec InsEditHistory 'InventoryItem','Name', @ItemName,'InventoryItem Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@ItemName,'Insertion','ItemName',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
            exec InsEditHistoryDetails @edithistoryid,null,@CategoryId,'Insertion','CategoryId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SubCategoryId,'Insertion','SubCategoryId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ReOrderPoint,'Insertion','ReOrderPoint',null







end

end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFleetBtpos] 
	-- Add the parameters for the stored procedure here
	(@cmpId int=-1, @fleetOwnerId int = -1)
AS
BEGIN
SELECT fb.[Id]
      ,[VehicleId]
      ,[FromDate]
      ,[ToDate]
      ,[BTPOSId]
      ,bt.POSID
      ,fd.VehicleRegNo
  FROM [dbo].[FleetBtpos] fb
  inner join fleetdetails fd on fd.id = fb.vehicleid
  inner join BTPOSDetails bt on bt.id = fb.btposid
 where ((fd.companyid = @cmpId or @cmpId = -1)
  and (fd.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1))

	
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetfleetRoutes] 	
(@routeid int =-1, @fleetownerId int = -1, @cmpId int = -1)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT fr.[Id]
      ,fr.[VehicleId]
      ,fr.[RouteId]
      ,fd.VehicleRegNo
      ,t.name vehicleType
      ,t.Id as VehicleTypeId
      ,r.RouteName
      ,[EffectiveFrom]
      ,[EffectiveTill]
      ,[RouteName]
  FROM [dbo].[FleetRoutes] fr
  inner join FleetDetails fd on fd.Id = fr.VehicleId
  inner join Routes r on r.Id = fr.RouteId
  inner join types t on t.id = fd.vehicletypeid
  where ((@routeid = -1 or fr.RouteId = @routeid)
and (fd.CompanyId = @cmpid or @cmpId = -1)
and (fd.fleetownerid = @fleetownerId or @fleetownerId = -1))

END

GO
/****** Object:  StoredProcedure [dbo].[InsupddelFleetDetails]    Script Date: 07/23/2016 09:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[InsupddelFleetDetails]
 (@Id int,
 @VehicleRegNo varchar(15)
           ,@VehicleTypeId int
           ,@FleetOwnerId int
           ,@CompanyId int
           ,@ServiceTypeId int
           ,@VehicleLayoutId int
           ,@Active int
           ,@EngineNo varchar(50) = null
           ,@FuelUsed varchar(50) = null
           ,@MonthAndYrOfMfr datetime = null
           ,@ChasisNo varchar(50) = null
           ,@SeatingCapacity int = 0
           ,@DateOfRegistration datetime = null
           ,@insupdflag varchar(1)
           )
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleRegNo varchar(15)
declare @oldVehicleTypeId int

declare @oldServiceTypeId int

if @insupdflag = 'I'
begin

	INSERT INTO [dbo].[FleetDetails]
           ([VehicleRegNo]
           ,[VehicleTypeId]
           ,[FleetOwnerId]
           ,[CompanyId]
           ,[ServiceTypeId]
           ,[LayoutTypeId]
           ,[Active]
           ,[EngineNo]
           ,[FuelUsed]
           ,[MonthAndYrOfMfr]
           ,[ChasisNo]
           ,[SeatingCapacity]
           ,[DateOfRegistration])
           
     VALUES
           (@VehicleRegNo 
           ,@VehicleTypeId 
           ,@FleetOwnerId 
           ,@CompanyId 
           ,@ServiceTypeId 
           ,@VehicleLayoutId
           ,@Active 
           ,@EngineNo 
           ,@FuelUsed
           ,@MonthAndYrOfMfr
           ,@ChasisNo
           ,@SeatingCapacity 
           ,@DateOfRegistration)

--insert into edit history
	exec InsEditHistory 'FleetDetails', 'Name',@VehicleRegNo,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleRegNo,'Insertion','VehicleRegNo',null
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleTypeId,'Insertion','VehicleTypeId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@ServiceTypeId ,'Insertion','ServiceTypeId',null

end
else
if @insupdflag = 'U'
begin
select @oldVehicleRegNo = VehicleRegNo, @oldVehicleTypeId = VehicleTypeId, @oldServiceTypeId=ServiceTypeId from FleetDetails where Id = @Id
update [dbo].[FleetDetails]
set
[VehicleRegNo] = @VehicleRegNo 
,[VehicleTypeId] = @VehicleTypeId 
,[FleetOwnerId] = @FleetOwnerId 
,[CompanyId] = @CompanyId 
,[ServiceTypeId] = @ServiceTypeId
,[LayoutTypeId] = @VehicleLayoutId
,[Active] = @Active
,[EngineNo] = @EngineNo 
,[FuelUsed] = @FuelUsed
,[MonthAndYrOfMfr] = @MonthAndYrOfMfr
,[ChasisNo] = @ChasisNo
,[SeatingCapacity] = @SeatingCapacity 
,[DateOfRegistration] = @DateOfRegistration
where Id = @Id

exec InsEditHistory 'FleetDetails', 'Name',@VehicleRegNo,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output

if @oldVehicleRegNo <> @VehicleRegNo
exec InsEditHistoryDetails @edithistoryid,@oldVehicleRegNo,@VehicleRegNo,'Modication','VehicleRegNo',null		

if @oldVehicleTypeId <> @VehicleTypeId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleTypeId,@VehicleTypeId,'Modication','VehicleTypeId',null		

           

if @oldServiceTypeId <> @ServiceTypeId
exec InsEditHistoryDetails @edithistoryid,@oldServiceTypeId,@ServiceTypeId,'Modication','ServiceTypeId',null		



end
end





Go


/****** Object:  Table [dbo].[FleetOwnerRouteStop]    Script Date: 05/02/2016 16:31:56 ******/
SET ANSI_NULLS ON

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetFleetAvailability]
(@cmpId int=-1, @fleetOwnerId int = -1)
as
begin
SELECT fa.[Id]
      ,fd.VehicleRegNo
      ,[VehicleId]
      ,[FromDate]
      ,[ToDate]
      ,u.firstname + ' ' + u.lastname as FleetOwner
  FROM [dbo].[FleetAvailability] FA
  inner join fleetdetails fd on fd.id = FA.vehicleid
  inner join FleetOwner  fo on fo.Id = fd.FleetOwnerId
  inner join users u on u.id = fo.UserId
 where ((fd.companyid = @cmpId or @cmpId = -1)
  and (fd.fleetownerid = @fleetOwnerId or @fleetOwnerId = -1))

end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFleetOwnerRouteStop]
AS
BEGIN
		
SELECT [FleetOwnerId]
      ,[RouteStopId]
      ,[Id]
  FROM [dbo].[FleetOwnerRouteStop]

end
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 07/18/2016 15:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelFleetOwnerRouteFare](
           @routeId int
		   ,@FromStopId int
		   ,@ToStopId int
           ,@VehicleTypeId int
           ,@Distance decimal
           ,@PerUnitPrice decimal
           ,@Amount decimal
           ,@FareTypeId int
           ,@Active int
            ,@FromDate datetime = null
           ,@ToDate datetime = null
           ,@VehicleId int
           --,@InsUpdDelFlag varchar(1)
)                        
as
begin
declare @fsId int
set @fsId = 0

select @fsId = Id from RouteStops 
where fromstopid = @FromStopId 
and tostopid = @ToStopid
and routeId = @routeId

UPDATE [dbo].[FleetOwnerRouteFare]
   SET [VehicleTypeId] = @VehicleTypeId
      ,[Distance] = @Distance
      ,[PerUnitPrice] = @PerUnitPrice
      ,[Amount] = @Amount
      ,[FareTypeId] = @FareTypeId
      ,[Active] = @Active
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[VehicleId] = @VehicleId
 WHERE [FORouteStopId] = @fsId
 
 if @@rowcount  = 0 
 begin
 INSERT INTO [dbo].[FleetOwnerRouteFare]
           ([FORouteStopId]
           ,[VehicleTypeId]
           ,[Distance]
           ,[PerUnitPrice]
           ,[Amount]
           ,[FareTypeId]
           ,[Active]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId])
     VALUES
           (@fsId
           ,@VehicleTypeId
           ,@Distance
           ,@PerUnitPrice
           ,@Amount
           ,@FareTypeId
           ,@Active
           ,@FromDate
           ,@ToDate
           ,@VehicleId)
           
        end   
         end  
           
           
/*
if @InsUpdDelFlag = 'I' 
begin
if @fsId = 0 
INSERT INTO [dbo].[FleetOwnerRouteFare]
           ([FORouteStopId]
           ,[VehicleTypeId]
           ,[Distance]
           ,[PerUnitPrice]
           ,[Amount]
           ,[FareTypeId]
           ,[Active]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId])
     VALUES
           (@fsId
           ,@VehicleTypeId
           ,@Distance
           ,@PerUnitPrice
           ,@Amount
           ,@FareTypeId
           ,@Active
           ,@FromDate
           ,@ToDate
           ,@VehicleId)

end
else
if @InsUpdDelFlag = 'U' 
UPDATE [dbo].[FleetOwnerRouteFare]
   SET [VehicleTypeId] = @VehicleTypeId
      ,[Distance] = @Distance
      ,[PerUnitPrice] = @PerUnitPrice
      ,[Amount] = @Amount
      ,[FareTypeId] = @FareTypeId
      ,[Active] = @Active
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[VehicleId] = @VehicleId
 WHERE [FORouteStopId] = @fsId

else
if @InsUpdDelFlag = 'D' 
DELETE FROM [dbo].[FleetOwnerRouteFare]
      WHERE [FORouteStopId] = @fsId
*/





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFleetOwnerRouteFare]
AS
BEGIN
	
SELECT [Id]
      ,[FORouteStopId]
      ,[VehicleTypeId]
      ,[Distance]
      ,[PerUnitPrice]
      ,[Amount]
      ,[FareTypeId]
      ,[Active]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
  FROM [dbo].[FleetOwnerRouteFare]


end
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 05/07/2016 11:08:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CompanyId] [int] NULL
) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteFare]    Script Date: 05/02/2016 16:34:55 ******/
SET ANSI_NULLS ON

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetFleetOwnerRoute]
(@cmpId int = -1, @fleetownerId int = -1)
AS
BEGIN
	
SELECT distinct
      fr.[Id],
      fr.[FleetOwnerId],
      fr.[CompanyId],
      r.routename,
      r.code,
      r.[Id] RouteId,
      [FromDate],
      [ToDate],
      fr.[Active]
      ,case when fr.FleetOwnerId is null then 0 else 1 end assigned
      --,0 assigned
  FROM [routes] r
left outer join [dbo].[FleetOwnerRoute] fr 
on r.id = fr.routeid and  (fr.fleetownerid = @fleetownerId or @fleetownerId = -1)
order by RouteName


end



GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getFleetOwner]
as
begin

SELECT U.[Id]
      ,U.[FirstName]
      ,U.[LastName]      
      ,U.[EmpNo]
      ,U.[Email]
      ,U.[AddressId]
      ,U.[MobileNo]    
      ,U.[Active]
      ,U.[MiddleName]
      ,mgr.Firstname + ' ' +mgr.LastName as mgrName
      ,mgr.Id
      ,ul.logininfo as UserName
      ,ul.passkey as [Password]            
      ,c.name as [Company]
	  ,u.FirstName+' '+u.LastName as Name
	  ,FO.FleetOwnerCode
      ,FO.CompanyId     
  FROM [dbo].[Users] U
  inner join FleetOwner FO on U.Id = FO.UserId
  inner join company c on (U.companyid = c.id)
  left outer join Users mgr on mgr.id = U.managerid
  left outer join dbo.userlogins ul on ul.userid = U.id      

end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFare]
(@srcId int,@destId int, @btposid varchar(10),@routeid int)
as
begin

select distinct amount from fleetbtpos fp 
inner join btposdetails pos
on pos.id = fp.btposid
inner join foroutefare vf on vf.vehicleid = fp.vehicleid
where vf.sourceid = @srcId and vf.destinationid = @destId 
and vf.routeid = @routeid


end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelFares](@Id int,@FromStop varchar(50),@ToStop varchar(50),@Fare varchar(50),@Active varchar(50),@RouteId varchar(50),@Name varchar(50))
as
begin
insert into Fares values(@Id,@FromStop,@ToStop,@Fare,@Active,@RouteId,@Name)
end



/****** Object:  StoredProcedure [dbo].[Sp_InsTypeGroups]    Script Date: 05/04/2016 11:24:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_InsTypeGroups](@Id int,@Name varchar(50),@Description varchar(50) =null,@Active int)
as
begin
insert into TypeGroups (Name,[Description],Active) values(@Name,@Description,@Active)
end

GO
/****** Object:  StoredProcedure [dbo].[getCompanyRoles]    Script Date: 05/04/2016 11:37:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getCompanyRoles]
(@cmpId int)
as
begin
select cr.[Id]
,cr.[RoleId]
,cr.[CompanyId] 
,c.Name company
,r.name as rolename
,r.description
from [CompanyRoles] cr
inner join Roles R on R.Id=cr.RoleId
inner join Company c on c.Id=cr.CompanyId
where cr.CompanyId = @cmpId

end
GO

/****** Object:  StoredProcedure [dbo].[GetNotifications]    Script Date: 05/05/2016 18:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetNotifications]

as begin 
select t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName+' '+t2.LastName as Name
 from Notifications t1
 inner join Users t2 on t2.Id=t1.UserId
end

GO
/****** Object:  StoredProcedure [dbo].[GetAlerts]    Script Date: 05/05/2016 18:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetAlerts]

as begin 
select t1.Id,
t1.Date,
t1.Message,
t1.MessageTypeId,
t1.StatusId,
t1.UserId,
t1.Name,
t2.FirstName+' '+t2.LastName as Username

 from Alerts t1
 inner join Users t2 on t2.Id=t1.UserId
                        
                         
                     
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCategories]
@typegrpid int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.Id, t.Name, t.[Description],t.Active,  TypeGroupId, listkey, listvalue
	 from [Types] t 
	  where t.TypeGroupId = 2
	  
	 -- SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 --from [Types] t
	 --inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	 -- where tg.Id=30
	 -- select I.InventoryId,I.Name,I.Code,I.
	 -- [Description],I.AvailableQty,tg.Name as Category,t.TypeGroupId as SubCategoryId,I.PerUnitPrice,I.ReorderPont,I.Active from Inventory I inner join TypeGroups tg on tg.Id=I.InventoryId
  --   inner join Types t on t.Id=I.InventoryId
END

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSubCategory]    Script Date: 07/29/2016 12:16:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelSubCategory]
(@Id int,@Name varchar(50),@Description varchar(50) = null,@CategoryId int,@Active int)
as
begin

declare @dt datetime
set @dt = GETDATE()

declare @cnt int
declare @edithistoryid int
declare @oldname varchar(50)
declare @olddesc varchar(250)
declare @oldactive int
select @oldname = name, @olddesc = description, @oldactive = active from types where Id = @Id



if @@rowcount = 0 
begin
insert into subcategory(Name,[Description],CategoryId,Active) values(@Name,@Description,@CategoryId,@Active)

 exec InsEditHistory 'subcategory','Name', @Name,'subcategory Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@Name,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null
end

else
begin
update subcategory 
set name=@Name
,Active = @Active
,Description = @Description
,CategoryId = @CategoryId
where Id = @Id

exec InsEditHistory 'subcategory','Name', @Name,'subcategory updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldname <> @Name
exec InsEditHistoryDetails @edithistoryid,@oldname,@Name,'Modication','Name',null		

if @olddesc <> @Description
exec InsEditHistoryDetails @edithistoryid,@olddesc,@Description,'Modication','Description',null		

if @oldactive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldactive,@Active,'Modication','Active',null		

end

end



/****** Object:  StoredProcedure [dbo].[InsupdCreateFleetOwner]    Script Date: 07/18/2016 12:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsupdCreateFleetOwner]
	-- Add the parameters for the stored procedure here
	(@Id int,
           @FirstName varchar(30),
           @LastName varchar(30)
           ,@Email varchar(30)
           ,@MobileNo varchar(30)
           ,@CompanyName varchar(30)
           ,@Description varchar(30) = null,
           @insupdflag varchar(10),@CompanyGroupId int=-1)
           
AS 
BEGIN
declare @currid int
 declare @cnt int 
set @cnt = 0
declare @cmpcnt int
set @cmpcnt = 0
 declare @fleetcnt int
set @fleetcnt = 0
 declare @edithistoryid int

declare @cmpid int
set @cmpid = 0
declare @dt datetime
set @dt = GETDATE()
 
 declare @fc varchar(10) 
 set @fc = case when (select COUNT(*) from fleetowner) = 0
                           then '1' 
                           else (select ltrim(rtrim(STR((max(Id)+1)))) from fleetowner ) 
                           end  
 
 
 select @cnt=COUNT (*) from Users where upper(FirstName)=upper(@FirstName) and upper(lastname) = upper(@LastName)
 select @cmpcnt=COUNT (*) from Company where UPPER (Name)=upper(@CompanyName)
 select @fleetcnt=COUNT (*) from FleetOwner where UPPER (FleetOwnerCode)=@fc

 	
 if @cmpcnt=0
 begin
  insert into Company 
           ([Name]
           ,[Code]
           ,[Desc]
           ,[Active])      
     VALUES
           (@CompanyName,@CompanyName,@Description,1)
           
     --insert into edit history
	exec InsEditHistory 'Company', 'Name',@FirstName,'Company creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@CompanyName,'Insertion','CompanyName',null
    exec InsEditHistoryDetails @edithistoryid,null,@cnt,'Insertion','cnt',null
    exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
          
           
           set @cmpid = SCOPE_IDENTITY()
 end
 else
 begin  
   SELECT @cmpid = Id from Company where UPPER (Name)=@CompanyName
   
 end
   
 
 
 if @insupdflag='I' and @cnt>0
 begin
 begin
 RAISERROR ('Already user exists',16,1);
 end
 
 if @cnt=0
 begin
 
   insert into Users (FirstName,
   LastName,MiddleName, EmpNo,Email,AddressId,MobileNo,Active,CompanyId)
   values(@FirstName,@LastName,null,'FL00'+@fc,@Email,null,@MobileNo,1,@cmpid) 
          
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--insert into edit history
	exec InsEditHistory 'Users', 'Name',@FirstName,'User creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
	
    exec InsEditHistoryDetails @edithistoryid,null,@FirstName,'Insertion','First Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@LastName,'Insertion','Last Name',null
    exec InsEditHistoryDetails @edithistoryid,null,@cmpid,'Insertion','cmpid',null
    exec InsEditHistoryDetails @edithistoryid,null,@Email,'Insertion','Email',null
	
	SELECT @currid = SCOPE_IDENTITY()
end

	

   
   --insert company role for company and fleet owner role
  exec  InsUpdDelCompanyRoles 1,-1,6,@cmpid,0 
    end             
 if @insupdflag='I'and @fleetcnt>0
 begin
	RAISERROR ('Already FleetOwner exists',16,1);
 end
 
 if @fleetcnt=0
 begin
	insert into FleetOwner (UserId,CompanyId,FleetOwnerCode,Active) values(@currid,@cmpid,'FL00'+@fc,1)
 end

--assign fleet owner role to user
exec [InsUpdDelUserRoles] -1,6,@currid,@cmpid,'I'

--declare @logincnt int

----the login will be assigned once the user buys the license. this is for testing
--select @logincnt = COUNT(*) from userlogins where upper(logininfo) = 'FL00'+@fc

-- if @logincnt = 0
--   begin
--	insert into userlogins(logininfo,PassKey,active,userid)values('FL00'+@fc,'FL00'+@fc,1,@currid)
--   end
   --insert into edit history

end


GO

/****** Object:  Table [dbo].[LicensePricing]    Script Date: 05/25/2016 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LicensePricing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseId] [int] NOT NULL,
	[RenewalFreqTypeId] [int] NOT NULL,
	[RenewalFreq] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[fromdate] [datetime] NULL,
	[todate] [datetime] NULL,
	[Active] [int] NULL CONSTRAINT [DF_LicensePricing_Active]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO

/****** Object:  Table [dbo].[LicenseDetails]    Script Date: 05/10/2016 06:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LicenseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseTypeId] [int] NOT NULL,
	[FeatureTypeId] [int] NOT NULL,
	[FeatureLabel] [varchar](50)  NULL,
	[FeatureValue] [nchar](10)  NULL,
	[LabelClass] [varchar](50)  NULL,
	[Active] [int] NOT NULL CONSTRAINT [DF_LicenseDetails_Active]  DEFAULT ((1)),
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO

/****** Object:  Table [dbo].[RouteStops]    Script Date: 05/31/2016 08:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[FromStopId] [int] NOT NULL,
	[ToStopId] [int] NOT NULL,
	[distance] [decimal](18, 0) NOT NULL CONSTRAINT [DF_RouteStops_distance]  DEFAULT ((0))
) ON [PRIMARY]



/****** Object:  StoredProcedure [dbo].[InsUpdDelRoutes]    Script Date: 07/01/2016 17:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsUpdDelRoutes](
@Id int
,@RouteName varchar(50)
,@Description varchar(50) = null
,@Active int
,@Code varchar(10)
,@SourceId int
,@DestinationId int
,@Distance decimal
)
as
begin

declare @routeid int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldRouteName varchar(50)
declare @oldCode varchar(250)
declare @oldDescription varchar(50)
declare @oldActive int
declare @oldSourceId int
declare @oldDestinationId int


select @oldRouteName = RouteName, @oldCode = Code, @oldActive = Active from Routes where Id = @Id

UPDATE [dbo].[Routes]
   SET [RouteName] = @RouteName
      ,[Code] = @Code
      ,[Description] = @Description
      ,[Active] = @Active
      ,[SourceId] = @SourceId
      ,[DestinationId] = @DestinationId
      ,[Distance] = @Distance
 WHERE Id = @Id
 exec InsEditHistory 'Routes','Name', @RouteName,'Type updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldRouteName <> @RouteName
exec InsEditHistoryDetails @edithistoryid,@oldRouteName,@RouteName,'Modication','RouteName',null		

if @oldCode <> @Code
exec InsEditHistoryDetails @edithistoryid,@oldCode,@Code,'Modication','Code',null		

if @oldDescription <> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		

if @oldActive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldActive,@Active,'Modication','Active',null		

if @oldSourceId <> @SourceId
exec InsEditHistoryDetails @edithistoryid,@oldSourceId,@SourceId,'Modication','SourceId',null		

if @oldDestinationId <> @DestinationId
exec InsEditHistoryDetails @edithistoryid,@oldDestinationId,@DestinationId,'Modication','DestinationId',null		





if @@rowcount = 0 
begin

INSERT INTO [dbo].[Routes]
           ([RouteName]
           ,[Code]
           ,[Description]
           ,[Active]
           ,[SourceId]
           ,[DestinationId]
           ,[Distance])
     VALUES
           (@RouteName
           ,@Code
           ,@Description
           ,@Active
           ,@SourceId
           ,@DestinationId
           ,@Distance)
           
		   select @routeid = @@IDENTITY

            exec InsEditHistory 'Routes','Name', @RouteName,'Routes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@RouteName,'Insertion','RouteName',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Code,'Insertion','Code',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
            exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SourceId,'Insertion','SourceId',null
			exec InsEditHistoryDetails @edithistoryid,null,@DestinationId,'Insertion','DestinationId',null
	        exec InsEditHistoryDetails @edithistoryid,null,@Distance,'Insertion','Distance',null

--insert the source stop
INSERT INTO [dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
           ,[StopNo])
     VALUES
           (
			@routeid
           ,@SourceId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,1
          )

--insert the destination stop
INSERT INTO [dbo].[RouteDetails]
           ([RouteId]
           ,[StopId]
           ,[DistanceFromSource]
           ,[DistanceFromDestination]
           ,[DistanceFromPreviousStop]
           ,[DistanceFromNextStop]
           ,[PreviousStopId]
           ,[NextStopId]
		   ,[StopNo])
     VALUES
           (
			@routeid
           ,@DestinationId
           ,@Distance
           ,@Distance
           ,@Distance
           ,@Distance
           ,@SourceId
           ,@DestinationId
           ,2
          )

          INSERT INTO [dbo].[RouteStops]
           ([RouteId]
           ,[FromStopId]
           ,[ToStopId]
           ,distance)
     VALUES
           (@routeid
           ,@SourceId
           ,@DestinationId
           ,@Distance)
     
end
end

GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetLicenseDetails]
@ltypeId int = -1
as begin 
SELECT ld.[Id]
      ,[LicenseTypeId]
      ,t.name [FeatureName]
      ,t.id FeatureTypeId
      ,[FeatureLabel]
      ,[FeatureValue]
      ,[LabelClass]
      ,ld.[Active]
      ,[fromDate]
      ,[toDate]
  FROM [dbo].[LicenseDetails] ld
  inner join Types t on t.id = ld.featuretypeid
  where ([LicenseTypeId] = @ltypeId or @ltypeId = -1)
end
GO




/****** Object:  StoredProcedure [dbo].[GetLicensePricing]    Script Date: 05/11/2016 09:34:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetLicensePricing]
(@categoryid int = -1)
as 
begin 

SELECT lp.[Id]
      ,[LicenseId]
	  ,LicenseType
      ,[RenewalFreqTypeId]
      ,[RenewalFreq]
      ,[UnitPrice]
      ,[fromdate]
      ,[todate]
      ,t.Name as licensefreq
      , case when t.id = 15 then 'Every' +str(lp.renewalfreq)+ ' Week(s)'
		 when t.id = 16 then 'Every' +str(lp.renewalfreq)+ ' Month(s)'
		 when t.id = 17 then 'Every' +str(lp.renewalfreq)+ ' Quarter(s)'
		 when t.id = 18 then 'Every' +str(lp.renewalfreq)+ ' Half Year(s)'
        else 'Every'+str(lp.renewalfreq)+' year(s)'
       end as freq
  FROM [dbo].[LicensePricing] lp
inner join types t on t.id = lp.renewalfreqtypeid
 inner join licensetypes lt on lt.id = lp.licenseid
 where (lt.LicenseCatId = @categoryid or @categoryid = -1)


end


/****** Object:  StoredProcedure [dbo].[InsUpdDelLicensePricing]    Script Date: 07/18/2016 16:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelLicensePricing](
@Id int = -1,
@LicenseId int,
@RenewalFreqTypeId int,
@RenewalFreq int,
@UnitPrice decimal(18,0),
@fromdate datetime = null,
@todate datetime = null,
@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[LicensePricing]
           ([LicenseId]
           ,[RenewalFreqTypeId]
           ,[RenewalFreq]
           ,[UnitPrice]
           ,[fromdate]
           ,[todate])
     VALUES
           (@LicenseId
           ,@RenewalFreqTypeId
           ,@RenewalFreq
           ,@UnitPrice
           ,@fromdate
           ,@todate
          )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[LicensePricing]
   SET [RenewalFreqTypeId] = @RenewalFreqTypeId
      ,[RenewalFreq] = @RenewalFreq
      ,[UnitPrice] = @UnitPrice
      ,[fromdate] = @fromdate
      ,[todate] = @todate
      --,[Active] = @Active
 WHERE licenseId = @LicenseId
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[LicensePricing]
      WHERE licenseId = @LicenseId

end
end


Go

/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 08/08/2016 18:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelLicenseDetails](
@Id int = -1,
@LicenseTypeId int,
@FeatureTypeId int,
@FeatureLabel varchar(30),
@FeatureValue varchar(10),
@LabelClass varchar(50) = null,
@fromdate datetime = null,
@todate datetime = null,
@insupddelflag char
)
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldFeatureTypeId int
declare @oldFeatureLabel varchar(30)
declare @oldFeatureValue varchar(10)
declare @oldLabelClass varchar(50)
declare @oldfromDate datetime
declare @oldtoDate datetime
if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[LicenseDetails]
           ([LicenseTypeId]
           ,[FeatureTypeId]
           ,[FeatureLabel]
           ,[FeatureValue]
           ,[LabelClass]           
           ,[fromDate]
           ,[toDate])
     VALUES
           (@LicenseTypeId
           ,@FeatureTypeId
           ,@FeatureLabel
           ,@FeatureValue
           ,@LabelClass           
           ,@fromDate
           ,@toDate
          )
           exec InsEditHistory 'LicenseDetails','Name', @LicenseTypeId,'LicenseDetails Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@LicenseTypeId,'Insertion','LicenseTypeId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@FeatureTypeId,'Insertion','FeatureTypeId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@FeatureLabel,'Insertion','FeatureLabel',null
  
            exec InsEditHistoryDetails @edithistoryid,null,@FeatureValue,'Insertion','FeatureValue',null			
			exec InsEditHistoryDetails @edithistoryid,null,@LabelClass,'Insertion','LabelClass',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@fromDate,'Insertion','fromDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@toDate,'Insertion','toDate',null
          
          
          end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[LicenseDetails]
   SET [FeatureLabel] = @FeatureLabel
      ,[FeatureValue] = @FeatureValue
      ,[LabelClass] = @LabelClass
      ,[fromDate] = @fromDate
      ,[toDate] = @toDate
 WHERE [LicenseTypeId] = @LicenseTypeId and [FeatureTypeId] = @FeatureTypeId
 
 
   exec InsEditHistory 'LicenseDetails','Name', @FeatureTypeId,'LicenseDetails updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

      if @FeatureTypeId <> @FeatureTypeId
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureTypeId,@FeatureTypeId,'Modication','FeatureTypeId',null		

      if @FeatureLabel <> @FeatureLabel
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureLabel,@FeatureLabel,'Modication','@FeatureLabel',null		

      if @FeatureValue <> @FeatureValue
    exec InsEditHistoryDetails @edithistoryid,@oldFeatureValue,@FeatureValue,'Modication','@FeatureValue',null	
 
       if @LabelClass <> @LabelClass
    exec InsEditHistoryDetails @edithistoryid,@oldLabelClass,@LabelClass,'Modication','@LabelClass',null		

      if @fromDate <> @fromDate
    exec InsEditHistoryDetails @edithistoryid,@oldfromDate,@fromDate,'Modication','@fromDate',null		

      if @oldtoDate <> @oldtoDate
    exec InsEditHistoryDetails @edithistoryid,@oldtoDate,@oldtoDate,'Modication','@oldtoDate',null		
 
 
 
 	
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[LicenseDetails]
      WHERE [LicenseTypeId] = @LicenseTypeId and [FeatureTypeId] = @FeatureTypeId
end
end





Go

Create PROCEDURE [dbo].[VehicleConfiguration]	
	@needRoutes int =0,
	@needRoles int =0,		
	@needvehicleRegno int = 0,
	@needvehicleType int = 0,    
    @needServiceType int = 0,
    @needfleetowners int =0,
    @needCompanyName int = 0,
    @needVehicleLayout int = 0, 
    @needHireVehicle int =0,   
    @needbtpos int = 0,
    @cmpId int = -1,
    @fleetownerId int = -1,
    @needFleetOwnerRoutes int = -1
AS
BEGIN

	
	if @needRoutes  = 1
	select routename,ID,Code from routes order by routename
		
	if @needRoles  = 1 
	select name,ID from Roles order by name
	
	if @needvehicleRegno  = 1
    select VehicleRegNo,Id from FleetDetails
    where ((fleetownerid = @fleetownerId or @fleetownerid =-1)
    and (CompanyId = @cmpId or @cmpId = -1))
    order by VehicleRegNo
    
	--vehicle type data
	if @needvehicleType = 1
	select Name, Id from Types where TypeGroupId = 4 order by Name
	
	--service type data
	if @needServiceType = 1
	select Name, Id from Types where TypeGroupId = 5 order by Name
	
	--fleet owners
	if @needfleetowners = 1
	select u.FirstName+' '+u.LastName as Name,
	c.Name as CompanyName
	,FO.FleetOwnerCode
	,FO.CompanyId
	,FO.Id
	,FO.UserId
	 from FleetOwner FO
	inner join Users u on  u.Id = FO.UserId
	inner join Company c on c.Id = FO.companyId
    where (FO.companyId = @cmpId or @cmpId =-1)
	order by u.FirstName,u.LastName
	
	--companys
	if @needCompanyName = 1
	select Name,Id from Company order by Name
	
	--vehicle layout type
	if @needVehicleLayout = 1
	select Name, Id from Types where TypeGroupId = 6 order by Name
	
	if @needbtpos = 1		
SELECT b.[Id]
      ,b.POSID            
      ,[IMEI]
      ,[ipconfig]
      ,b.[active]
      ,fleetownerid
  FROM [dbo].[BTPOSDetails] b
  where (fleetownerid = @fleetownerId or @fleetownerid =-1)
order by POSID

if @needHireVehicle = 1
select VehicleRegNo,Id from FleetDetails
    where ((fleetownerid = @fleetownerId or @fleetownerid =-1) 
    and (servicetypeId = 11))
	order by VehicleRegNo
	
	if @needFleetOwnerRoutes = 1
	SELECT 
      fr.[Id]
      ,fr.[FleetOwnerId]
      ,fr.[CompanyId]
      ,r.routename
      ,r.code
      ,r.[Id] RouteId
      ,src.name Source
      ,dest.name Destination
      ,[FromDate]
      ,[ToDate]
      ,fr.[Active]     
  FROM routes r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
inner join [dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId
order by routename
	
END


GO


CREATE PROCEDURE [dbo].[GetFleetStaff]
	-- Add the parameters for the stored procedure here
	(@fleetowner int = -1, @cmpId int = -1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT fs.[Id]
      ,fs.[RoleId]
      ,[UserId]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
      ,FD.VehicleRegNo
      ,u.FirstName + ' ' +u.LastName as UserName
      ,r.Name as rolename
  FROM [dbo].[FleetStaff] FS
      inner join FleetDetails FD on FD.Id = FS.vehicleId
      inner join Users u on fs.UserId=u.id
inner join Roles r on r.Id = FS.Roleid
where ((FD.FleetOwnerId = @fleetowner or @fleetowner = -1)
 and (FD.CompanyId = @cmpId or @cmpId  = -1))

END
Go
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetStaff]    Script Date: 06/30/2016 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsUpdDelFleetStaff]
@Id int = -1,
@RoleId int,
@UserId int,
@VehicleId int,
@cmpId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldUserId int
declare @oldCompanyId int
declare @oldRoleId int


if @insupddelflag = 'I'
begin
select @cnt = count(1) from [dbo].[FleetStaff] 
where vehicleid = @vehicleid 
and userid = @userid and roleid = @roleid

if @cnt = 0 
select @oldVehicleId = VehicleId, @oldUserId = UserId, @oldRoleId=RoleId from FleetStaff where Id = @Id
begin
INSERT INTO [dbo].[FleetStaff]
           ([RoleId]
           ,[UserId]
           ,[FromDate]
           ,[ToDate]
           ,[VehicleId]
           ,[CompanyId])
     VALUES
           (@RoleId
           ,@UserId
           ,@FromDate
           ,@ToDate
           ,@VehicleId
           ,@cmpId)
         exec InsEditHistory 'FleetStaff','Name', @VehicleId,'FleetStaff Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@UserId,'Insertion','UserId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@RoleId,'Insertion','RoleId',null
  
           
           
           
           
end
end

  if @insupddelflag = 'U'
begin
UPDATE [dbo].[FleetStaff]
   SET [RoleId] = @RoleId
      ,[UserId] = @UserId
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[VehicleId] = @VehicleId
      ,[CompanyId] = @cmpId
 WHERE Id = @Id


exec InsEditHistory 'FleetStaff','Name', @VehicleId,'FleetStaff updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @VehicleId <> @VehicleId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		

if @UserId <> @UserId
exec InsEditHistoryDetails @edithistoryid,@oldUserId,@UserId,'Modication','UserId',null		

if @RoleId <> @RoleId
exec InsEditHistoryDetails @edithistoryid,@oldRoleId,@RoleId,'Modication','RoleId',null		
		
end

else
 if @insupddelflag = 'D'
 begin
  delete from [dbo].[FleetStaff]
where vehicleid = @VehicleId 
and userid = @UserId 
and companyid = @cmpid
and roleid = @roleid
end

End


GO
/****** Object:  Table [dbo].[VehicleLayout]    Script Date: 05/21/2016 23:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleLayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleLayoutTypeId] [int] NOT NULL,
	[RowNo] [int] NOT NULL,
	[ColNo] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[label] [varchar](10)  NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF   
    

	SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserRoles]	
(@companyId int = -1)
AS
BEGIN
	
SELECT distinct users.[Id]
      ,[FirstName]+ ' '+[LastName] username
      ,[RoleId]
      ,r.Name as rolename
      ,c.name as [companyname]
     ,c.Id as companyId
  FROM [dbo].[Users]  
  inner join userroles ur on ur.userid = users.id 
  inner join Roles r on r.Id = Ur.RoleId 
  inner join company c on c.id = ur.companyid
  where (c.id = @companyId or   @companyId = -1)    

END


GO

/****** Object:  Table [dbo].[LicenseTypes]    Script Date: 05/22/2016 06:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LicenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseCatId] [int] NOT NULL,
	[LicenseType] [varchar](50)  NOT NULL,
	[Description] [varchar](500)  NULL,
	[Active] [int] NOT NULL CONSTRAINT [DF_LicenseTypes_Active]  DEFAULT ((1)),
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


Create PROCEDURE [dbo].[GetLicenseTypes]
(@licenseCategoryId int =-1)
AS
BEGIN
	SELECT lt.[Id]
      ,[LicenseCatId]
      ,[LicenseType]
      ,lt.[Description]
      ,t.Name as licenseCategory
	  ,lt.[Active]
  FROM [dbo].[LicenseTypes] lt
inner join Types t on t.Id = licensecatid
  where ([LicenseCatId] = @licenseCategoryId or @licenseCategoryId = -1)
END


GO
/****** Object:  StoredProcedure [dbo].[InsUpdLicenseTypes]    Script Date: 07/29/2016 16:28:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsUpdLicenseTypes] 
(@Id int = -1
,@LicenseCatId int
,@LicenseType varchar(50)
,@Description varchar(500) = null
,@Active int = 1)	
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()


declare @edithistoryid int
declare @oldLicenseType varchar(50)
declare @oldDescription varchar(500)
declare @oldActive int
select @oldLicenseType = LicenseType, @oldActive = Active, @oldDescription = Description from LicenseTypes where Id = @Id


if @@rowcount = 0
begin
INSERT INTO [dbo].[LicenseTypes]
           ([LicenseCatId]
           ,[LicenseType]
           ,[Description]
           ,[Active])
     VALUES
           (@LicenseCatId
           ,@LicenseType
           ,@Description
           ,@Active)
           
           exec InsEditHistory 'LicenseTypes','Name', @LicenseType,'LicenseTypes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@LicenseType,'Insertion','LicenseType',null			
			exec InsEditHistoryDetails @edithistoryid,null,@Active,'Insertion','Active',null
			exec InsEditHistoryDetails @edithistoryid,null,@Description,'Insertion','Description',null
end
else
begin
	UPDATE [dbo].[LicenseTypes]
   SET [LicenseCatId] = @LicenseCatId
      ,[LicenseType] = @LicenseType
      ,[Description] = @Description
      ,[Active] = @Active
	WHERE Id = @Id
	end
exec InsEditHistory 'LicenseTypes','Name', @LicenseType,'LicenseTypes updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @oldLicenseType <> @LicenseType
exec InsEditHistoryDetails @edithistoryid,@oldLicenseType,@LicenseType,'Modication','LicenseType',null		

if @oldDescription<> @Description
exec InsEditHistoryDetails @edithistoryid,@oldDescription,@Description,'Modication','Description',null		

if @oldActive <> @Active
exec InsEditHistoryDetails @edithistoryid,@oldActive,@Active,'Modication','Active',null			
	




END


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetRoutes]    Script Date: 07/18/2016 15:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsUpdDelFleetRoutes]
@Id int = -1,
@VehicleId int,
@routeid int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldrouteid int
--declare @oldFromDate datetime
--declare @oldToDate datetime

if @insupddelflag = 'I'
begin

select @cnt = count(1) from [dbo].[FleetRoutes] 
where vehicleid = @VehicleId 
and routeid = @routeid

if @cnt = 0 
begin
INSERT INTO [dbo].[FleetRoutes]
           ([VehicleId]
           ,[RouteId]
           ,[EffectiveFrom]
           ,[EffectiveTill])
     VALUES
           (@VehicleId
           ,@routeid
           ,@FromDate
           ,@ToDate)
            exec InsEditHistory 'FleetRoutes','Name', @VehicleId,'FleetRoutes Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@routeid,'Insertion','routeid',null
			--exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
   --         exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null


           
end
end
else
  if @insupddelflag = 'U'
  begin
select @oldVehicleId = VehicleId, @oldrouteid = routeid from FleetRoutes where Id = @Id


UPDATE [dbo].[FleetRoutes]
   SET [RouteId] = @routeid      
      ,[EffectiveFrom] = @FromDate
      ,[EffectiveTill] = @ToDate      
 WHERE vehicleid = @VehicleId
 
 
 exec InsEditHistory 'FleetRoutes','Name', @VehicleId,'FleetRoutes updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           
end
if @oldVehicleId <> @VehicleId
begin
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		
end
if @oldrouteid <> @routeid
begin
exec InsEditHistoryDetails @edithistoryid,@oldrouteid ,@routeid ,'Modication','routeid',null		
end
--if @oldFromDate <> @FromDate
--exec InsEditHistoryDetails @edithistoryid,@oldFromDate,@FromDate,'Modication','FromDate',null		

--if  @oldToDate <>  @ToDate
--exec InsEditHistoryDetails @edithistoryid,@oldToDate ,@ToDate ,'Modication','ToDate ',null		

else
if @insupddelflag = 'D'
begin
  delete from [dbo].[FleetRoutes]
where vehicleid = @VehicleId and routeid = @routeid

End
End



GO

/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetBTPOS]    Script Date: 08/06/2016 15:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[InsUpdDelFleetBTPOS]
@Id int = -1,
@VehicleId int,
@btposId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin
declare @dt datetime
set @dt = GETDATE()
declare @cnt  int
set @cnt = -1
declare @edithistoryid int
declare @oldVehicleId int
declare @oldBTPOSId int
declare @oldToDate int
declare @oldFromDate int

if @insupddelflag = 'I'
begin
select @cnt = count(1) from [dbo].[FleetBTPOS] 
where vehicleid = @VehicleId 
and  BTPOSId = @btposId
end
if @cnt = 0 
begin
INSERT INTO [dbo].[FleetBtpos]
           ([VehicleId]
           ,[FromDate]
           ,[ToDate]
           ,[BTPOSId])
     VALUES
           (@VehicleId
           ,@FromDate
           ,@ToDate
           ,@btposId)
             exec InsEditHistory 'FleetBtpos','Name', @VehicleId,'FleetBtpos Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@BTPOSId,'Insertion','BTPOSId',null
			 exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
  
           
end
else
  if @insupddelflag = 'U'
begin
UPDATE [dbo].[FleetBtpos]
   SET [BTPOSId] = @btposId      
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
     WHERE [VehicleId] = @VehicleId
     
     exec InsEditHistory 'FleetBtpos','Name', @VehicleId,'FleetBtpos updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @VehicleId <> @VehicleId
exec InsEditHistoryDetails @edithistoryid,@oldVehicleId,@VehicleId,'Modication','VehicleId',null		

if @btposId  <> @btposId 
exec InsEditHistoryDetails @edithistoryid,@oldbtposId ,@btposId ,'Modication','btposId ',null		

if @FromDate <> @FromDate
exec InsEditHistoryDetails @edithistoryid,@oldFromDate,@FromDate,'Modication','FromDate',null

if @ToDate  <> @ToDate
exec InsEditHistoryDetails @edithistoryid,@oldToDate ,@ToDate ,'Modication','ToDate ',null		
		
    end  
else
  if @insupddelflag = 'D'
  begin
  delete from [dbo].[FleetBtpos]
where vehicleid = @VehicleId 
and [BTPOSId] = @btposId

End
End



GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalesOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderNum] [nvarchar](15) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[itemId] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO



--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE procedure [dbo].[GetSalesOrder]

--as begin 
--SELECT so.[Id]
--      ,[SalesOrderNum]
--      ,[TransactionId]
--      ,[Date]
--      ,[amount]
--      ,[item]
--      ,[Quantity]
--      ,t.name Status
--      ,i.ItemName
--  FROM [dbo].[SalesOrder] so
--  inner join Types t on t.Id = so.Status
--  inner join InventoryItem i on i.Id = so.item


       
--end



--GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTposRoutes] 
	-- Add the parameters for the stored procedure here
	(@vehicleId int=-1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT v.[Id]
     ,[VehicleRegNo]
    -- ,vt.[Name] as VehicleType,
      --lt.Name AS vehiclelayout,
      -- st.Name as ServiceType,
     --  ,u.FirstName +' '+u.LastName as FleetOwnerName 
     -- ,c.[Name] as CompanyName
      ,r.[RouteName] as RouteName
      ,bt.[Id]
      ,bt.[POSID]
      
      ,v.[Active]
      
      
     FROM [dbo].[FleetDetails]v
  inner join BTPOSDetails bt on bt.Id=v.FleetOwnerId
    inner join Routes r on r.Id=v.FleetOwnerId 
   -- inner join Users u on u.Id = f.UserId
   -- inner join FleetOwnerRoute fo on fo.Id=f.Id 
	 where  (v.Id= @vehicleId or @vehicleId = -1)
   
    -- Insert statements for procedure here

END

/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRoutes]    Script Date: 07/18/2016 15:30:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsUpdDelFleetOwnerRoutes]
@Id int = -1,
@RouteId int,
@cmpId int,
@fleetOwnerId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1

declare @rsId int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldFleetOwnerId int
declare @oldRouteId int


if @insupddelflag = 'I'
begin
select @cnt = count(1) from [dbo].[FleetOwnerRoute] 
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId
end
if @cnt = 0 
begin
INSERT INTO [dbo].[FleetOwnerRoute]
           ([FleetOwnerId]
           ,[CompanyId]
           ,[RouteId]
           ,[FromDate]
           ,[ToDate])
     VALUES
           (@fleetOwnerId
           ,@cmpId
           ,@RouteId
           ,@FromDate
           ,@ToDate)
 exec InsEditHistory 'FleetOwnerRoute','Name', @FleetOwnerId,'Type Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','Name',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
--insert record into FleetOwnerRouteStop
 SELECT @rsId = rs.[Id]
  FROM [dbo].[RouteStops] rs
  inner join routes r on (rs.routeid = r.id
  and rs.fromstopid = r.[SourceId]
      and rs.tostopid = [DestinationId])
  where r.[Id] = @routeid
end
if @rsId is not null 
 begin
   INSERT INTO [dbo].[FleetOwnerRouteStop]
           ([FleetOwnerId]
           ,[RouteStopId])
     VALUES
           (@fleetOwnerId,@rsId) 
end

declare @stopscnt int
declare @srcstopid int
declare @deststopid int

  select @srcstopid = sourceid from routes where id = @routeid
select @deststopid = destinationid from routes where id = @routeid

select @stopscnt = count(*) from fleetownerstops where fleetownerid = @fleetOwnerId
and routeid = @routeid and stopid = @srcstopid

if @stopscnt = 0 
begin
INSERT INTO [dbo].[FleetOwnerStops]
           ([FleetOwnerId]
           ,[RouteId]
           ,[StopId])
     VALUES
           (@fleetOwnerId
           ,@RouteId
           ,@srcstopid)

end

select @stopscnt = count(*) from fleetownerstops where fleetownerid = @fleetOwnerId
and routeid = @routeid and stopid = @deststopid

if @stopscnt = 0 
begin
INSERT INTO [dbo].[FleetOwnerStops]
           ([FleetOwnerId]
           ,[RouteId]
           ,[StopId])
     VALUES
           (@fleetOwnerId
           ,@RouteId
           ,@deststopid)
 

end
else
  if @insupddelflag = 'U'
  begin
  select @oldfleetOwnerId = fleetOwnerId, @oldRouteId = RouteId  from FleetOwnerRoute where Id = @Id


UPDATE [dbo].[FleetOwnerRoute]
   SET [FromDate] = @FromDate
      ,[ToDate] = @ToDate
 WHERE [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId
     
     
exec InsEditHistory 'FleetOwnerRoute','Name', @fleetOwnerId,'FleetOwnerRoute updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           
end
if @fleetOwnerId <> @fleetOwnerId
begin
exec InsEditHistoryDetails @edithistoryid,@fleetOwnerId,@fleetOwnerId,'Modication','fleetOwnerId',null		
end
else
if @RouteId <> @RouteId
begin
exec InsEditHistoryDetails @edithistoryid,@oldRouteId,@RouteId,'Modication','RouteId',null		
 end
else
if @insupddelflag = 'D'
begin
  delete from [dbo].[FleetOwnerRoute]
where [FleetOwnerId] = @fleetOwnerId
and  [RouteId] = @RouteId

--remove all the FleetOwnerRouteStop references for the route

delete from [dbo].[FleetOwnerRouteStop] 
where id in (
select fs.id from [dbo].[FleetOwnerRouteStop] fs
inner join [RouteStops] rs on rs.id = fs.RouteStopId
where [FleetOwnerId] = @fleetOwnerId
and rs.RouteId = @RouteId
)


delete from fleetownerstops where routeid = @routeid and fleetownerid = @fleetOwnerId

delete from FORouteFleetSchedule where routeid = @routeid  and fleetownerid = @fleetOwnerId

end


End

GO

CREATE TABLE [dbo].[PaymentHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Desc] [int] NOT NULL,
	[InventoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ReceivedOn] [datetime] NOT NULL,
	[TransactionId] [int] NOT NULL,
	[TransactionType] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPaymentHistory]

as begin 
SELECT * from PaymentHistory

       
end


GO
Go
create procedure [dbo].[GetFOVehicleFareConfig]
(@vehicleid int, @routeId int)
as
begin

SELECT [VehicleId]
      ,[Id]
      ,[RouteId]
      ,[Amount]
      ,[PricingTypeId]
      ,[FromDate]
      ,[ToDate]
      ,[UnitPrice]
      ,[SourceId]
      ,[DestinationId]
  FROM [dbo].[FORouteFare]
  where vehicleid = @vehicleid and RouteId = @routeId

SELECT distinct
      src.name Src
      ,src.Id FromStopId
	  ,dest.name Dest
	  ,dest.Id ToStopId
	  ,f.[FORouteStopId]
      ,[VehicleTypeId]
      ,r.[Distance]
      ,[PerUnitPrice]
      ,[Amount]
      ,[FareTypeId]
      --,[Active]
      ,[FromDate]
      ,[ToDate]
      ,[VehicleId]
     
  FROM [dbo].fleetownerroutestop fs    
  inner join routestops r on r.id = fs.routestopid
  inner join stops src on src.id =r.fromstopid
  inner join stops dest on dest.id =r.tostopid
  left outer join [FleetOwnerRouteFare] f on (fs.routestopid = f.foroutestopid and f.vehicleid = @vehicleid)
where r.routeId = @routeId
order by src.Id 

end


/****** Object:  StoredProcedure [dbo].[GetLicensePageDetails]    Script Date: 06/03/2016 10:09:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetLicensePageDetails]
(@catId int = -1)
as
begin

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[LicenseCatId]
      ,[LicenseType]
      ,[Description]
      ,[Active]
  FROM [dbo].[LicenseTypes]
  where (LicenseCatId = @catId or @catId = -1)
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 ld.[Id]
      ,[LicenseTypeId]
      ,t.Id FeatureTypeId
      ,t.name [FeatureName]
      ,[FeatureLabel]
      ,[FeatureValue]
      ,[LabelClass]
      ,ld.[Active]
      ,[fromDate]
      ,[toDate]
  FROM [dbo].[LicenseDetails]ld
  inner join Types t on t.id = ld.featuretypeid
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 lp.[Id]
      ,[LicenseId]
      ,t.name [RenewalFreqType]
      ,t.id [RenewalFreqTypeId]
      ,[RenewalFreq]
      ,[UnitPrice]
      ,[fromdate]
      ,[todate]
      ,lp.[Active]
  FROM [dbo].[LicensePricing] lp
  inner join Types t on t.id = lp.renewalFreqTypeId
  
  end


Go


Create PROCEDURE [dbo].[GetFleetOwnerRouteAssigned]
(@fleetownerId int)
AS
BEGIN
	
SELECT 
      fr.[Id],
      fr.[FleetOwnerId],
      fr.[CompanyId],
      r.routename,
      r.code,
      r.[Id] RouteId,
      [FromDate],
      [ToDate],
      fr.[Active]
      ,case when u.id is null then 0 else 1 end assigned
      ,src.name as srcStop
      ,src.id as srcId
      ,dest.name as destStop
      ,dest.Id as destId
      ,r.distance
  FROM routes r
inner join [dbo].[FleetOwnerRoute] fr on r.id = fr.routeid
inner join stops src on src.id = r.SourceId
inner join stops dest on dest.id = r.DestinationId
 inner join fleetowner f on f.id = fr.fleetownerid 
  inner join users u on f.userid = u.id 
  where f.Id = @fleetownerId

end

Go
 
SET ANSI_NULLS ON
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PurchaseOrder](
	[Id] [int] NOT NULL,
	[PONum] [nvarchar](15) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[itemId] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[StatusId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetPurchaseOrder]

as begin 
SELECT po.[Id]
      ,[PONum]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[itemId]
      ,[Quantity]
      ,t.name Status
      ,i.ItemName
  FROM [dbo].[PurchaseOrder] po
  inner join Types t on t.Id = po.StatusId
  inner join InventoryItem i on i.Id = po.itemId
       
end



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetInvoices]

as begin 
SELECT Io.[Id]
      ,[Invoices]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[item]
      ,[Quantity]
      ,t.Name Status
      ,i.ItemName
  FROM [dbo].[Invoices] Io
  inner join Types t on t.Id =Io.Id
  inner join InventoryItem i on i.Id = Io.Id


       
end

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Invoices] [varchar](15) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[item] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


Go

/****** Object:  Table [dbo].[ShippingOrder]    Script Date: 06/07/2016 19:34:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShippingOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShippingOrderNum] [nvarchar](50) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
	[SalesOrderId] [int] NOT NULL
) ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetShippingOrder]

as begin 
SELECT [Id]
      ,[ShippingOrderNum]
      ,[TransactionId]
      ,[Date]
      ,[amount]
      ,[Status]
      ,[SalesOrderId]
  FROM [dbo].[ShippingOrder]

         
end
Go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelVehicleLayout](	
	@VehicleLayoutTypeId int,
	@RowNo int,
	@ColNo varchar(50),
	@VehicleTypeId int,
	@label varchar(10),
	@insupdflag varchar   
)
AS
BEGIN
if @insupdflag = 'I'
begin
INSERT INTO [dbo].[VehicleLayout]
           ([VehicleLayoutTypeId]
           ,[RowNo]
           ,[ColNo]
           ,[VehicleTypeId]
           ,[label]
           )
     VALUES
           (@VehicleLayoutTypeId
           ,@RowNo
           ,@ColNo
           ,@VehicleTypeId
           ,@label)
           
   end

End

/****** Object:  Table [dbo].[WebsiteUserLogin]    Script Date: 06/08/2016 16:10:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[websiteUserLogin](
	[LoginInfo] [nvarchar](50) NOT NULL,
	[PassKey] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nchar](10) NOT NULL,
	[salt] [varchar](50) NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 06/08/2016 16:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[WebsiteValidateCredentials](@logininfo varchar(50) = null, @passkey varchar(50) = null)
as
begin

select logininfo,FirstName, Lastname,u.Id 
from WebsiteUserlogin ul 
inner join WebsiteuserInfo u on 
u.id = ul.UserId

where LoginInfo=@logininfo and [PassKey]=@passkey

end



/****** Object:  Table [dbo].[ResetPassword]    Script Date: 06/07/2016 19:40:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebsiteResetPassword](
	[UserName] [varchar](50) NULL,
	[OldPassword] [varchar](50) NULL,
	[NewPassword] [varchar](50) NULL,
	[ReenterNewPassword] [varchar](50) NULL,
	[Id] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[InsUpdwebsiteresetpassword]    Script Date: 06/07/2016 19:40:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsUpdwebsiteresetpassword]
	-- Add the parameters for the stored procedure here

	@UserName varchar(50)
,@OldPassword varchar(50)
,@NewPassword varchar(50)  
,@ReenterNewPassword varchar(50)  

AS
BEGIN
	UPDATE WebsiteUserInfo
SET Password=@NewPassword where UserName = @UserName
and Password = @OldPassword
UPDATE WebsiteUserlogin
SET Passkey=@NewPassword where Logininfo = @UserName
and Passkey = @OldPassword


END


GO

/****** Object:  Table [dbo].[WebsiteUserregister]    Script Date: 06/08/2016 16:11:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebsiteUserregister](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ConfirmPassword] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[FleetOwnerVehicleLayOut]    Script Date: 06/10/2016 09:17:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FleetOwnerVehicleLayOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleLayoutTypeId] [int] NOT NULL,
	[RowNo] [int] NOT NULL,
	[ColNo] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[label] [varchar](10) NOT NULL,
	[FleetOwnerId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerVehicleLayout]    Script Date: 08/08/2016 17:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsUpdDelFleetOwnerVehicleLayout](	
	@VehicleLayoutTypeId int,
	@RowNo int,
	@ColNo varchar(50),
	@VehicleTypeId int,
	@label varchar(10),
	@FleetOwnerId int,
	@insupdflag varchar (10)   
)
AS
BEGIN
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
if @insupdflag = 'I'
INSERT INTO [dbo].[FleetOwnerVehicleLayout]
           ([VehicleLayoutTypeId]
           ,[RowNo]
           ,[ColNo]
           ,[VehicleTypeId]
           ,[label]
           ,[FleetOwnerId]
           )
     VALUES
           (@VehicleLayoutTypeId
           ,@RowNo
           ,@ColNo
           ,@VehicleTypeId
           ,@label
           ,@FleetOwnerId)
           
--insert into edit history
	exec InsEditHistory 'FleetOwnerVehicleLayout', 'Name',@VehicleLayoutTypeId,'FleetOwnerVehicleLayout creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleLayoutTypeId,'Insertion','VehicleLayoutTypeId',null
    exec InsEditHistoryDetails @edithistoryid,null,@RowNo,'Insertion','RowNo',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@ColNo ,'Insertion','ColNo',null
    exec InsEditHistoryDetails @edithistoryid,null,@VehicleTypeId,'Insertion','VehicleTypeId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@label ,'Insertion','label',null
    exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId ,'Insertion','FleetOwnerId',null
End

Go

/****** Object:  Table [dbo].[FleetOwnerStops]    Script Date: 06/10/2016 22:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetOwnerStops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FleetOwnerId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[StopId] [int] NOT NULL
) ON [PRIMARY]

GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


create procedure [dbo].[GetFleetOwnerRouteDetails]
(@fleetOwnerId int, @routeid int)
as
begin

SELECT r.[Id]
      ,r.routename as routename
	  ,r.code as routecode      
      ,src.name source
      , dest.name dest
  FROM [dbo].[Routes] r
inner join stops src on src.id = r.sourceid
inner join stops dest on dest.id = r.destinationid
where r.Id = @routeid 

SELECT distinct rd.[Id]
      ,r.routename as routename
	  ,r.code as routecode
      ,rd.[RouteId]      
      ,rd.stopid
      ,src.name StopName
      ,src.code StopCode
	  ,[PreviousStopId]
      ,[NextStopId]
      ,prevstops.name prevstop
      ,nextstops.name nextstop
      ,[DistanceFromSource]
      ,[DistanceFromDestination]
      ,[DistanceFromPreviousStop]
      ,[DistanceFromNextStop]   
	  ,[StopNo]
      ,case 
when fos.stopid is null then 0
 else 1 end assigned
  FROM [dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
inner join routes r on r.id = rd.routeid
inner join stops prevstops on prevstops.id =previousstopid
inner join stops nextstops on nextstops.id = nextstopid
left outer join fleetownerstops fos 
on fos.stopid = rd.stopid and (fos.fleetownerid = @fleetownerid and fos.routeid = @routeid)
  where  (rd.routeid = @routeid )
  order by stopno

end

GO


/****** Object:  Table [dbo].[FORouteFleetSchedule]    Script Date: 06/11/2016 05:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FORouteFleetSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[FleetOwnerId] [int] NOT NULL,
	[StopId] [int] NOT NULL,
	[ArrivalHr] [int] NULL,
	[DepartureHr] [int] NULL,
	[Duration] [decimal](18, 0) NULL,
	[ArrivalMin] [int] NULL,
	[DepartureMin] [int] NULL,
	[ArrivalAMPM] [varchar](2) NULL,
	[DepartureAMPM] [varchar](2) NULL,
	[ArrivalTime] [datetime] NULL,
	[DepartureTime] [datetime] NULL,
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Go

/****** Object:  StoredProcedure [dbo].[getFORVehicleSchedule]    Script Date: 07/12/2016 12:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[getFORVehicleSchedule]
(@fleetOwnerId int, @routeid int, @vehicleId int)
as
begin

SELECT distinct 
      rd.stopid
      ,src.name StopName
      ,src.code StopCode	 
	  ,[StopNo]
      ,fs.arrivalhr
      ,fs.arrivalmin
      ,fs.arrivalampm
      ,fs.departurehr
      ,fs.departuremin
      ,fs.departureampm
	  ,fs.ArrivalTime
	  ,fs.DepartureTime
  FROM [dbo].[RouteDetails] rd
  inner join stops src on src.id = rd.stopid
  inner join fleetownerstops fos 
on (fos.stopid = rd.stopid and fos.fleetownerid = @fleetownerid and fos.routeid = @routeid)
left outer join FORouteFleetSchedule fs 
on fs.stopid = fos.stopid and (fs.fleetownerid = @fleetownerid and fs.routeid = @routeid
and fs.vehicleId = @vehicleId)
  where  (rd.routeid = @routeid )
  order by stopno

end


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetAvailability]    Script Date: 07/18/2016 14:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[InsUpdDelFleetAvailability](
@Id int,
@VehicleId int,
@FromDate datetime = null,
@ToDate datetime = null,
@insupddelflag varchar(1)
)
as
begin
declare @cnt int
set @cnt = 0
declare @dt datetime
set @dt = GETDATE()


declare @edithistoryid int
declare @oldVehicleId int
declare @oldFromDate datetime
declare @oldToDate int

if @insupddelflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from FleetAvailability where VehicleId = @VehicleId

			if @cnt = 0 
			begin

			INSERT INTO [dbo].[FleetAvailability]
           ([VehicleId]
           ,[FromDate]
           ,[ToDate])
			VALUES
           (@VehicleId,@FromDate,@ToDate)			
		   --insert into edit history
					exec InsEditHistory 'Company', 'Name',@VehicleId,'FleetAvailability',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null
					exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
					exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
					
			end
	 end
else

   if @insupddelflag = 'U'
		begin
				UPDATE [dbo].[FleetAvailability]
				SET [FromDate] = @FromDate
					,[ToDate] = @ToDate
				 WHERE VehicleId = @VehicleId
				 	--insert into edit history
			--insert into edit history
					exec InsEditHistory 'Company', 'Name',@VehicleId,'FleetAvailability',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output
				           
					exec InsEditHistoryDetails @edithistoryid,null,@oldVehicleId,'Insertion','VehicleId',null
					exec InsEditHistoryDetails @edithistoryid,null,@oldFromDate,'Insertion','FromDate',null
					exec InsEditHistoryDetails @edithistoryid,null,@oldToDate,'Insertion','ToDate',null

		end
   else
	if @insupddelflag = 'D'
	begin
     delete from [dbo].[FleetAvailability]
	 where VehicleId = @VehicleId
end
end


/****** Object:  StoredProcedure [dbo].[InsUpdDelFleetOwnerRouteStops]    Script Date: 08/08/2016 17:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[InsUpdDelFleetOwnerRouteStops]
	-- Add the parameters for the stored procedure here
	@FleetOwnerId int,
	@RouteId int,
	@StopId int,
    @insupddelflag varchar(1)
AS
BEGIN
declare @cnt int
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @insupddelflag = 'I'
	begin

	  select @cnt = count(*) 
	  FROM  [dbo].[FleetOwnerStops]
	  WHERE FleetOwnerId = @FleetOwnerId 
		  and RouteId = @RouteId 
		  and StopId = @StopId

			if @cnt = 0 
			begin
				INSERT INTO [dbo].[FleetOwnerStops]
					   ([FleetOwnerId]
					   ,[RouteId]
					   ,[StopId])
				 VALUES
					   (@FleetOwnerId
					   ,@RouteId
					   ,@StopId)
                  --insert into edit history
	exec InsEditHistory 'FleetOwnerStops', 'Name',@FleetOwnerId,'FleetOwnerStops creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
           
    exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','FleetOwnerId',null
    exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
    
    exec InsEditHistoryDetails @edithistoryid,null,@StopId ,'Insertion','StopId',null
						--insert the fleet owner stops id also
						--for this get all the records with stopid as src for given route and insert the same
						--get all the records with stopid as dest and insert
						declare @sid int
						declare @scnt int

						DECLARE db_cursor CURSOR FOR
						select Id from routestops 
						where  routeid = @RouteId
						and (fromstopid = @StopId or tostopid = @StopId)

						OPEN db_cursor  
						FETCH NEXT FROM db_cursor INTO @sid 

						WHILE @@FETCH_STATUS = 0  
						BEGIN  
						 
								select @scnt = count(1) from [dbo].[FleetOwnerRouteStop]
								where RouteStopId = @sid      

								if @scnt = 0 
								INSERT INTO [dbo].[FleetOwnerRouteStop]
									  ([FleetOwnerId]
										,[RouteStopId])
								 VALUES
									   (@FleetOwnerId
									   ,@sid)
								

							   FETCH NEXT FROM db_cursor INTO @sid
						END  

						CLOSE db_cursor  
						DEALLOCATE db_cursor 

			end

	end
else
	if @insupddelflag = 'D'
	begin
		DELETE FROM [dbo].[FleetOwnerStops]
			  WHERE FleetOwnerId = @FleetOwnerId 
			  and RouteId = @RouteId 
			  and StopId = @StopId

		delete from [dbo].[FleetOwnerRouteStop]
		where FleetOwnerId = @FleetOwnerId 
		and RouteStopId in (select Id from routestops 
		where  routeid = @RouteId
		and (fromstopid = @StopId or tostopid = @StopId))
	end

END






/****** Object:  Table [dbo].[Ex_Availableseats]    Script Date: 06/14/2016 11:15:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Ex_Availableseats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bus_Id] [int] NOT NULL,
	[Bustype] [varchar](50) NOT NULL,
	[From_Time] [varchar](50) NOT NULL,
	[To_Time] [varchar](50) NOT NULL,
	[Availableseats] [int] NOT NULL,
	[Cost] [float] NOT NULL,
	[Sourcename] [varchar](50) NOT NULL,
	[Destinationname] [nvarchar](50) NOT NULL,
	[SourceId] [int] NOT NULL,
	[DestinationId] [int] NOT NULL,
	[Travelsname] [varchar](30) NULL,
	[Duration] [varchar](10) NULL,
 CONSTRAINT [PK_Ex_Availableseats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, 
ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 06/14/2016 11:13:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PassengerDetails](
	[PassengerId] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](30) NOT NULL,
	[Lname] [varchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[Sex] [int] NOT NULL,
	[datetime] [varchar](30) NOT NULL,
	[Pnr_Id] [int] NOT NULL,
	[Pnr_No] [varchar](20) NOT NULL,
	[Identityproof] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Passenge__88915FB01D7B6025] PRIMARY KEY CLUSTERED 
(
	[PassengerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, 
ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 06/14/2016 11:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PaymentDetails](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Number] [varchar](30) NULL,
	[Amount] [bigint] NULL,
	[Paymentmode] [int] NULL,
	[dateandtime] [datetime] NULL,
	[Pnr_Id] [int] NULL,
	[Pnr_No] [varchar](20) NULL,
	[Gateway_transId] [varchar](20) NULL,
	[TransactionStatus] [int] NULL,
 CONSTRAINT [PK__Transact__55433A6B214BF109] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, 
ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO





/****** Object:  Table [dbo].[PnrDetails]    Script Date: 06/14/2016 11:14:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PnrDetails](
	[Pnr_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pnr_No] [varchar](20) NOT NULL,
	[No_Seats] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[dateandtime] [varchar](30) NOT NULL,
	[src] [varchar](30) NULL,
	[dest] [varchar](30) NULL,
	[vehicle_No] [varchar](20) NULL,
	[journeyDate] [varchar](30) NOT NULL,
	[ArrivalTime] [varchar](30) NOT NULL,
	[DeptTime] [varchar](30) NOT NULL,
	[fleetOwnerId] [int] NULL,
	[RouteId] [int] NULL,
	[journeyType] [int] NOT NULL,
	[AuthCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Pnr_Deta__0A9420FF19AACF41] PRIMARY KEY CLUSTERED 
(
	[Pnr_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, 
ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO






/****** Object:  Table [dbo].[PnrToSeats]    Script Date: 06/14/2016 11:14:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PnrToSeats](
	[PnrSeatsID] [int] IDENTITY(1,1) NOT NULL,
	[Pnr_ID] [int] NOT NULL,
	[Pnr_No] [varchar](20) NOT NULL,
	[SeatNo] [varchar](5) NOT NULL,
	[VehicleNo] [varchar](20) NULL,
	[Date] [datetime] NOT NULL,
	[SeatId] [int] NULL,
 CONSTRAINT [PK_OnrToSeats] PRIMARY KEY CLUSTERED 
(
	[PnrSeatsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, 
ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO









/****** Object:  StoredProcedure [dbo].[Getsp_Availableseats]    Script Date: 06/14/2016 11:19:23 
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Getsp_Availableseats]
@Src_Id int,
@Des_Id int
AS
BEGIN
SELECT  [Id]
      ,[Bus_Id]
      ,[Bustype]
      ,[From_Time]
      ,[To_Time]
      ,[Availableseats]
      ,[Cost]
      ,[Sourcename]
      ,[Destinationname]
      ,[SourceId]
      ,[DestinationId]
      ,[Travelsname]
      ,[Duration]
  FROM [dbo].[Ex_Availableseats] where SourceId=@Src_Id and DestinationId=@Des_Id
END

GO








/****** Object:  StoredProcedure [dbo].[sp_InsPassengerDetails]    Script Date: 06/14/2016 11:16:59 
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsPassengerDetails] 
	 
     @Pnr_No varchar(20),@Pnr_Id int,
     @Fname varchar(30),@Lname varchar(30), @Age int, @Sex int,@datetime varchar(30), @Identityproof 
varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PassengerDetails
          (Fname,Lname,Age,Sex,datetime,Pnr_Id,Pnr_No,Identityproof) 
     VALUES 
          (@Fname,@Lname,@Age,@Sex,@datetime,@Pnr_Id,@Pnr_No,@Identityproof) 
END

GO





/****** Object:  StoredProcedure [dbo].[sp_InsPaymentDetails]    Script Date: 06/14/2016 11:17:19 
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsPaymentDetails] 
	 (
      @Transaction_Number varchar(30)=null
      ,@Amount int=null,
      @Paymentmode int=null,@dateandtime datetime=null,@Gateway_transId varchar(20)=null,@Pnr_Id int=null
      ,@Pnr_No varchar(20)=null, @TransactionStatus int
      )
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PaymentDetails
(Transaction_Number,Amount,Paymentmode,dateandtime,Pnr_Id,Pnr_No,Gateway_transId,TransactionStatus) 
     VALUES 
(@Transaction_Number,@Amount,@Paymentmode,@dateandtime,@Pnr_Id,@Pnr_No,@Gateway_transId,@TransactionStatus)  	
END

GO


/****** Object:  StoredProcedure [dbo].[sp_InsPnrDetails]    Script Date: 06/14/2016 11:17:29 
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsPnrDetails] 
	 
      @Pnr_No varchar(20) = null,
      @No_Seats int  = null,
      @cost int  = null,
      @dateandtime varchar(30)=null,
      @src varchar(30)= null,
      @dest varchar(30) = null,
      @vehicle_No varchar(20) = null,
      @journeyDate varchar(30)=null,
      @ArrivalTime varchar(30)=null,
      @DeptTime varchar(30)=null,
      @RouteId int=null,
      @fleetOwnerId int=null,
      @journeyType int,
      @AuthCode varchar(10),
      @LastInsPnrID INT OUTPUT
AS
BEGIN
declare @startId int
	SET NOCOUNT ON
INSERT INTO PnrDetails
          (Pnr_No,No_Seats,cost,dateandtime,src,dest,vehicle_No,journeyDate, ArrivalTime, 
DeptTime,fleetOwnerId,RouteId,journeyType,AuthCode) 
     VALUES 
          (@Pnr_No,@No_Seats,@cost,@dateandtime,@src,@dest,@vehicle_No,@journeyDate, @ArrivalTime, 
@DeptTime,@fleetOwnerId,@RouteId,@journeyType,@AuthCode) 
          
          SELECT @LastInsPnrID = SCOPE_IDENTITY()
         	
END
GO




/****** Object:  StoredProcedure [dbo].[sp_InsPnrToSeats]    Script Date: 06/14/2016 11:17:46 
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsPnrToSeats]
      @Pnr_ID int,
      @Pnr_No varchar(20),@SeatNo varchar(20), @Date varchar(20),@VehicleNo int=null, @SeatId int
      AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO PnrToSeats
          (Pnr_ID,Pnr_No,SeatNo,VehicleNo,Date,SeatId) 
     VALUES 
          (@Pnr_ID,@Pnr_No,@SeatNo,@VehicleNo,@Date,@SeatId)
END

GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FleetOwnerRequest](
	[CurrentSystemInUse] [varchar](50) NOT NULL,
	[howdidyouhearaboutus] [varchar](50) NOT NULL,
	[SentNewProductsEmails] [bit] NOT NULL,
	[Agreetotermsandconditions] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO

/****** Object:  Table [dbo].[FleetOwnerRequestDetails]    Script Date: 06/16/2016 18:21:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FleetOwnerRequestDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[CompanyName] [varchar](20) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[FleetSize] [int] NOT NULL,
	[CompanyEmployeSize] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequest]    Script Date: 07/18/2016 17:22:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InSupdFleetOwnerRequest](
		  
          @CurrentSystemInUse varchar(50),
          @SentNewProductsEmails bit,
      
          @howdidyouhearaboutus varchar(50),
          @Agreetotermsandconditions bit,
           @insupdflag varchar(20)
           )
 
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[FleetOwnerRequest]
          
            ([CurrentSystemInUse]
            ,[SentNewProductsEmails] 
             
           ,[howdidyouhearaboutus] 
          ,[Agreetotermsandconditions]
               )
     VALUES
          (
           @CurrentSystemInUse
       , @SentNewProductsEmails 
        
         ,@howdidyouhearaboutus
         ,@Agreetotermsandconditions
          )
          
   end       
  
          else
  if @insupdflag = 'U' 
  begin
UPDATE [dbo].[FleetOwnerRequest]
   SET
      
     [CurrentSystemInUse] = @CurrentSystemInUse
     ,[SentNewProductsEmails]=@SentNewProductsEmails 
      
     ,[howdidyouhearaboutus]=@howdidyouhearaboutus
     ,[Agreetotermsandconditions]=@Agreetotermsandconditions
      

END
end
/****** Object:  StoredProcedure [dbo].[InSupdFleetOwnerRequestDetails]    Script Date: 07/18/2016 17:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[InSupdFleetOwnerRequestDetails](
		   @FirstName varchar(50),   
           @LastName varchar(50),
           @PhoneNo  varchar(50),
           @EmailAddress varchar(20),
           @CompanyName varchar(20),
           @Description varchar(50) ,
           @Title varchar(20),
           @CompanyEmployeSize int,
           @FleetSize int,         
           @Gender varchar(20),      
           @Address varchar(50),
           @insupdflag varchar(10)
           )
 
AS
BEGIN	
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[FleetOwnerRequestDetails]
           ([FirstName]
           ,[LastName]
           ,[PhoneNo]
           ,[EmailAddress]
           ,[CompanyName]
           ,[Description]
           ,[Title]
           ,[CompanyEmployeSize]
             ,[FleetSize]      
              ,[Gender]        
              ,[Address])
     VALUES
          (@FirstName    
           ,@LastName
          , @PhoneNo
           ,@EmailAddress
           ,@CompanyName
           ,@Description 
           ,@Title
           ,@CompanyEmployeSize 
           ,@FleetSize     
          , @Gender   
          , @Address)
          
  end
  
          else
  if @insupdflag = 'U' 
  begin
UPDATE [dbo].[FleetOwnerRequestDetails]
   SET
      [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[PhoneNo] = @PhoneNo
      ,[EmailAddress] = @EmailAddress
      ,[CompanyName] = @CompanyName
      ,[Description] = @Description
      ,[Title] = @Title
      ,[CompanyEmployeSize] = @CompanyEmployeSize 
      ,[FleetSize] = @FleetSize  
       ,[Gender] = @Gender 
       ,[Address]= @Address

 
END

--[dbo].[InsUpdDelCompany](@active int,@code varchar(50),@desc varchar(50) = null,@Id int,@Name varchar(50),@Address varchar(500),@EmailId varchar(50),
--@ContactNo1 varchar(50),@ContactNo2 varchar(50)= null,@Fax varchar(50)= null,@Title varchar(50)= null,@Caption varchar(50)= null,@Country varchar(50)= null,
--@ZipCode int = null,@State varchar(50),@insupdflag varchar(1),@userid int = -1)

declare 
@cmpcode varchar(10),@empno varchar(10),@cmpid int,@foCount int = 0

select @cmpcode = 'CMP00' + ltrim(rtrim(STR((max(Id)+1)))) from company
select @empno = 'FL00' + ltrim(rtrim(STR((max(Id)+1)))) from users

select @cmpid = id from company where upper(name) = upper(@CompanyName)

if @cmpid is null
exec InsUpdDelCompany 1, @cmpcode, null,-1,@CompanyName,@Address,@EmailAddress,@PhoneNo,null,null,@Title,null,null,null,null,'I',-1

select @cmpid = id from company where upper(name) = upper(@CompanyName)


--exec [InsupdCreateFleetOwner] -1,@FirstName,@LastName,@EmailAddress,@PhoneNo,@CompanyName,@Description,@insupdflag

--create procedure [dbo].[InsUpdUsers](@FirstName varchar(40),@LastName varchar(40),@MiddleName varchar(40) = ''
--,@EmpNo varchar(15),@Email varchar(40) = '',@AdressId int,@MobileNo varchar(50) = '',@RoleId int,@cmpId int,@Active int
--,@UserName varchar(30)  = null,@Password varchar(30)  = '',@insupdflag varchar(10),@ManagerId int = null,@userid int = -1)
select @foCount = COUNT(*) from Users u where u.Email = @EmailAddress

if @foCount > 0 
begin
RAISERROR ('Fleet owner with emailid already exists',16,1); 
end

exec [InsUpdUsers] @FirstName,@LastName,null,@empno,@EmailAddress,0,@PhoneNo,6,@cmpid,1,null,null,'I',null,-1--  @CompanyName,@Description,@insupdflag

select FleetOwnerCode from dbo.FleetOwner f 
inner join Users u on u.Id = f.UserId
where u.FirstName = @FirstName and u.LastName = @LastName

end
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsUpdDelBTPOSRecords]
@Id int = -1,
@POSID int,
@RecordData binary,
@FileName varchar,
@Description varchar,
@CreatedDate datetime = null,
@Downloaded datetime = null,
@LastDownloadtime datetime = null,
@IsDirty int,
@insupddelflag varchar
as
begin

declare @cnt  int
set @cnt = -1

if @insupddelflag = 'I'
begin

select @cnt = count(1) from [dbo].[BTPOSRecords] 
where POSID = @POSID

end
if @cnt = 0 
begin
INSERT INTO [dbo].[BTPOSRecords]
           (
POSID,
RecordData ,
[FileName] ,
Description ,
CreatedDate ,
Downloaded ,
LastDownloadtime ,
IsDirty )

     VALUES
           (@POSID
           ,@RecordData
           ,@FileName
           ,@Description
           ,@CreatedDate
           ,@Downloaded
           ,@LastDownloadtime
           ,@IsDirty)
end
else
  if @insupddelflag = 'U'
begin
UPDATE [dbo].[BTPOSRecords]
   SET [POSID] = @POSID
      ,[RecordData] = @RecordData
      ,[FileName] = @FileName
      ,[Description] = @Description
      ,[CreatedDate] = @CreatedDate
      ,[Downloaded] = @Downloaded 
      ,[LastDownloadtime] = @LastDownloadtime
      ,[IsDirty] = @IsDirty
 WHERE Id = @Id
end
else
 if @insupddelflag = 'D'
 begin
  delete from [dbo].[BTPOSRecords]
where POSID = @POSID
End

End




/****** Object:  Table [dbo].[AlertsConfiguration]    Script Date: 06/20/2016 11:53:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AlertsConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[AlertTypeId] [int] NOT NULL,
	[AlertItems] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[NotificationConfiguration]    Script Date: 06/20/2016 11:55:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NotificationConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[NotificationId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[ValidateFleetOwnerCode]    Script Date: 06/22/2016 18:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateFleetOwnerCode]
	@fleetownercode varchar(10),
	@result int out 
AS
BEGIN
declare @fid int = 0


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	select @fid = id from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	
	if @fid is not null 
	begin	
	select f.id foid, u.id userid, f.FleetOwnerCode from FleetOwner f inner join Users u on f.UserId = u.Id and UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
			
	SELECT [Id]
      ,[UserId]
      ,[FOId]
      ,[LicenseTypeId]
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[Active]
      ,[StatusId]
      ,[RenewFreqTypeId]
    FROM [dbo].[UserLicense] ul
    where ul.foid = @fid
    	
	end
	
    Set @result = @fid    
    -- Insert statements for procedure here
	return @result
END
GO

Create procedure [dbo].[getNotficationConfiguration]
(@roleId int = -1)
as
begin

select a.Id atypeid,r.Name,r.Id as roleid,NotificationId
,t.Name AlertType
,case when a.NotificationId IS null then 0 else 1 end as assigned
 from Types t
left outer join [NotificationConfiguration] a on a.NotificationId = t.Id 
left outer join Roles r on a.RoleId = r.id
where ((r.Id = @roleId or @roleId = -1)
and t.TypeGroupId = 9)


END

GO

/****** Object:  StoredProcedure [dbo].[GetAlertsConfiguration]    Script Date: 06/20/2016 11:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAlertsConfiguration]
(@roleId int = -1)
as
begin

select a.Id atypeid,r.Name,r.Id as roleid,AlertTypeId
,t.Name AlertType
,case when a.AlertTypeId IS null then 0 else 1 end as assigned
 from Types t
left outer join [AlertsConfiguration] a on a.AlertTypeId = t.Id 
left outer join Roles r on a.RoleId = r.id
where ((r.Id = @roleId or @roleId = -1)
and t.TypeGroupId = 8)


END


GO


/****** Object:  Table [dbo].[BTPOSMonitoring]    Script Date: 07/01/2016 09:55:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BTPOSMonitoring](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BTPOSId] [int] NOT NULL,
	[Xcoordinate] [float] NOT NULL,
	[Ycoordinate] [float] NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[SNo] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

GO
/****** Object:  StoredProcedure [dbo].[GetBTPOSMonitoring]    Script Date: 07/01/2016 09:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBTPOSMonitoring]

AS
BEGIN
	
SELECT  
      
          [BTPOSId],
         [Xcoordinate],
         [Ycoordinate],
         [LocationName],
         [SNo],
         [POSID],
         [DateTime]
from  BTPOSMonitoring B 
inner join BTPOSDetails Bd on Bd.ID = B.BTPOSId
end



/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 06/30/2016 18:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelBTPOSMoitoringPage]
(@BTPOSId int,
@Xcoordinate float,
@Ycoordinate float,
@LocationName varchar(500),
@SNo int,
@DateTime datetime)
as
begin
insert into  BTPOSMonitoring 
values(@BTPOSId,
@Xcoordinate,
@Ycoordinate,
@LocationName,
@SNo,
@DateTime
)
end


	 
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 07/15/2016 11:51:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShoppingCart](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Transaction_Num] [varchar](30) NOT NULL,
	[amount] [bigint] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
	[SalesOrderNum] [nvarchar](15) NOT NULL,
	[PaymentMode] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Transactionstatus] [int] NOT NULL,
	[Gateway_transid] [varchar](15) NOT NULL
) ON [PRIMARY]

GO

--SET ANSI_PADDING OFF
--GO

--/****** Object:  StoredProcedure [dbo].[InsUpdDelShoppingCart]    Script Date: 07/02/2016 12:38:52 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[InsUpdDelShoppingCart]
--@Id int,
--@ItemId int,
--@ItemName varchar,
--@UnitPrice money

--as
--begin

--UPDATE [dbo].[Shoppingcart]
--   SET [ItemId] = @ItemId     
--      ,[ItemName] = @ItemName
--      ,[UnitPrice] = @UnitPrice     
-- WHERE Id = @Id


--if @@rowcount = 0 
--begin
--INSERT INTO [dbo].[Shoppingcart]
--           ([ItemId]
--           ,[ItemName]
--           ,[UnitPrice]
--           )
--     VALUES
--           (@ItemId
--           ,@ItemName
--           ,@UnitPrice
--           )
--end

--End


--GO

--/****** Object:  Table [dbo].[shoppingcart]    Script Date: 06/30/2016 18:50:35 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--SET ANSI_PADDING ON
--GO

--CREATE TABLE [dbo].[shoppingcart](
--	[ItemId] [int] NOT NULL,
--	[ItemName] [varchar](50) NOT NULL,
--	[UnitPrice] [money] NOT NULL,
--	[Id] [int] IDENTITY(1,1) NOT NULL
--) ON [PRIMARY]

--GO


--GO


--GO
--/****** Object:  StoredProcedure [dbo].[getCompanies]    Script Date: 06/30/2016 17:06:46 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--create procedure [dbo].[getShoppingCart]
--(@ItemId int =-1)
--as
--begin
--SELECT distinct 
--      [ItemId]
--      ,[ItemName]
--      ,[UnitPrice]
      
--  FROM [dbo].[ShoppingCart] 
  
--  order by [ItemId]
--end


--GO
--
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFleetSchedule]    Script Date: 08/08/2016 18:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[InsUpdDelFORouteFleetSchedule](
@Id int = -1,
@VehicleId int,
@RouteId int,
@FleetOwnerId int,
@StopId int,
@ArrivalHr int,
@DepartureHr int,
@Duration decimal = null,
@ArrivalMin int,
@DepartureMin int,
@ArrivalAMPM varchar(10),
@DepartureAMPM varchar(10),
@arrivaltime datetime = null,
@departuretime datetime = null,
@insupddelflag varchar(1) 
)
as
begin
declare @cnt int
set @cnt = 0
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldVehicleId int
declare @oldRouteId int
declare @oldFleetOwnerId int
declare @oldStopId int
declare @oldArrivalHr int
declare @oldDepartureHr int
declare @oldDuration decimal
declare @oldArrivalMin int
declare @oldDepartureMin int
declare @oldArrivalAMPM varchar(10)
declare @oldDepartureAMPM varchar(10)
declare @oldarrivaltime datetime
declare @olddeparturetime datetime




if @insupddelflag = 'I'
		begin
			--check if already company exists
			select @cnt = count(1) from FORouteFleetSchedule where VehicleId = @VehicleId

			if @cnt = 0 
			begin

			INSERT INTO [dbo].[FORouteFleetSchedule]
           ([VehicleId]
           ,[RouteId]
           ,[FleetOwnerId]
           ,[StopId]
           ,[ArrivalHr]
           ,[DepartureHr]
           ,[Duration]
           ,[ArrivalMin]
           ,[DepartureMin]
           ,[ArrivalAMPM]
           ,[DepartureAMPM]
           ,[arrivaltime]
           ,[departuretime])
			VALUES
           (@VehicleId,@RouteId,
@FleetOwnerId,
@StopId,
@ArrivalHr,
@DepartureHr,
@Duration,
@ArrivalMin,
@DepartureMin,
@ArrivalAMPM,
@DepartureAMPM,
@arrivaltime,
@departuretime)	

            exec InsEditHistory 'FORouteFleetSchedule','Name', @VehicleId,'FORouteFleetSchedule Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@FleetOwnerId,'Insertion','FleetOwnerId',null
            exec InsEditHistoryDetails @edithistoryid,null,@StopId,'Insertion','StopId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@ArrivalHr,'Insertion','ArrivalHr',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@DepartureHr,'Insertion','DepartureHr',null
            exec InsEditHistoryDetails @edithistoryid,null,@Duration,'Insertion','Duration',null
            exec InsEditHistoryDetails @edithistoryid,null,@ArrivalMin,'Insertion','ArrivalMin',null			
			exec InsEditHistoryDetails @edithistoryid,null,@DepartureMin,'Insertion','DepartureMin',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ArrivalAMPM,'Insertion','ArrivalAMPM',null

            exec InsEditHistoryDetails @edithistoryid,null,@DepartureAMPM,'Insertion','DepartureAMPM',null			
			exec InsEditHistoryDetails @edithistoryid,null,@arrivaltime,'Insertion','arrivaltime',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@departuretime,'Insertion','departuretime',null







		
		   
			end
	 end
else

   if @insupddelflag = 'U'
		begin
				UPDATE [dbo].[FORouteFleetSchedule]
				SET --[VehicleId] = @VehicleId
          -- ,[RouteId]=@RouteId
          -- ,[FleetOwnerId]=@FleetOwnerId
          -- ,[StopId]=@StopId
           [ArrivalHr]=@ArrivalHr 
           ,[DepartureHr]=@DepartureHr
           ,[Duration]=@Duration
           ,[ArrivalMin]=@ArrivalMin
           ,[DepartureMin]=@DepartureMin
           ,[ArrivalAMPM]=@ArrivalAMPM
           ,[DepartureAMPM]=@DepartureAMPM
           ,[arrivaltime]=@arrivaltime
           ,[departuretime]=@departuretime
				 WHERE VehicleId = @VehicleId
				 and [RouteId]=@RouteId
				 and [FleetOwnerId]=@FleetOwnerId
				 and [StopId]=@StopId
				 
				 if @@ROWCOUNT = 0
				 INSERT INTO [dbo].[FORouteFleetSchedule]
           ([VehicleId]
           ,[RouteId]
           ,[FleetOwnerId]
           ,[StopId]
           ,[ArrivalHr]
           ,[DepartureHr]
           ,[Duration]
           ,[ArrivalMin]
           ,[DepartureMin]
           ,[ArrivalAMPM]
           ,[DepartureAMPM]
           ,[arrivaltime]
           ,[departuretime])
			VALUES
           (@VehicleId,@RouteId,
@FleetOwnerId,
@StopId,
@ArrivalHr,
@DepartureHr,
@Duration,
@ArrivalMin,
@DepartureMin,
@ArrivalAMPM,
@DepartureAMPM,
@arrivaltime,
@departuretime)	

exec InsEditHistory 'FORouteFleetSchedule','Name', @FleetOwnerId,'FORouteFleetSchedule updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

if @FleetOwnerId <> @FleetOwnerId
exec InsEditHistoryDetails @edithistoryid,@oldFleetOwnerId,@FleetOwnerId,'Modication','FleetOwnerId',null		

if @StopId <> @StopId
exec InsEditHistoryDetails @edithistoryid,@oldStopId,@StopId,'Modication','StopId',null		

if @ArrivalHr <> @ArrivalHr
exec InsEditHistoryDetails @edithistoryid,@oldArrivalHr,@ArrivalHr,'Modication','@ArrivalHr',null	

if @DepartureHr <> @DepartureHr
exec InsEditHistoryDetails @edithistoryid,@oldDepartureHr,@DepartureHr,'Modication','@DepartureHr',null		

if @ArrivalMin <> @ArrivalMin
exec InsEditHistoryDetails @edithistoryid,@ArrivalMin,@ArrivalMin,'Modication','@ArrivalMin',null		

if @DepartureMin <> @DepartureMin
exec InsEditHistoryDetails @edithistoryid,@DepartureMin,@DepartureMin,'Modication','@DepartureMin',null
if @DepartureHr <> @DepartureHr
exec InsEditHistoryDetails @edithistoryid,@oldDepartureHr,@DepartureHr,'Modication','@DepartureHr',null		

if @ArrivalAMPM <> @ArrivalAMPM
exec InsEditHistoryDetails @edithistoryid,@oldArrivalAMPM,@ArrivalAMPM,'Modication','@ArrivalAMPM',null		

if @DepartureAMPM <> @DepartureAMPM
exec InsEditHistoryDetails @edithistoryid,@oldDepartureAMPM,@DepartureAMPM,'Modication','@DepartureAMPM',null

if @arrivaltime <> @arrivaltime
exec InsEditHistoryDetails @edithistoryid,@oldarrivaltime,@arrivaltime,'Modication','@arrivaltime',null

if @departuretime <> @departuretime
exec InsEditHistoryDetails @edithistoryid,@olddeparturetime,@departuretime,'Modication','@departuretime',null


	
		end
   else
	if @insupddelflag = 'D'
	begin
     delete from [dbo].[FORouteFleetSchedule]
	 where VehicleId = @VehicleId
end
end

GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

CREATE PROCEDURE [dbo].[GetBTPOSId]
(@imei varchar(20), @fleetownerCode varchar(10))
AS
BEGIN


	declare @fleetownerid int = -1, @posid int = -1, @btposId varchar(15)
	
	select @fleetownerid = id from FleetOwner where UPPER(FleetOwnerCode) = UPPER(@fleetownercode)
	if(@fleetownerid is null or @fleetownerid  = -1)
	begin
		RAISERROR ('Invalid fleet owner code',16,1);
	end
	
	select @posid = ID from BTPOSDetails where FleetOwnerId = @fleetownerid and upper(IMEI) = upper(@imei)
	
	if(@posid is null or @posid  = -1)
	begin
		RAISERROR ('POS with IMEI is not found code',16,1);
	end
	
	select @btposId = 'POS'+ UPPER(@fleetownercode)+ cast(@posid as varchar(3))
	
	UPDATE BTPOSDetails
        SET POSID = @btposId,statusid = 2
    FROM BTPOSDetails
    where FleetOwnerId = @fleetownerid and upper(IMEI) = upper(@imei)and StatusId = 4
	
SELECT b.[CompanyId]
      ,[POSID]
      ,[StatusId]
      ,[IMEI]
      ,[ipconfig]     
      ,b.[FleetOwnerId]
  FROM [dbo].[BTPOSDetails] b
  inner join fleetowner fo on fo.id  = b.fleetownerid
where (upper(IMEI) = upper(@imei) and (FleetOwnerCode) = UPPER(@fleetownercode))

end

GO

/****** Object:  Table [dbo].[SmsGatewayeConfiguration]    Script Date: 07/11/2016 10:49:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SmsGatewayeConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[enddate] [datetime] NOT NULL,
	[hashkey] [datetime] NOT NULL,
	[providername] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[saltkey] [datetime] NOT NULL,
	[startdate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[ClientId] [int] NOT NULL,
	[SecretId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
GO
/****** Object:  StoredProcedure [dbo].[getSmsGatewayeConfiguration]    Script Date: 07/11/2016 10:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getSmsGatewayeConfiguration]
as
begin
SELECT Distinct [Id]
      ,[username]
      ,[pwd]   
      ,[providername]
      ,[saltkey]
      ,[startdate]
      ,[hashkey]
      ,[ClientId]
      ,[SecretId]
     
  FROM [dbo].[SmsGatewayeConfiguration] 
    
  
    
end

/****** Object:  StoredProcedure [dbo].[InsUpdDelSMSGatewayConfiguration]    Script Date: 07/18/2016 17:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelSMSGatewayConfiguration]
(@enddate datetime,
@hashkey datetime,
@providername varchar(50),
@pwd varchar(50),
@saltkey datetime,
@startdate datetime,
@username varchar(50),
@ClientId int,
@SecretId int,
@insupdflag varchar(10))
as
begin
if @insupdflag = 'I' 
begin
INSERT INTO [dbo].[SmsGatewayeConfiguration]
           ([enddate]
           ,[hashkey]          
           ,[providername]
           ,[pwd]
           ,[saltkey]
           ,[startdate]
           ,[username]
            ,[ClientId]      
              ,[SecretId]        
             )   
values
(@enddate,
@hashkey,
@providername,
@pwd,
@saltkey,
@startdate,
@username,
@ClientId,
@SecretId)
end
      
      else
  if @insupdflag = 'U' 
  begin
UPDATE [dbo].[SmsGatewayeConfiguration]
   SET   [hashkey] = @hashkey 
         ,[providername] = @providername
         ,[pwd] = @pwd
       ,[saltkey] = @saltkey
      ,[startdate] = @startdate
      ,[username] = @username
      ,[ClientId] = @ClientId
     ,[SecretId] = @SecretId
      ,[enddate] = @enddate      
end

end




/****** Object:  Table [dbo].[Index]    Script Date: 07/09/2016 17:22:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Index](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IndexFileData] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 07/09/2016 17:23:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Authentication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[GetFileContentAuthentication]    Script Date: 07/09/2016 17:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentAuthentication]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      A1.UserName,
      A1.Password
  FROM [dbo].[Authentication] A1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentBTPOSDetails]    Script Date: 07/09/2016 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentBTPOSDetails]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      B1.[POSID]
  FROM [dbo].[BTPOSDetails] B1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentIndex]    Script Date: 07/09/2016 17:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentIndex]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      I1.IndexFileData
    
  FROM [dbo].[Index] I1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end
/****** Object:  StoredProcedure [dbo].[GetFileContentRouteFare]    Script Date: 07/09/2016 17:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentRouteFare]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
     -- S.[Name]
      --,S.[Code]
      R1.[Amount]
  FROM [dbo].[RouteFare] R1
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end

/****** Object:  StoredProcedure [dbo].[GetFileContentRoutes]    Script Date: 07/09/2016 17:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentRoutes]

AS
BEGIN

SELECT--R.[Id]
      R.[RouteName]
     -- ,R.[Code]      
      --,S.[Name]
      --,S.[Code]
      -- ,R1.[Amount]
  FROM [dbo].[Routes] R
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end


/****** Object:  StoredProcedure [dbo].[GetFileContentStops]    Script Date: 07/09/2016 17:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFileContentStops]

AS
BEGIN

SELECT--R.[Id]
      --R.[RouteName]
     -- ,R.[Code]      
      S.[Name]
      --,S.[Code]
      -- ,R1.[Amount]
  FROM [dbo].[Stops] S
 -- inner join Stops S on (S.Id = R.id)
  --inner join RouteFare R1 on R1.RouteId = R.Id
 
   
end


GO
/****** Object:  Table [dbo].[FORouteFare]    Script Date: 07/12/2016 22:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORouteFare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,	
	[RouteId] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[PricingTypeId] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[SourceId] [int] NOT NULL,
	[DestinationId] [int] NOT NULL
) ON [PRIMARY]
GO


/****** Object:  StoredProcedure [dbo].[InsUpdDelFORouteFare]    Script Date: 08/08/2016 17:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdDelFORouteFare](           
            @VehicleId int         
           ,@RouteId int
           ,@Amount decimal
           ,@PricingTypeId int
           ,@FromDate datetime = null
           ,@ToDate datetime = null
           ,@UnitPrice decimal
           ,@SourceId int
           ,@DestinationId int
)                        
as
begin
declare @dt datetime
set @dt = GETDATE()

declare @edithistoryid int
declare @oldAmount decimal
declare @oldPricingTypeId int
declare @old@FromDate datetime
declare @oldToDate datetime
declare @oldUnitPrice decimal
declare @oldSourceId int
declare @oldDestinationId int




UPDATE [dbo].[FORouteFare]
   SET [Amount] = @Amount
      ,[PricingTypeId] = @PricingTypeId
      ,[FromDate] = @FromDate
      ,[ToDate] = @ToDate
      ,[UnitPrice] = @UnitPrice
      , [SourceId] = @SourceId
      , [DestinationId] = @DestinationId
      WHERE [VehicleId] = @VehicleId
      and [RouteId] = @RouteId      
                  exec InsEditHistory 'FORouteFare','Name', @Amount,'FORouteFare updation',@dt,'Admin','Modification',@edithistoryid = @edithistoryid output           

                    if @Amount <> @Amount
                  exec InsEditHistoryDetails @edithistoryid,@oldAmount,@Amount,'Modication','Amount',null		

                     if @PricingTypeId <> @PricingTypeId
                  exec InsEditHistoryDetails @edithistoryid,@oldPricingTypeId,@PricingTypeId,'Modication','PricingTypeId',null		

                     if @FromDate <> @FromDate
                   exec InsEditHistoryDetails @edithistoryid,@old@FromDate,@FromDate,'Modication','@FromDate',null
                   
                   
                     if @ToDate <> @ToDate
                  exec InsEditHistoryDetails @edithistoryid,@oldToDate,@ToDate,'Modication','ToDate',null		

                     if @UnitPrice <> @UnitPrice
                  exec InsEditHistoryDetails @edithistoryid,@oldUnitPrice,@UnitPrice,'Modication','@UnitPrice',null		

                     if @SourceId <> @SourceId
                   exec InsEditHistoryDetails @edithistoryid,@oldSourceId,@SourceId,'Modication','@SourceId',null
                   
                   if @DestinationId <> @DestinationId
                   exec InsEditHistoryDetails @edithistoryid,@oldDestinationId,@DestinationId,'Modication','@DestinationId',null
                   
                   
                   
                   
                   	
 if @@rowcount  = 0 
 INSERT INTO [dbo].[FORouteFare]
           ([VehicleId]         
           ,[RouteId]
           ,[Amount]
           ,[PricingTypeId]
           ,[FromDate]
           ,[ToDate]
           ,[UnitPrice]
           ,[SourceId]
           ,[DestinationId])
     VALUES
           (@VehicleId           
           ,@RouteId 
           ,@Amount
           ,@PricingTypeId
           ,@FromDate
           ,@ToDate
           ,@UnitPrice
           ,@SourceId
           ,@DestinationId)
             exec InsEditHistory 'FORouteFare','Name', @VehicleId,'FORouteFare Creation',@dt,'Admin','Insertion',@edithistoryid = @edithistoryid output
		              
			exec InsEditHistoryDetails @edithistoryid,null,@VehicleId,'Insertion','VehicleId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@RouteId,'Insertion','RouteId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@Amount,'Insertion','Amount',null
            exec InsEditHistoryDetails @edithistoryid,null,@PricingTypeId,'Insertion','PricingTypeId',null			
			exec InsEditHistoryDetails @edithistoryid,null,@FromDate,'Insertion','FromDate',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@ToDate,'Insertion','ToDate',null
            exec InsEditHistoryDetails @edithistoryid,null,@UnitPrice,'Insertion','UnitPrice',null			
			exec InsEditHistoryDetails @edithistoryid,null,@SourceId,'Insertion','SourceId',null
			
            exec InsEditHistoryDetails @edithistoryid,null,@DestinationId,'Insertion','DestinationId',null
           
end
GO
/****** Object:  StoredProcedure [dbo].[GetFleetOwnerRouteFare]    Script Date: 07/11/2016 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetFORouteFare]
AS
BEGIN
	
SELECT fo.[Id]
      ,[VehicleId]
      ,[RouteId]
      ,[PricingTypeId]
      ,[UnitPrice]
      ,[Amount]
      ,fo.[SourceId]
      ,fo.[DestinationId]
      ,f.[VehicleRegNo]
      ,r.RouteName
      ,r.Code
   
      ,[FromDate]
      ,[ToDate]
     
  FROM [dbo].[FORouteFare]fo
  inner join FleetDetails f on f.Id = fo.Id
  inner join Routes r on r.Id = fo.Id


end



GO

/****** Object:  Table [dbo].[Paymentdetailsnw]    Script Date: 07/13/2016 19:20:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Paymentdetailsnw](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Unitprice] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Transactionid] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[Salesordernw]    Script Date: 07/13/2016 19:20:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Salesordernw](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesordernw]    Script Date: 07/13/2016 17:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsUpdDelSalesordernw]

@ItemId int,
@ItemName varchar,
@UnitPrice money

as
begin

INSERT INTO [dbo].[Salesordernw]
           ([ItemId]
           ,[ItemName]
           ,[UnitPrice]
           )
     VALUES
           (@ItemId
           ,@ItemName
           ,@UnitPrice
           )
end



GO
--/****** Object:  StoredProcedure [dbo].[InsUpdDelSalesordernw]    Script Date: 07/13/2016 17:35:46 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--create PROCEDURE [dbo].[InsUpdDelSalesordernw]

--@ItemId int,
--@ItemName varchar,
--@UnitPrice money

--as
--begin

--INSERT INTO [dbo].[Salesordernw]
--           ([ItemId]
--           ,[ItemName]
--           ,[UnitPrice]
--           )
--     VALUES
--           (@ItemId
--           ,@ItemName
--           ,@UnitPrice
--           )
--end
--GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayment]    Script Date: 07/14/2016 13:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[InsUpdDelSalesOrder]
(
@Id int
,@SalesOrderNum nvarchar(15)
 ,@TransactionId int
      ,@Date datetime
      ,@amount decimal
      ,@ItemId int
      ,@Quantity decimal
      ,@Status int)
as
begin
insert into SalesOrder(Id
 ,SalesOrderNum
,TransactionId
,Date
,amount
,ItemId
,Quantity
,Status)values(
@Id
 ,@SalesOrderNum
,@TransactionId
,@Date
,@amount
,@ItemId

,@Quantity
,@Status)

end


GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPayment]    Script Date: 07/14/2016 13:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelPayments]
(--@Card varchar(50)=null
--@MobilePayment varchar(50)=null
--@Cash varchar(50)=null
@TransactionId int
,@Transaction_Num varchar(50)
,@amount decimal
,@PaymentMode int
,@Date datetime
,@Transactionstatus int
,@Gateway_transId varchar(50))
as
begin
insert into Payments (TransactionId
,Transaction_Num
,amount
,PaymentMode
,Date
,Transactionstatus
,Gateway_transId)values(
--@Card
--,@MobilePayment
--,@Cash
@TransactionId
,@Transaction_Num
,@amount
,@PaymentMode
,@Date
,@Transactionstatus
,@Gateway_transId)
end





GO
/****** Object:  StoredProcedure [dbo].[getShoppingCart]    Script Date: 07/18/2016 10:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getShoppingCart]
(@ItemId int =-1)
as
begin
SELECT distinct 
      [ItemId]
      ,i.[ItemName]
      ,[UnitPrice]
      ,s.[Id]
      ,[TransactionId]
      ,[Transaction_Num]
      ,[amount]
      ,[Quantity]
      ,[Status]
      ,[SalesOrderNum]
      ,[PaymentMode]
      ,[Date]
      ,[Transactionstatus]
      ,[Gateway_transid]
      ,ty.[Name]
      
  FROM [dbo].[ShoppingCart]s 
  inner join InventoryItem i on i.Id=s.ItemId
  inner join Types ty on ty.Id=s.Transactionstatus
  
  order by [ItemId]
end





GO

/****** Object:  Table [dbo].[Payments]    Script Date: 07/14/2016 16:54:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Payments](
	[Card] [varchar](50) NOT NULL,
	[MobilePayment] [varchar](50) NOT NULL,
	[Cash] [varchar](50) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Transaction_Num] [varchar](50) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[PaymentMode] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransactionStatus] [int] NOT NULL,
	[Gateway_transId] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CartPaymentDetails]    Script Date: 07/15/2016 20:04:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CartPaymentDetails](
	[LicenseType] [nvarchar](50) NULL,
	[Frequency] [int] NULL,
	[NoOfMonths] [nvarchar](50) NULL,
	[TotalAmount] [int] NULL,
	[CreateDate] [date] NULL,
	[TransId] [nvarchar](50) NULL,
	[UnitPrice] [int] NULL,
	[FleetOwner] [nvarchar](50) NULL,
	[Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[GetCartPaymentDetails]    Script Date: 07/17/2016 09:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCartPaymentDetails]
   (@LicenseType varchar(50)
           ,@Frequency int
           ,@NoOfMonths varchar(50)
           ,@TotalAmount int
           ,@CreateDate date
           ,@TransId varchar(50)
           ,@UnitPrice int
           ,@FleetOwner varchar(50))
AS
BEGIN

    INSERT INTO [dbo].[CartPaymentDetails]
           ([LicenseType]
           ,[Frequency]
           ,[NoOfMonths]
           ,[TotalAmount]
           ,[CreateDate]
           ,[TransId]
           ,[UnitPrice]
           ,[FleetOwner])
     VALUES
           (@LicenseType
           ,@Frequency
           ,@NoOfMonths
           ,@TotalAmount
           ,@CreateDate
           ,@TransId
           ,@UnitPrice
           ,@FleetOwner)   
       
     
 update LicensePayments set 
   [licenseFor]=@FleetOwner
  
end

/****** Object:  StoredProcedure [dbo].[InsupdCartPaymentDetails]    Script Date: 07/15/2016 20:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsupdCartPaymentDetails]  (@LicenseType varchar(50)
           ,@Frequency int
           ,@NoOfMonths varchar(50)
           ,@TotalAmount int
           ,@CreateDate date
           ,@TransId varchar(50)
           ,@UnitPrice int
           ,@FleetOwner varchar(50))
	
AS
BEGIN
	
	INSERT INTO [dbo].[CartPaymentDetails]
           ([LicenseType]
           ,[Frequency]
           ,[NoOfMonths]
           ,[TotalAmount]
           ,[CreateDate]
           ,[TransId]
           ,[UnitPrice]
           ,[FleetOwner])
     VALUES
           (@LicenseType
            ,@Frequency
           ,@NoOfMonths
           ,@TotalAmount
           ,@CreateDate
           ,@TransId
           ,@UnitPrice
           ,@FleetOwner)

END

/****** Object:  StoredProcedure [dbo].[GetFileContent]    Script Date: 07/17/2016 08:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFileContent]
	(@filename varchar(20) = null, @btposid varchar(10) = null)
AS
BEGIN
declare @fileNameUpper varchar(20)
set @fileNameUpper = UPPER(@filename)

declare @btposDBid int

if @btposid is not null 
begin
select @btposDBid = ID from BTPOSDetails where POSID = @btposid

end
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if @fileNameUpper = 'INDEXFILE' 
    begin
		-- Insert statements for procedure here
		SELECT 'ROUTESFILE'
		union
		SELECT 'STOPSFILE'
		union
		SELECT 'ROUTEFARE'
		union
		SELECT 'AUTHFILE'
    end
    else
    if @fileNameUpper = 'MENUFILE'
    begin
					SELECT 'Ticketing' menuitem,1 id,0 parentid,1 active
					union
                    SELECT 'Validate ticket',2,0,1
                    union
                    SELECT 'Set Route',3,0,1
                    union
                    SELECT 'Server comm',4,0,1
                    union
                    SELECT 'Print trans',5,0,1
                    union
                    SELECT 'POS Config',6,0,1
                    union
                    SELECT 'Misc Expense',7,1,1
                    union
                    SELECT 'Payment Options',8,1,1
                    union
                    SELECT 'Cash',9,8,1
                    union
                    SELECT 'Card',10,8,1
                    union
                    SELECT 'Mobile Money',11,8,1
                    union
                    SELECT 'Ping Server',12,4,1
                    union
                    SELECT 'Download files',13,4,1
                    union
                    SELECT 'Reset Password',14,6,1
                    union
                    SELECT 'Show Co-ords',15,6,1
                    union
                    SELECT 'Renewal Frequency',16,6,1
                    order by id
    end
    else 
    if @fileNameUpper = 'ROUTESFILE'
    begin
		select Code,r.Id,r.active from routes r
		inner join FleetRoutes fr on fr.routeid = r.Id
		inner join FleetBtpos fp on fp.vehicleid = fr.vehicleid
		inner join BTPOSDetails b on b.id = fp.btposid
		where b.id = @btposDBid
		
	end
    else
    if @fileNameUpper = 'STOPSFILE'
    begin
    
    --Stage 01<id,routeid,active>
		select s.Name,rd.stopid,rd.routeId,1 from 
		[dbo].[RouteDetails] rd
		inner join FleetRoutes fr on fr.routeid = rd.routeId
		inner join FleetBtpos fp on fp.vehicleid = fr.vehicleid
		inner join BTPOSDetails b on b.id = fp.btposid
		inner join stops s on s.id = rd.[StopId]
		where b.id = @btposDBid
		order by routeid 
		
	end
    else
    if @fileNameUpper = 'ROUTEFARE'
    begin
    
    --Route|Src|tgt<fare>
    
		SELECT r.id,s.id srcid,d.id destid,fof.amount,r.routename,r.Code,s.name,d.name,fof.perunitprice,fof.distance
		  FROM [dbo].[FleetOwnerRouteFare] fof
		  inner join FleetOwnerRouteStop frs on frs.id = fof.foroutestopid
		  inner join RouteStops rs on rs.id = frs.routestopid
		  inner join FleetRoutes fr on fr.routeid = rs.routeId
		inner join FleetBtpos fp on fp.vehicleid = fr.vehicleid
		inner join Routes r on r.Id = fr.routeid
		inner join BTPOSDetails b on b.id = fp.btposid
		inner join stops s on s.id = rs.[FromStopid]
		inner join stops d on d.id = rs.[ToStopid]
		where b.id = @btposDBid
	end
    else
    if @fileNameUpper = 'AUTHFILE'
    begin
		--userid<password,userid,active>
		SELECT 'user1' username,'1111' pwd,4 userid,1 active
		union
		SELECT 'user2','2222',5,1
		union
		SELECT 'user3','3333',6,1
		union
		SELECT 'user4','4444',7,1
    end
    
END
GO

/****** Object:  Table [dbo].[UserLicense]    Script Date: 07/19/2016 08:42:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserLicense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FOId] [int] NULL,
	[LicenseTypeId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[ExpiryOn] [datetime] NULL,
	[GracePeriod] [int] NULL,
	[ActualExpiry] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[Active] [int] NULL,
	[StatusId] [int] NULL,
	[RenewFreqTypeId] int NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLicensePayments]    Script Date: 07/24/2016 21:59:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserLicensePayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ULId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Units] [decimal](18, 0) NULL,
	[StatusId] [int] NULL,
	[LicensePymtTransId] [int] NULL,
	[IsRenewal] [int] NULL,
	[TransId] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[UserLicensePayments] ADD  CONSTRAINT [DF_UserLicensePayments_IsRenewal]  DEFAULT ((0)) FOR [IsRenewal]
GO

/****** Object:  Table [dbo].[UserLicensePymtTransactions]    Script Date: 07/19/2016 08:45:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserLicensePymtTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransId] [varchar](20) NOT NULL,
	[GatewayTransId] [varchar](20) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[ULPymtId] [int] NOT NULL,
	[StatusId] [int] NULL,
	[PymtTypeId] [int] NOT NULL,
	[Tax] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[Desc] [varchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ULPymtTransDetails]    Script Date: 07/19/2016 08:46:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ULPymtTransDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ULPPymtTransId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Discount] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[Amount] [decimal](18, 0) NULL,
	[TransDate] [datetime] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ULFeatures]    Script Date: 07/19/2016 08:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ULFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ULPymtId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[FeatureValue] [varchar](50) NOT NULL,
	[FeatureDesc] [varchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




GO
/****** Object:  StoredProcedure [dbo].[GetUserLicense]    Script Date: 07/19/2016 12:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetUserLicense]    Script Date: 07/20/2016 18:04:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUserLicense]
--(@foCode varchar(10))
as 
begin
SELECT u.[Id]
      ,u.[UserId]
     
      ,us.FirstName + '' + us.LastName as UName
      ,[FOId]      
      ,[LicenseTypeId]
      ,lt.LicenseType
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[RenewFreqTypeId]
      ,r.Name
      ,u.[Active]
      ,u.[StatusId]
     ,f.FleetOwnerCode
     ,uld.Tax
     ,uld.Discount
     ,ulp.UnitPrice
  FROM [dbo].[UserLicense]u
  inner join Users us on us.Id=u.UserId
  inner join FleetOwner f on f.Id=u.FOId
  inner join Types r on r.Id = RenewFreqTypeId
  inner join LicenseTypes lt on lt.Id = LicenseTypeId
  inner join UserLicensePayments ulp on ulp.Id = u.Id
  inner join ULPymtTransDetails uld on uld.Id = u.id
  
end


--upper(f.FleetOwnerCode) = upper(@focode)



GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePayments]    Script Date: 07/19/2016 12:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserLicensePayments]
as 
begin
SELECT [Id]
      ,[ULId]
      ,[CreatedOn]
      ,[Amount]
      ,[UnitPrice]
      ,[Units]
      ,[StatusId]
      ,[LicensePymtTransId]
      ,[IsRenewal]
  FROM [dbo].[UserLicensePayments]
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserLicensePymtTransactions]    Script Date: 07/19/2016 12:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserLicensePymtTransactions]
as 
begin
SELECT  [Id]
      ,[TransId]
      ,[GatewayTransId]
      ,[Amount]
      ,[TransDate]
      ,[ULPymtId]
      ,[StatusId]
      ,[Desc]
  FROM [dbo].[UserLicensePymtTransactions]
  
 
  
end


GO
/****** Object:  StoredProcedure [dbo].[GetULPymtTransDetails]    Script Date: 07/19/2016 12:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetULPymtTransDetails]
as 
begin
SELECT TOP 1000 [Id]
      ,[ULPPymtTransId]
      ,[PaymentTypeId]
      ,[StatusId]
      ,[Discount]
      ,[Tax]
      ,[Amount]
      ,[TransDate]
  FROM [dbo].[ULPymtTransDetails]
end


GO
/****** Object:  StoredProcedure [dbo].[GetULFeatures]    Script Date: 07/19/2016 12:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetULFeatures]
as 
begin
SELECT [Id]
      ,[ULPymtId]
      ,[FeatureId]
      ,[FeatureValue]
      ,[FeatureDesc]
  FROM [dbo].[ULFeatures]
 
end



GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 07/19/2016 12:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicense](
@Id int = -1,
@UserId int,
@FOId int,
@LicenseTypeId int,
@StartDate datetime = null,
@ExpiryOn datetime = null,
@GracePeriod int,
@ActualExpiry datetime = null,
@LastUpdatedOn datetime = null,
@StatusId int,
@RenewFreqTypeId int,
@Active int,
@insupddelflag char
)
as
begin

declare @cnt int = 0,@currDate datetime
select @currDate = GETDATE()

if @insupddelflag = 'I'
begin

select @cnt = COUNT(*) from [dbo].[UserLicense] where [UserId] = @UserId and [LicenseTypeId] = @LicenseTypeId

	if @cnt = 0 
	begin

	INSERT INTO [dbo].[UserLicense]
			   ([UserId]
			   ,[FOId]
			   ,[LicenseTypeId]
			   ,[StartDate]
			   ,[ExpiryOn]           
			   ,[GracePeriod]
			   ,[ActualExpiry]
			   ,[LastUpdatedOn]
			   ,[Active]
			   ,[StatusId]
			   ,[RenewFreqTypeId]
			   )
		 VALUES
			   (@UserId
			   ,@FOId
			   ,@LicenseTypeId
			   ,@StartDate
			   ,@ExpiryOn           
			   ,@GracePeriod          
			   ,@ActualExpiry
			   ,@currDate
			   ,@Active
			   ,@StatusId
			   ,@RenewFreqTypeId
			  )
	end

end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[UserLicense]
   SET [UserId] = @UserId
      ,[FOId] = @FOId
      ,[LicenseTypeId] = @LicenseTypeId
      ,[StartDate] = @StartDate
      ,[ExpiryOn] = @ExpiryOn
      ,[GracePeriod] = @GracePeriod
      ,[ActualExpiry] = @ActualExpiry
      ,[LastUpdatedOn] = @LastUpdatedOn
      ,[StatusId] = @StatusId
      ,[Active] = @Active      
      ,[RenewFreqTypeId] = @RenewFreqTypeId           
 WHERE [UserId] = @UserId
end
else
if @insupddelflag = 'D'
begin
	DELETE FROM [dbo].[UserLicense] WHERE [UserId] = @UserId
end
end


if @insupddelflag = 'I' or @insupddelflag = 'U'
begin

SELECT [Id]
      ,[UserId]
      ,[FOId]
      ,[LicenseTypeId]
      ,[StartDate]
      ,[ExpiryOn]
      ,[GracePeriod]
      ,[ActualExpiry]
      ,[LastUpdatedOn]
      ,[Active]
      ,[StatusId]
      ,[RenewFreqTypeId]
  FROM [dbo].[UserLicense]
   WHERE [UserId] = @UserId

 
end

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicensePayments](
@Id int = -1,
@ULId int,
@TransId varchar(20),
@CreatedOn datetime=null,
@Amount decimal,
@UnitPrice decimal,
@Units decimal,
@StatusId int,
@LicensePymtTransId int,
@IsRenewal int,
@insupddelflag char
)
as
begin

declare @cnt int = 0

--select @cnt = COUNT(*) from [dbo].[UserLicensePayments] where [ULId] = @ULId


	
if @insupddelflag = 'I'
begin


select @CreatedOn = GETDATE()

INSERT INTO [dbo].[UserLicensePayments]
           ([ULId]
           ,[CreatedOn]
           ,[Amount]
           ,[UnitPrice]
           ,[Units]           
           ,[StatusId]
           ,[LicensePymtTransId]           
           ,[IsRenewal]
           ,[TransId]
           )
     VALUES
           (@ULId
           ,@CreatedOn
           ,@Amount
           ,@UnitPrice 
           ,@Units          
           ,@StatusId
           ,@LicensePymtTransId
           ,@IsRenewal
           ,@TransId
            )

end

else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[UserLicensePayments]
   SET [CreatedOn] = @CreatedOn
      ,[Amount] = @Amount
      ,[UnitPrice] = @UnitPrice
      ,[Units] = @Units
      ,[StatusId] =@StatusId
      ,[LicensePymtTransId] = @LicensePymtTransId
      ,[IsRenewal] = @IsRenewal     
 WHERE [ULId] = @ULId and transid = @TransId
 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[UserLicensePayments]
      WHERE [ULId] = @ULId and transid = @TransId
end


--return the fleet owner details
if @insupddelflag = 'I' or @insupddelflag = 'U'
begin

select * from Users u
inner join UserLicense ul on u.Id = ul.UserId
inner join UserLicensePayments ulp on ulp.ULId = ul.Id
where ulp.ULId = @ULId and transid = @TransId

SELECT [Id]
      ,[ULId]
      ,[CreatedOn]
      ,[Amount]
      ,[UnitPrice]
      ,[Units]
      ,[StatusId]
      ,[LicensePymtTransId]
      ,[IsRenewal]
      ,[TransId]
  FROM [dbo].[UserLicensePayments]
  where [ULId] = @ULId and [TransId] = @TransId

end

end

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 07/19/2016 12:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelUserLicensePymtTransactions](
@Id int = -1,
@TransId varchar(50),
@GatewayTransId varchar(50),
@Amount decimal(18,0),
@TransDate datetime=null,
@ULPymtId int,
@StatusId int,
@Desc varchar(250),
@PymtTypeId int,
@Tax decimal(18,0) = 0,
@Discount decimal(18,0) = 0,
@insupddelflag char
)
as
begin
declare @LicensePymtTransId int

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[UserLicensePymtTransactions]
           ([TransId]
           ,[GatewayTransId]
           ,[Amount]
           ,[TransDate]
           ,[ULPymtId]           
           ,[StatusId]
           ,[PymtTypeId]
           ,[Tax]
           ,[Discount]
           ,[Desc]
           )
     VALUES
           (@TransId
           ,@GatewayTransId 
           ,@Amount
           ,@TransDate
           ,@ULPymtId        
           ,@StatusId
           ,@PymtTypeId
           ,@Tax
           ,@Discount
           ,@Desc
            ) 
            SELECT @LicensePymtTransId = SCOPE_IDENTITY()  
            
            update [dbo].[UserLicensePayments]
            set [LicensePymtTransId]  = @LicensePymtTransId 
            where [Id] = @ULPymtId 

end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[UserLicensePymtTransactions]
   SET [TransId] = @TransId
      ,[GatewayTransId] = @GatewayTransId 
      ,[Amount] = @Amount
      ,[TransDate] = @TransDate
      ,[ULPymtId] = @ULPymtId
      ,[StatusId] =@StatusId
      ,[Desc] = @Desc
      ,[PymtTypeId]= @PymtTypeId
      ,[Tax] = @Tax
      ,[Discount] = @Discount
    
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[UserLicensePymtTransactions]
      WHERE [Id] = @Id 
end

end

GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 07/19/2016 12:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelULPymtTransDetails](
@Id int = -1,
@ULPPymtTransId int,
@PaymentTypeId int,
@StatusId int,
@Discount decimal(18,0),
@Tax decimal(18,0),
@Amount decimal(18,0),
@TransDate datetime=null,

@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[ULPymtTransDetails]
           ([ULPPymtTransId]
           ,[PaymentTypeId]
           ,[StatusId]
           ,[Discount]
           ,[Tax]           
           ,[Amount]
           ,[TransDate]
           
          
           )
     VALUES
           (@ULPPymtTransId
           ,@PaymentTypeId 
           ,@StatusId
           ,@Discount
           ,@Tax        
           ,@Amount
           ,@TransDate
        
            )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[ULPymtTransDetails]
   SET [ULPPymtTransId] = @ULPPymtTransId
      ,[PaymentTypeId] = @PaymentTypeId
      ,[StatusId] = @StatusId
      ,[Discount] = @Discount
      ,[Tax] = @Tax
      ,[Amount] =@Amount
      ,[TransDate] = @TransDate
    
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[ULPymtTransDetails]
      WHERE [Id] = @Id 
end
end



GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 07/19/2016 12:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsUpdDelULFeatures](
@Id int = -1,
@ULPymtId int,
@FeatureId int,
@FeatureValue varchar(50),
@FeatureDesc varchar(50),

@insupddelflag char
)
as
begin

if @insupddelflag = 'I'
begin
INSERT INTO [dbo].[ULFeatures]
           ([ULPymtId]
           ,[FeatureId]
           ,[FeatureValue]
           ,[FeatureDesc]
           
           )
     VALUES
           (@ULPymtId
           ,@FeatureId
           ,@FeatureValue
           ,@FeatureDesc
           
            )
          end
else
if @insupddelflag = 'U'
begin

UPDATE [dbo].[ULFeatures]
   SET [ULPymtId] = @ULPymtId
      ,[FeatureId] = @FeatureId
      ,[FeatureValue] = @FeatureValue
      ,[FeatureDesc] = @FeatureDesc
     
     
 WHERE [Id] = @Id 
end
else
if @insupddelflag = 'D'
begin
DELETE FROM [dbo].[ULFeatures]
      WHERE [Id] = @Id 
end
end

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE InsUpdDelUserLicenseDetails
(@FOCode varchar(10), @licenseTypeId int, @amount decimal,@unitprice decimal,@units int,@renewFreqTypeId int,@insupddelFlag varchar(1))
	
AS
BEGIN
declare @userid int, @foId int, @currDate datetime, @ULId int = 0,@ulCnt int = -1, @ulPcnt int = -1
select @currDate = GETDATE()
--set foId = -1

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


if @insupddelFlag = 'I' 
begin

select @ulCnt = COUNT(*) from [dbo].[UserLicense] where UserId = @userid and LicenseTypeId = @licenseTypeId
    -- Insert statements for procedure here
    --1) master user license record will be maintained for all user licenses
    --FOid, licenseTypeId, active, startdate, expiryon, graceperiod,lastupdatedon
    if @ulCnt = 0 
    begin
    INSERT INTO [dbo].[UserLicense]
           ([UserId]
           ,[FOId]
           ,[LicenseTypeId]
           ,[StartDate]
           ,[ExpiryOn]
           ,[GracePeriod]
           ,[ActualExpiry]
           ,[LastUpdatedOn]
           ,[Active]
           ,[StatusId]
           ,[RenewFreqTypeId])
     VALUES
           (@userid,@foId,@licenseTypeId,@currDate,null,7,null,@currDate,0,1,@renewFreqTypeId)
    
    SELECT @ULId = SCOPE_IDENTITY()
    end
      
      select @ulPcnt = COUNT(*) from  [dbo].[UserLicensePayments] where ULId = @ULId
		if @ulPcnt = 0 
		begin
		INSERT INTO [dbo].[UserLicensePayments]
           ([ULId]
           ,[CreatedOn]
           ,[Amount]
           ,[UnitPrice]
           ,[Units]
           ,[StatusId]
           ,[LicensePymtTransId]
           ,[IsRenewal])
		VALUES
           (@ULId,@currDate,@amount,@unitprice,@units,1,null,0)
        end              

    --the payment made by the user for the license purchase will be stored next
    --2) enter details into user license payments
    --ULId, data, amount, unitprice, duration, status,transid,isrenewal
    
    --the transaction details need to be stored next
    --3) for the payment a transaction will be done the details will be stored into licensepaymenttrans
    --ULPId, transid,gatewaytransid, status, amount, datetime, comment, 
    
    --further details of the transaction - how the payment is made is stored
    --3) payment details are stored into lcPymtdetails table
    --lpymttransId, paymentTypeId, status, discount, tax, amt
        
    --all the benefits that the user gets as part of license will be stored 
    --4)features and their values will be stored into ULFeatures Table    
    --ULPid, featureid, value,desc
    
    --5)insert an alert to notify admin
    --6)update the owner ship for bt pos if needed
    --7)generate a SO and shipping order for the BT POS
    --8)insert SO and shipping order notification for admin
    --9)update edit history
    --10) insert a notfication for user also
    --11)create dashboard login credentails also
    --12) update the inventory status also
    end
else
begin
		if @insupddelFlag = 'U'
		 begin
	     select 1
		 end
		else		
		  begin
		  if @insupddelFlag = 'D'
	       begin
	       select 1
	       end
          end
end
    
	select * from Users u inner join FleetOwner f on f.UserId = u.Id and UPPER(f.fleetownercode) = UPPER(@FOCode)

END


GO


/****** Object:  Table [dbo].[checkout]    Script Date: 07/20/2016 18:15:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[checkout](
	[Id] [int] NOT NULL,
	[ckdetails] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



/****** Object:  StoredProcedure [dbo].[getcheckout]    Script Date: 07/20/2016 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getcheckout]
as
begin
select c.[Id]
      ,[ckdetails]
            ,fd.Firstname
      ,fd.LastName
      ,fd.PhoneNo
      ,fd.EmailAddress
      ,cy.Country
      ,cy.ZipCode
    ,cy.State
  FROM [dbo].[checkout]c
   inner join FleetOwnerRequestDetails fd on fd.id=c.id
   inner join Company cy on cy.Id=fd.Id
end

GO

/****** Object:  Table [dbo].[Address]    Script Date: 07/21/2016 18:09:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[AddresTypeId] [int] NOT NULL,
	[Fled1] [varchar](50) NOT NULL,
	[Fled2] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO
/****** Object:  StoredProcedure [dbo].[GetBlockListNew]    Script Date: 07/23/2016 07:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBlockListNew]
(@selectedId int)
AS
BEGIN

if  @selectedId = 1

select * from Company

else if @selectedId =2

select * from Users

else if @selectedId =3

select * from BTPOSDetails

else if @selectedId = 4

select * from Routes 

else if @selectedId = 5

select * from Stops
 
END

--INSERT INTO [dbo].[BtposPayment]
--           ([PosId]
--           ,[DateTime]
--           ,[Amount]
--           ,[TransactionId]
--           ,[TransactionTypeId]
--           ,[OperatorId]
--           ,[StatusId]
--           ,[GatewayId]
--           ,[Deatails])
--     VALUES
--           (PosId, varchar(50)
--           ,DateTime, datetime
--           ,Amount, int
--           ,TransactionId, nvarchar(50)
--           ,TransactionTypeId, int
--           ,OperatorId, int
--           ,StatusId, int
--           ,GatewayId, int
--           ,Deatails, varchar(50)


--/****** Object:  StoredProcedure [dbo].[InsUpdDelUserLicenseDetails]    Script Date: 07/24/2016 22:33:52 ******/
--SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdDelUserLicenseConfirmDetails]
(@foId int,
@userId int,
@TransId varchar(50),
@GatewayTransId varchar(20),
@ULId int,
@ULPymtId int,
@units int,
@isRenewal int,
@itemId int,
@address varchar(250) = null,
@amount decimal,
@insupddelFlag varchar(1))
	
AS
BEGIN
declare @expDt datetime,  @currDate datetime,@userloginid varchar(10) =  null ,@shipOrder varchar(10),@licenseCode varchar(20) = 'LC0001',@posid int
,@soId int

select @currDate = GETDATE()


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    /*
    1) update userlicense with start and expiry dates
    2) update userlicensepaymenttransactions table with gatewayTransId 
     --5)insert an alert to notify admin
    --6)update the owner ship for bt pos if needed
    
    --7)generate a SO and shipping order for the BT POS
    --8)insert SO and shipping order notification for admin
    --9)update edit history
    --10) insert a notfication for user also
    --11)create dashboard login credentails also
    --12) update the inventory status also
    */

--all the benefits that the user gets as part of license will be stored 
    --4)features and their values will be stored into ULFeatures Table    
    --ULPid, featureid, value,desc
if @isRenewal = 0 
begin
   
   select @expDt = GETDATE() --(select [units] from UserLicensePayments)
   
    UPDATE [dbo].[UserLicense]
   SET 
      [StartDate] = @currDate
      ,[ExpiryOn] = @expDt     
      ,[ActualExpiry] = @expDt--(@expDt + (select [graceperiod] from UserLicense WHERE [Id] = @ULId)) 
      ,[LastUpdatedOn] = @currDate
      ,[Active] = 1
      ,[StatusId] = 3      
 WHERE [Id] = @ULId

UPDATE [dbo].[UserLicensePymtTransactions]
   SET [GatewayTransId] = @GatewayTransId       
      ,[StatusId] =3
      where [TransId] = @TransId
      
     select  @userloginid =  'FO'+(select replace(convert(char(10), getdate(), 108), ':', ''))
     
     INSERT INTO [dbo].[UserLogins]
           ([LoginInfo]
           ,[PassKey]
           ,[UserId]
           ,[salt]
           ,[Active])
     VALUES
           (@userloginid,@userloginid,@userId,null,1)
          

end

----if there are POS units to be sent then update the details and generate SO and shipping orders
if @units > 0 
begin

--check if it is renewal
if @isRenewal = 0 
begin
    --UPDATE BTPOSDetails
    --    SET FleetOwnerId = @foId
    --  --  ,CompanyId = (select [CompanyId] from FleetOwner where Id = @foId)
    --FROM BTPOSDetails
    --INNER jOIN (
    --    SELECT TOP(@units) ID FROM BTPOSDetails WHERE FleetOwnerId is null
    --     ORDER BY ID
    --) AS InnerMyTable ON BTPOSDetails.ID = InnerMyTable.ID
    
DECLARE db_cursor CURSOR FOR  
SELECT TOP(@units) id from [dbo].[BTPOSDetails] where FleetOwnerId is null or fleetownerid  = 0 ORDER BY ID


OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @posid

WHILE @@FETCH_STATUS = 0  
BEGIN  

declare @cid int

select @cid = companyid from FleetOwner where Id = @foId

update [dbo].[BTPOSDetails]
set FleetOwnerId = @foId, CompanyId = @cid
where Id = @posid
 
FETCH NEXT FROM db_cursor INTO @posid  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor 

declare @sonum varchar(20),@shipOrderNum varchar(20)

 select @sonum = 'SO'+(select replace(convert(char(10), getdate(), 108), ':', ''))
 select @shipOrderNum = 'SH'+(select replace(convert(char(10), getdate(), 108), ':', ''))

      INSERT INTO [dbo].[SalesOrder]
           ([SalesOrderNum]
           ,[TransactionId]
           ,[Date]
           ,[amount]
           ,[ItemId]
           ,[Quantity]
           ,[Status])
     VALUES
           (@sonum
           ,@ULPymtId
           ,@currDate,@amount,@itemId,@units,1)
           
           SELECT @soId = SCOPE_IDENTITY() 
           
           INSERT INTO [dbo].[Notifications]
           ([Date]
           ,[Message]
           ,[MessageTypeId]
           ,[StatusId]
           ,[UserId]
           ,[Name]
           ,[Source])
     VALUES
           (@currDate,'A sales order '+@sonum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
          

           INSERT INTO [dbo].[ShippingOrder]
           ([ShippingOrderNum]
           ,[TransactionId]
           ,[Date]
           ,[amount]
           ,[Status]
           ,[SalesOrderId])
     VALUES
           (@shipOrderNum,@ULPymtId,@currDate,@amount,1,@soId)

INSERT INTO [dbo].[Notifications]
           ([Date]
           ,[Message]
           ,[MessageTypeId]
           ,[StatusId]
           ,[UserId]
           ,[Name]
           ,[Source])
     VALUES
           (@currDate,'A shipping order '+@shipOrderNum+' is generated for BT POS',1,1,1,'Admin Admin','License Payments')
           
		--update the inventory status
		--check the availability and if not possible, generate error
		--if avilable qty falls below reorder point then generate an alert also
		UPDATE [dbo].[Inventory]
		   SET [availableQty] = ([availableQty] - @units)		 
		 WHERE [InventoryItemId] = @itemId
        
end
else
begin
select 1
 --if it is renewal, then verify if any pos units need to be increased.
 --and also extend the date. no need of sending login info
end



--return back below
--1) login userid 
--2) shipping order confirmation
--3) license code
--4) payment transaction id
--5) expiry date
end

select @userloginid username
,@shipOrderNum shipOrder
,@licenseCode licenseCode
,@TransId transId
,@expDt expiryon
, @currDate startdate
,@units noofunits
,'a.b@c.com' emailid

END



GO


/****** Object:  Table [dbo].[Country]    Script Date: 08/05/2016 17:57:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Countries] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO

GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 08/05/2016 18:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCountries]

as begin 
SELECT * from Country

       
end

GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetAvailableServices
	-- Add the parameters for the stored procedure here
	@srcId int, 
	@destId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
1) check if there are any routes configured with the given source and destination (routestops)
2) if they exists then from the combination get all the fleet owners (fleetownerstops)
3) using the above get the vehicles and fare for the fleeet owner (foroutefare)
4) and also get the schedule of the vehicles (foroutefleetschedule)
*/
select distinct rs.Id, rs.RouteId,src.name srcName,dest.name destName,c.Name cmpName,fofare.VehicleTypeId,fofare.VehicleId
, t.Name,frs1.ArrivalTime,frs2.DepartureTime , fofare.Amount,frs1.Duration
from RouteStops rs
inner join stops src on src.id = rs.fromstopid
inner join stops dest on dest.id = rs.tostopid
inner join [FleetRoutes] fr1 on fr1.RouteId = rs.RouteId
inner join FleetOwnerRoute fr on fr.RouteId = rs.RouteId
inner join Company c on c.Id = fr.CompanyId
inner join FleetOwnerRouteStop fors on fors.RouteStopId = rs.Id
inner join [FleetOwnerRouteFare] fofare on fofare.FORouteStopId = fors.Id
inner join Types t on t.Id = fofare.VehicleTypeId
inner join FORouteFleetSchedule frs1 on frs1.StopId = src.Id and frs1.FleetOwnerId = fors.FleetOwnerId and frs1.RouteId = rs.RouteId and frs1.VehicleId = fr1.VehicleId
inner join FORouteFleetSchedule frs2 on frs2.StopId = dest.Id and frs2.FleetOwnerId = fors.FleetOwnerId and frs2.RouteId = rs.RouteId and frs2.VehicleId = fr1.VehicleId
where FromStopId = @srcId and ToStopId = @destId

    -- Insert statements for procedure here
--	select rs.Id, rs.RouteId,src.name,dest.name,c.Name,fd.VehicleTypeId,t.Name,frs1.ArrivalTime,frs2.DepartureTime from RouteStops rs
--inner join stops src on src.id = rs.fromstopid
--inner join stops dest on dest.id = rs.tostopid
--inner join FleetOwnerRoute fr on fr.RouteId = rs.RouteId
--inner join Company c on c.Id = fr.CompanyId
--inner join FleetRoutes r on r.RouteId = rs.RouteId
--inner join FleetDetails fd on fd.Id = r.VehicleId
--inner join Types t on t.Id = fd.VehicleTypeId
--inner join FORouteFleetSchedule frs1 on frs1.StopId = src.Id and frs1.FleetOwnerId = fr.FleetOwnerId and frs1.RouteId = fr.RouteId
--inner join FORouteFleetSchedule frs2 on frs2.StopId = dest.Id and frs2.FleetOwnerId = fr.FleetOwnerId and frs2.RouteId = fr.RouteId
-- where FromStopId = 1 and ToStopId = 4
	
	--fleetownerroutes -- to get company name and fleet owner name
	--
	
	
END
GO
/****** Object:  Table [dbo].[WebsiteUserInfo]    Script Date: 08/08/2016 18:33:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebsiteUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Mobile] [varchar](15) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


GO
/****** Object:  StoredProcedure [dbo].[GetWebsiteUserInfo]    Script Date: 08/08/2016 18:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetWebsiteUserInfo]

AS
BEGIN

SELECT U.[Id]
      ,U.[FirstName]
      ,U.[LastName]      
      
      ,U.[EmailAddress]
     ,U.[Mobile]
      ,ul.logininfo as UserName
      ,ul.passkey as [Password]            
      
  FROM [dbo].[WebsiteUserInfo] U
  
 
left OUTER join dbo.websiteUserLogin ul on ul.userid = U.id    
 left OUTER join dbo.WebsiteUserInfo u2 on ul.userid = U.id   
end

/****** Object:  StoredProcedure [dbo].[GetinterbusUserLogin]    Script Date: 06/08/2016 16:08:17 ******/
SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [dbo].[InsUpdWebsiteUserInfo]    Script Date: 08/08/2016 18:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsUpdWebsiteUserInfo](
@FirstName varchar(50)
,@LastName varchar(50)
,@UserName varchar(50)  
,@Password varchar(50)  
,@EmailAddress varchar(50)
--,@ConfirmPassword varchar(50)
--,@Gender varchar(50),@salt varchar(50)=null,@Active int=1,@userid int = -1
,@Mobile varchar(15))

 AS
BEGIN
DECLARE @COUNT int
set @COUNT = 0
	if @COUNT = 0
	begin
	 if not exists (select * from WebsiteUserInfo where UserName = @UserName)
INSERT INTO [dbo].[WebsiteUserInfo]
           ([FirstName]
           ,[LastName]
           ,[UserName]
           ,[EmailAddress]
           ,[Password]
           --,[ConfirmPassword]
          -- ,[Gender]
           ,[Mobile])
     VALUES
           (@FirstName
           ,@LastName
           ,@UserName
           ,@EmailAddress
           ,@Password
           --,@ConfirmPassword
           --,@Gender
           ,@Mobile)
     end  
           
 --set @LASTID=SCOPE_IDENTITY();
           
 --          INSERT INTO [dbo].[WebsiteUserLogin]
 --          ([LoginInfo]
 --          ,[PassKey]
       
 --          ,[UserId]
 --          ,[salt]
 --          ,[Active])
 --    VALUES
 --          (@UserName
 --          ,@Password
 --          ,@LASTID
 --          ,@salt
 --          ,@Active
 --          )
           
else
			RAISERROR ('user already exists',2099,1); 

END

GO

/****** Object:  Table [dbo].[Schedules]    Script Date: 08/10/2016 18:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SNo] [int] NOT NULL,
	[ServiceNo] [nvarchar](50) NOT NULL,
	[From] [char](50) NOT NULL,
	[To] [char](50) NOT NULL,
	[CoachType] [nvarchar](50) NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[Approxjourneytime] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




GO
/****** Object:  StoredProcedure [dbo].[GetSchedules]    Script Date: 08/10/2016 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSchedules]

as begin 
SELECT  [Id]
      ,[SNo]
      ,[ServiceNo]
      ,[From]
      ,[To]
      ,[CoachType]
      ,[DepartureTime]
      ,[Approxjourneytime]
  FROM [dbo].[Schedules]
         
end
Go

/****** Object:  Table [dbo].[BTPOSTransactions]    Script Date: 08/15/2016 12:23:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BTPOSTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BTPOSId] [varchar](50) NOT NULL,
	[Date] [datetime] NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[ChangeRendered] [decimal](18, 0) NULL,
	[ChangeGiven] [decimal](18, 0) NULL,
	[TransId] [int] NULL,
	[GatewayTransId] [varchar](50) NULL,
	[TransCode] [varchar](50) NULL,
	[PaymentCategoryId] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[PaymentModeId] [int] NULL,
	[TransStatusId] [int] NULL,
	[TransDetails] [varchar](500) NULL,
	[noofSeats] [int] NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[luggageTypeId] [int] NULL,
	[luggageAmt] [decimal](18, 0) NULL,
	[taxes] [decimal](18, 0) NULL,
	[disc] [decimal](18, 0) NULL,
	[TicketNo] [varchar](50) NULL,
	[SrcId] [int] NULL,
	[DestId] [int] NULL,
	[RouteId] [int] NULL,
	[OperatorId] [int] NULL,
	[TransApproved] [int] NULL,
	[Reason] [varchar](250) NULL,
	[ApprovedById] [int] NULL,
	[FleetOwnerId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_AmountPaid]  DEFAULT ((0)) FOR [AmountPaid]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_ChangeRendered]  DEFAULT ((0)) FOR [ChangeRendered]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_ChangeGiven]  DEFAULT ((0)) FOR [ChangeGiven]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_unitPrice]  DEFAULT ((0)) FOR [unitPrice]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_luggageTypeId]  DEFAULT ((0)) FOR [luggageTypeId]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_luggageAmt]  DEFAULT ((0)) FOR [luggageAmt]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_taxes]  DEFAULT ((0)) FOR [taxes]
GO

ALTER TABLE [dbo].[BTPOSTransactions] ADD  CONSTRAINT [DF_BTPOSTransactions_disc]  DEFAULT ((0)) FOR [disc]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetBTPOSTransactions
	(@BTPOSId varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [Id]
      ,[BTPOSId]
      ,[Date]
      ,[TotalAmount]
      ,[AmountPaid]
      ,[ChangeRendered]
      ,[ChangeGiven]
      ,[TransId]
      ,[GatewayTransId]
      ,[TransCode]
      ,[PaymentCategoryId]
      ,[PaymentTypeId]
      ,[PaymentModeId]
      ,[TransStatusId]
      ,[TransDetails]
      ,[noofSeats]
      ,[unitPrice]
      ,[luggageTypeId]
      ,[luggageAmt]
      ,[taxes]
      ,[disc]
      ,[TicketNo]
      ,[SrcId]
      ,[DestId]
      ,[RouteId]
      ,[OperatorId]
      ,[TransApproved]
      ,[Reason]
      ,[ApprovedById]
      ,[FleetOwnerId]
  FROM [dbo].[BTPOSTransactions]
  where [BTPOSId] = @BTPOSId


END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[InsUpdDelBTPOSTrans](@Id int = -1
           ,@BTPOSId varchar(50)
           ,@Date datetime = null
           ,@TotalAmount decimal(18,0) = 0
           ,@AmountPaid decimal(18,0) = 0
           ,@ChangeRendered decimal(18,0) = 0
           ,@ChangeGiven decimal(18,0) = 0
           ,@TransId int = 0
           ,@GatewayTransId varchar(50) = 0
           ,@TransCode varchar(50) = null
           ,@PaymentCategoryId int = 0
           ,@PaymentTypeId int = 0
           ,@PaymentModeId int = 0
           ,@TransStatusId int = 0
           ,@TransDetails varchar(500) = null
           ,@noofSeats int = 0
           ,@unitPrice decimal(18,0) = 0
           ,@luggageTypeId int = 0
           ,@luggageAmt decimal(18,0) = 0
           ,@taxes decimal(18,0) = 0
           ,@disc decimal(18,0) = 0
           ,@TicketNo varchar(50) = null
           ,@SrcId int = 0
           ,@DestId int = 0
           ,@RouteId int = 0
           ,@OperatorId int = 0
           ,@TransApproved int = 0
           ,@Reason varchar(250) = null
           ,@ApprovedById int = 0
           ,@FleetOwnerId int = 0
           ,@insupdflag varchar
           ,@posTransId int output)
as
begin

set @posTransId  = -1

if @insupdflag = 'I'
begin



INSERT INTO [dbo].[BTPOSTransactions]
           ([BTPOSId]
           ,[Date]
           ,[TotalAmount]
           ,[AmountPaid]
           ,[ChangeRendered]
           ,[ChangeGiven]
           ,[TransId]
           ,[GatewayTransId]
           ,[TransCode]
           ,[PaymentCategoryId]
           ,[PaymentTypeId]
           ,[PaymentModeId]
           ,[TransStatusId]
           ,[TransDetails]
           ,[noofSeats]
           ,[unitPrice]
           ,[luggageTypeId]
           ,[luggageAmt]
           ,[taxes]
           ,[disc]
           ,[TicketNo]
           ,[SrcId]
           ,[DestId]
           ,[RouteId]
           ,[OperatorId]
           ,[TransApproved]
           ,[Reason]
           ,[ApprovedById]
           ,[FleetOwnerId])
     VALUES
           (@BTPOSId
           ,@Date
           ,@TotalAmount
           ,@AmountPaid
           ,@ChangeRendered
           ,@ChangeGiven
           , @TransId
           ,@GatewayTransId
           ,(select 'POSTR'+ltrim(rtrim(STR((max(Id)+1)))) from [BTPOSTransactions])
           ,@PaymentCategoryId
           ,@PaymentTypeId
           ,@PaymentModeId
           ,@TransStatusId
           ,@TransDetails
           ,@noofSeats
           ,@unitPrice
           ,@luggageTypeId
           ,@luggageAmt
           ,@taxes
           ,@disc
           ,@TicketNo
           ,@SrcId
           ,@DestId
           ,@RouteId
           ,@OperatorId
           ,@TransApproved
           ,@Reason
           ,@ApprovedById
           ,@FleetOwnerId)   
           
           SELECT @posTransId = SCOPE_IDENTITY()
           
          
end
else
if @insupdflag = 'U'
begin

UPDATE [dbo].[BTPOSTransactions]
   SET [Date] = @Date
      ,[TotalAmount] = @TotalAmount
      ,[AmountPaid] = @AmountPaid
      ,[ChangeRendered] = @ChangeRendered
      ,[ChangeGiven] = @ChangeGiven
      ,[TransId] = @TransId
      ,[GatewayTransId] = @GatewayTransId
      ,[TransCode] = @TransCode
      ,[PaymentCategoryId] = @PaymentCategoryId
      ,[PaymentTypeId] = @PaymentTypeId
      ,[PaymentModeId] = @PaymentModeId
      ,[TransStatusId] = @TransStatusId
      ,[TransDetails] = @TransDetails
      ,[noofSeats] = @noofSeats
      ,[unitPrice] = @unitPrice
      ,[luggageTypeId] = @luggageTypeId
      ,[luggageAmt] = @luggageAmt
      ,[taxes] = @taxes
      ,[disc] = @disc
      ,[TicketNo] = @TicketNo
      ,[SrcId] = @SrcId
      ,[DestId] = @DestId
      ,[RouteId] = @RouteId
      ,[OperatorId] = @OperatorId
      ,[TransApproved] = @TransApproved
      ,[Reason] = @Reason
      ,[ApprovedById] = @ApprovedById
      ,[FleetOwnerId] = @FleetOwnerId
 WHERE  Id = @Id 
 
end
end
Go