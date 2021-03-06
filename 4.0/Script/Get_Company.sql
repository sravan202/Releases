SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[Get_Company]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
DROP PROCEDURE [DBO].[Get_Company]
GO
CREATE  PROCEDURE [dbo].[Get_Company]
/**********************************************************
Name		: Get_Company
Table		: Company
Updates		:
**********************************************************/
(
	@ID [INT] = NULL,
	@HasInterface bit = 0
)
AS
SET NOCOUNT ON

IF ISNULL(@ID, 0)>0
BEGIN
	SELECT
		C.ID,
		C.Name,
		AddressL1,
		AddressL2,
		City,
		StateID,
		PostalCode,
		ContactPerson,
		Phone,
		Fax,
		Email,
		WebSite,
		Active,
		DTSMapping,
		CaseTypeMapping,
		Comments,
		I.ID as InterfaceID
	FROM [Company] C WITH(NOLOCK) 
	LEFT OUTER JOIN [Interface] I WITH(NOLOCK)  on C.ID = I.CompanyID
	WHERE C.ID= @ID
END
ELSE
BEGIN
	SELECT
	C.ID,
	C.Name,
	AddressL1,
	AddressL2,
	City,
	StateID,
	PostalCode,
	ContactPerson,
	Phone,
	Fax,
	Email,
	WebSite,
	Active,
	DTSMapping,
	CaseTypeMapping,
	Comments,
	I.ID as InterfaceID

	FROM [Company] C WITH(NOLOCK)  
	LEFT OUTER JOIN [Interface] I WITH(NOLOCK) on C.ID = I.CompanyID
	where @HasInterface = 0 or (@HasInterface = 1 AND I.ID IS NOT NULL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
GRANT  EXECUTE  ON [DBO].[Get_Company]  TO [wswebuser]
GO