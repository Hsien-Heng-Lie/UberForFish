CREATE VIEW [dbo].[vw_whaleRatings]	AS 
	SELECT w.Name AS [Name],
		w.LastName AS [Last Name],
		rt.Trips AS [No. of Trips],
		CAST(rt.[Rating] AS DECIMAL(2,1)) [Average Rating]
	FROM 
	(
		SELECT 
		AVG(CAST(r.WhaleRating AS FLOAT)) AS [Rating],
		COUNT(t.WhaleId) AS [Trips],
		t.WhaleId
		FROM Rating AS r
			INNER JOIN [dbo].[Transaction] t
				ON r.TransactionId = t.TransactionId
		GROUP BY t.WhaleId
	) AS rt
		LEFT JOIN [dbo].[Whale] w
			ON rt.WhaleId = w.WhaleId
