--Insert transaction when whale confirms fish trip

CREATE PROCEDURE [dbo].[sp_transactionInsert]
		@whaleId INT,
		@fishId INT,
		@pickUpLocation GEOGRAPHY,
		@dropOffLocation GEOGRAPHY
AS
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [dbo].[Transaction]
			   ([WhaleId],
			   [DateTime],
			   [FishId],
			   [PickUpLocation],
			   [DropOffLocation]
			    )
			 VALUES
				(@whaleId,
				GETDATE(),
				@fishId,
				@pickUpLocation,
				@dropOffLocation
				)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW 
	END CATCH
