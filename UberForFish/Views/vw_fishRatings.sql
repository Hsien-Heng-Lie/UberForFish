CREATE VIEW [dbo].[vw_fishRatings] AS
	SELECT  f.Name AS [Name],
			f.LastName AS [Last Name],
			rt.Trips AS [No. of Trips],
			CAST(rt.[Rating] AS DECIMAL(2,1)) [Average Rating]
	FROM 
	(
		SELECT 
		AVG(CAST(r.FishRating AS FLOAT)) AS [Rating],
		COUNT(t.FishId) AS [Trips],
		t.FishId
		FROM Rating AS r
			INNER JOIN [dbo].[Transaction] t
				ON r.TransactionId = t.TransactionId
		GROUP BY t.FishId
	) AS rt
		LEFT JOIN [dbo].[Fish] f
		ON rt.FishId = f.FishId
