-- whale rating
DECLARE @r INT

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 1,	@usertype = 1, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 2,	@usertype = 1, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 3,	@usertype = 1, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 4,	@usertype = 1, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 5,	@usertype = 1, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 6,	@usertype = 1, @rating = @r

--fish rating
SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 1,	@usertype = 2, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 2,	@usertype = 2, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 3,	@usertype = 2, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 4,	@usertype = 2, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 5,	@usertype = 2, @rating = @r

SET @r = ROUND(RAND()*(5- 1) + 1, 0)
EXEC [dbo].[sp_ratingUpSert] @tranId = 6,	@usertype = 2, @rating = @r