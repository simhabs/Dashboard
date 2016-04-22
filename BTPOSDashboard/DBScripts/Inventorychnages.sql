USE [POSDashboard]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 04/16/2016 14:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL,
	[TypeGroupId] [int] NOT NULL,
	[listkey] [varchar](10) NULL,
	[listvalue] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeGroups]    Script Date: 04/16/2016 14:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 04/16/2016 14:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Description] [varchar](30) NULL,
	[AvailableQty] [int] NOT NULL,
	[CategoryId] [varchar](50) NOT NULL,
	[SubCategoryId] [varchar](50) NOT NULL,
	[PerUnitPrice] [int] NOT NULL,
	[ReorderPont] [int] NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelInventory]    Script Date: 04/16/2016 14:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelInventory](@InventoryId int,@Name varchar(50),@Code varchar(30),@Description varchar(30),
@AvailableQty int,@CategoryId int,@SubCategoryId int,@PerUnitPrice int,@ReorderPont int,@Active int,@insupdflag varchar(10)
)
as
begin

 insert into Inventory (Name,
Code
           ,[Description]
           ,AvailableQty
           ,CategoryId
           ,SubCategoryId
           ,PerUnitPrice
           ,ReorderPont
           ,Active) 
      values(@Name,@Code,@Description,@AvailableQty,@CategoryId,@SubCategoryId,@PerUnitPrice,@ReorderPont,@Active)
end
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 04/16/2016 14:30:45 ******/
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
	SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where tg.Id=29
	  
	  SELECT t.Id, t.Name, t.[Description],t.Active, tg.name as TypeGroup, TypeGroupId, listkey, listvalue
	 from [Types] t
	 inner join TypeGroups tg on tg.Id = t.TypeGroupId	 
	  where tg.Id=30
	  
END
GO
