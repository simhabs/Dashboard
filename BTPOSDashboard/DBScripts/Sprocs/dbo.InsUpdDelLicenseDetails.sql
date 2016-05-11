
/****** Object:  StoredProcedure [dbo].[InsUpdDelLicenseDetails]    Script Date: 05/11/2016 16:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[InsUpdDelLicenseDetails](
@Id int,
@LicenseCode varchar(10)=null,
@LicenseName Varchar(50)=null,
@LicenseCatId int,
@FeatureName varchar(50),
@FeatureLabel varchar(30),
@FeatureValue varchar(10),
@LabelClass varchar(50)=null,
@Active int=null
)
--@fromDate datetime=getdate(),
--@toDate datetime=getdate())

as
begin

UPDATE [POSDashboard].[dbo].[LicenseDetails]
   SET [LicenseCode] = @LicenseCode
      ,[LicenseName] = @LicenseName
      ,[LicenseCatId] = @LicenseCatId
      ,[FeatureName] = @FeatureName
      ,[FeatureLabel] = @FeatureLabel
      ,[FeatureValue] = @FeatureValue
      ,[LabelClass] = @LabelClass
      ,[Active] = @Active
      --,[fromDate] = <fromDate, datetime,>
      --,[toDate] = <toDate, datetime,>
 WHERE Id = @Id

if @@ROWCOUNT = 0
begin
INSERT INTO [POSDashboard].[dbo].[LicenseDetails]
           ([LicenseCode]
           ,[LicenseName]
           ,[LicenseCatId]
           ,[FeatureName]
           ,[FeatureLabel]
           ,[FeatureValue]
           ,[LabelClass]
           ,[Active]
           --,[fromDate]
          -- ,[toDate]
          )
     VALUES
           (
@LicenseCode,
@LicenseName,
@LicenseCatId,
@FeatureName,
@FeatureLabel,
@FeatureValue,
@LabelClass,
@Active
--@fromDate,
--@toDate
)
end


end




