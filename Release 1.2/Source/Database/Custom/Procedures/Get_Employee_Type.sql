SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[Get_Employee_Type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
DROP PROCEDURE [DBO].[Get_Employee_Type]
GO
CREATE PROCEDURE Get_Employee_Type
/**********************************************************
Name                   :Get_Employee_Type
Table                   :Employee_Type
Updates               :
**********************************************************/
(
@ID[INT]
)
AS
SET NOCOUNT ON

SELECT
	ID,
	Name,
	Value

	FROM [Employee_Type] WITH(NOLOCK)

/*DECLARE @USER_EMT_ID INT
SELECT @USER_EMT_ID = USER_EMT_ID FROM WST_USER WHERE USER_ID = @USER_ID

IF ISNULL( @EMT_ID,0)>0
BEGIN
	
SELECT
	EMT_ID,
	EMT_NAME,
	EMT_VALUE

	FROM [WST_EMPLOYEE_TYPE] WITH(NOLOCK)
	INNER JOIN WST_EMT_HIERARCHY ON EMTHY_DEST_EMT_ID = EMT_ID
	WHERE EMT_ID= @EMT_ID AND EMTHY_SRC_EMT_ID = @USER_EMT_ID
END
ELSE
BEGIN

SELECT
	EMT_ID,
	EMT_NAME,
	EMT_VALUE

	FROM [WST_EMPLOYEE_TYPE] WITH(NOLOCK)
	LEFT OUTER JOIN WST_EMT_HIERARCHY ON EMTHY_DEST_EMT_ID = EMT_ID
	WHERE EMTHY_SRC_EMT_ID = @USER_EMT_ID OR (ISNULL(@IS_CREATE,0) =0 AND EMT_ID = @USER_EMT_ID)
END*/

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
GRANT  EXECUTE  ON [DBO].[Get_Employee_Type]  TO [wswebuser]
GO
