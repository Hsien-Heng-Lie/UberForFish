CREATE FUNCTION [dbo].[udf_getGeography]
(
@latitude FLOAT,
@longitude FLOAT
)
RETURNS GEOGRAPHY
AS
BEGIN
  DECLARE @geo GEOGRAPHY

  SELECT @geo = GEOGRAPHY::Point(@latitude, @longitude, 4326)

  RETURN @geo
END