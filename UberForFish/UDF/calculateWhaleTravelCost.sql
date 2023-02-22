CREATE FUNCTION [dbo].[calculateWhaleTravelCost]
(
	@whaleId int,
	@distance int
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @cost FLOAT

		SET @cost = (
					SELECT  wt.CostPerMile * [dbo].[convertMeterToNauticalMile](@distance) as cost
							from [dbo].[Whale] as w
							inner join [dbo].[WhaleType] wt
							on w.WhaleTypeId = wt.WhaleTypeId
							where w.WhaleId = @whaleId
					)

	RETURN @cost
END
