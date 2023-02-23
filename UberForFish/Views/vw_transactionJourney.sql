CREATE VIEW [dbo].[vw_transactionJourney] AS 
SELECT
	tj.Date,
	tj.Whale,
	tj.[Type] as [Whale Type],
	tj.Fish,
	tj.[Pick Up Location],
	tj.[Drop Off Location],
	CAST([dbo].[udf_convertMeterToNauticalMile](tj.[Distance In Meters]) AS DECIMAL(38,2)) AS [Distance in Nautical Miles],
	tj.[Pick Up Time],
	tj.[Drop Off Time],
	tj.[Trip Cost] AS [Trip Card(Ocean Dollars)],
	tj.WhaleRating AS [Whale Rating],
	tj.FishRating AS [Fish Rating]
	FROM 
	(
	SELECT
		CONCAT(w.[Name], ' ', w.[LastName]) as [Whale],
		wt.[Type],
		CAST([DateTime] AS DATE ) AS [Date],
		CONCAT(f.[Name], ' ', f.[LastName]) as [Fish],
		CONCAT([PickUpLocation].Lat, '° , ' ,[PickUpLocation].Long, '°') as [Pick Up Location],
		CONCAT([DropOffLocation].Lat, '° , ' ,[DropOffLocation].Long,'°') as [Drop Off Location],
		([dbo].[udf_calculateDistanceInMeters]([PickUpLocation],[DropOffLocation])) AS [Distance In Meters],
		[PickUpTime] AS [Pick Up Time],
		[DropOffTime] AS [Drop Off Time],
		CAST([Cost] AS DECIMAL(38,2)) AS [Trip Cost],
		r.WhaleRating,
		r.FishRating
	FROM [dbo].[Transaction] as t
		LEFT JOIN [dbo].[Whale] w
			ON t.WhaleId = w.WhaleId
		LEFT JOIN [dbo].[Fish] f
			ON t.FishId = f.FishId
		INNER JOIN [dbo].[WhaleType] wt
			ON w.WhaleTypeId = wt.WhaleTypeId
		INNER JOIN [dbo].[Rating] r
			ON t.TransactionId = r.TransactionId
	) AS tj
