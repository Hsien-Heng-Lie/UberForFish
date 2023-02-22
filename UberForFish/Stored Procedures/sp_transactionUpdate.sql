-- Update a transactions pick up and drop off times
CREATE PROCEDURE [dbo].[sp_transactionUpdate]
	@tranId int ,
	@status INT
AS
	BEGIN TRY
		BEGIN TRAN
			DECLARE @pickUpTime DATETIME,
					@dropOffTime DATETIME

			-- 1 : Pick up
			IF (@status = 1)
				BEGIN
					SET @pickUpTime = GETDATE()
				END
			-- 2 : Drop Off
			ELSE IF (@status = 2)
				BEGIN
					SET @dropOffTime = GETDATE()
				END

			MERGE [dbo].[Transaction]
			USING 
			(
			SELECT 
				[PickUpTime],
				[DropOffTime]
				FROM [dbo].[Transaction] 
				WHERE [TransactionId] = @tranId
			) AS TransactionUpdate
			ON [Transaction].[TransactionId] = @tranId
			WHEN MATCHED THEN
			UPDATE SET  
				  [PickUpTime] = COALESCE(TransactionUpdate.[PickUpTime], @pickUpTime),
				  [DropOffTime] = COALESCE(TransactionUpdate.[DropOffTime], @dropOffTime)
				  ;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW 
	END CATCH
