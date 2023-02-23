--Insert transaction when whale confirms fish trip

CREATE PROCEDURE [dbo].[sp_transactionInsert]
		@whaleId INT,
		@fishId INT,
		@pickUpLocation GEOGRAPHY,
		@dropOffLocation GEOGRAPHY
AS
	BEGIN TRY


		DECLARE @distance FLOAT= [dbo].[udf_calculateDistanceInMeters](@pickUpLocation,@dropOffLocation),
				@cost FLOAT ;

		SET @cost = [dbo].[udf_calculateWhaleTravelCost](@whaleId, @distance)


		BEGIN TRAN
			INSERT INTO [dbo].[Transaction]
			   ([WhaleId],
			   [DateTime],
			   [FishId],
			   [PickUpLocation],
			   [DropOffLocation],
			   [Cost]
			    )
			 VALUES
				(@whaleId,
				GETDATE(),
				@fishId,
				@pickUpLocation,
				@dropOffLocation,
				@cost
				)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW 
	END CATCH
