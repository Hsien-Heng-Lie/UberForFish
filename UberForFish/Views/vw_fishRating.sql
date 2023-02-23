CREATE VIEW [dbo].[vw_fishRating] AS
	SELECT  f.Name AS [Name],
			f.LastName AS [Last Name],
			CAST(rt.[Rating] AS DECIMAL(2,1)) [Average Rating]
	FROM 
	(
		SELECT 
		AVG(CAST(r.FishRating AS FLOAT)) AS [Rating],
		t.FishId
		FROM Rating AS r
			INNER JOIN [dbo].[Transaction] t
				ON r.TransactionId = t.TransactionId
		GROUP BY t.FishId
	) AS rt
		LEFT JOIN [dbo].[Fish] f
		ON rt.FishId = f.FishId
