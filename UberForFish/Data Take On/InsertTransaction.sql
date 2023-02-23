DECLARE @pointA  GEOGRAPHY = [dbo].[getGeography](-33.8,18.38)
DECLARE @pointB  GEOGRAPHY = [dbo].[getGeography](-33.81,18.46)
DECLARE @pointC  GEOGRAPHY = [dbo].[getGeography](-33.9,18.42)
DECLARE @pointD  GEOGRAPHY = [dbo].[getGeography](-33.95,18.37)

EXEC [dbo].[sp_transactionInsert] @whaleId = 1, @fishId = 3,	@pickUpLocation = @pointA,	@dropOffLocation = @pointB

EXEC [dbo].[sp_transactionInsert] @whaleId = 3, @fishId = 5,	@pickUpLocation = @pointD,	@dropOffLocation = @pointB

EXEC [dbo].[sp_transactionInsert] @whaleId = 5, @fishId = 1,	@pickUpLocation = @pointC,	@dropOffLocation = @pointB

EXEC [dbo].[sp_transactionInsert] @whaleId = 1, @fishId = 11,	@pickUpLocation = @pointA,	@dropOffLocation = @pointB

EXEC [dbo].[sp_transactionInsert] @whaleId = 5, @fishId = 11,	@pickUpLocation = @pointA,	@dropOffLocation = @pointC

EXEC [dbo].[sp_transactionInsert] @whaleId = 3, @fishId = 3,	@pickUpLocation = @pointD,	@dropOffLocation = @pointB