--Stored Procedure to update or insert a rating
CREATE PROCEDURE [dbo].[sp_ratingUpSert]
	@tranId int ,
	@usertype INT,
	@rating INT
AS
	BEGIN TRY
		BEGIN TRAN
			DECLARE @whaleId INT,
					@fishId INT,
					@whaleRating INT = NULL,
					@fishRating INT = NULL

			SELECT @fishId = FishId FROM [dbo].[Transaction] WHERE [TransactionId] = @tranId
			SELECT @whaleId = WhaleId FROM [dbo].[Transaction] WHERE [TransactionId] = @tranId

			-- 1 : Whale
			IF (@usertype = 1)
				BEGIN
					SET @whaleRating = @rating
				END
			-- 2 : Fish
			ELSE IF (@usertype = 2)
				BEGIN
					SET @fishRating = @rating
				END
			
			MERGE [dbo].[Rating]
			USING 
			(
			SELECT 
				@whaleRating as [WhaleRating],
				@fishRating as [FishRating],
				@tranId as [TransactionId]
			) AS RatingUpSert
			ON [Rating].[TransactionId] = [RatingUpSert].[TransactionId]
			WHEN NOT MATCHED THEN
			INSERT(
				[TransactionId],
				[WhaleRating],
				[FishRating]
			)
			VALUES(
				@tranId,
				@whaleRating,
				@fishRating
			)
			WHEN MATCHED THEN
			UPDATE SET  
					[WhaleRating] = COALESCE([Rating].[WhaleRating], @whaleRating),
					[FishRating] = COALESCE([Rating].[FishRating], @fishRating)
					;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW 
	END CATCH