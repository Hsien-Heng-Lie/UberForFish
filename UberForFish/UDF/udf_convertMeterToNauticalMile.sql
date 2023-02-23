CREATE FUNCTION [dbo].[udf_convertMeterToNauticalMile]
(
@meter FLOAT
)
RETURNS FLOAT
AS
BEGIN
  DECLARE @mile FLOAT
  DECLARE @conversion FLOAT = 1852

  SELECT @mile = (@meter/@conversion)

  RETURN @mile
END