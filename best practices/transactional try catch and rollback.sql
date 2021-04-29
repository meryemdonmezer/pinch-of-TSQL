BEGIN TRY
	BEGIN TRANSACTION;

	/* CODE BLOCK */
		CREATE TABLE _TEST(Id int)
		INSERT INTO _TEST VALUES (1),(2),(3),(4)
		SELECT * FROM _TEST
	/* CODE BLOCK */

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	DECLARE @Error_Message nvarchar(4000),
	@Error_Severity int,
	@Error_State int;

	SELECT @Error_Message = ERROR_MESSAGE(),  
        @Error_Severity = ERROR_SEVERITY(),  
        @Error_State = ERROR_STATE();  

	-- Custom error throw
	RAISERROR (@Error_Message,@Error_Severity,@Error_State);  

	-- Original error throw
	-- THROW;

	IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END
END CATCH;


