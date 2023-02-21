CREATE FUNCTION [dbo].[convertNauticalMileToMeter]
(
@mile FLOAT
)
RETURNS FLOAT
AS
BEGIN
  DECLARE @meter FLOAT
  DECLARE @conversion FLOAT = 1852

  SELECT @meter = (@meter * @conversion)

  RETURN @meter
END