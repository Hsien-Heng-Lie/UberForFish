CREATE FUNCTION [dbo].[udf_calculateDistanceInMeters]
(
@point_a GEOGRAPHY,
@point_b GEOGRAPHY
)
RETURNS FLOAT
AS
BEGIN
  DECLARE @distance FLOAT

  SELECT @distance = @point_a.STDistance(@point_b)

  RETURN @distance
END