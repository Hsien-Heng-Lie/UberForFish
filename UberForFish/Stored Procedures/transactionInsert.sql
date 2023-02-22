--Insert transaction when whale confirms fish trip

CREATE PROCEDURE [dbo].[transactionInsert]
		@whaleId INT,
		@fishId INT,
		@pickUpLocation GEOGRAPHY,
		@dropOffLocation GEOGRAPHY
AS
	BEGIN TRY


		DECLARE @distance FLOAT= [dbo].[calculateDistanceInMeters](@pickUpLocation,@dropOffLocation),
				@cost FLOAT ;
		SET @cost = [dbo].[calculateWhaleTravelCost](@whaleId, @distance)


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
