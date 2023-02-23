CREATE VIEW [dbo].[vw_transactionJourney] AS 
	SELECT
		CONCAT(w.[Name], ' ', w.[LastName]) as [Whale],
		CAST([DateTime] AS DATE ) AS [Date],
		CONCAT(f.[Name], ' ', f.[LastName]) as [Fish],
		CONCAT([PickUpLocation].Lat, '° , ' ,[PickUpLocation].Long, '°') as [Pick Up Location],
		CONCAT([DropOffLocation].Lat, '° , ' ,[DropOffLocation].Long,'°') as [Drop Off Location],
		[PickUpTime] AS [Pick Up Time],
		[DropOffTime] AS [Drop Off Time],
		CAST([Cost] AS DECIMAL(38,2)) AS [Trip Cost]
	FROM [dbo].[Transaction] as t
		LEFT JOIN [dbo].[Whale] w
			ON t.WhaleId = w.WhaleId
		LEFT JOIN [dbo].[Fish] f
			ON t.FishId = f.FishId
