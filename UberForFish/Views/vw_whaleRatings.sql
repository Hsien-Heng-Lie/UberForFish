﻿CREATE VIEW [dbo].[vw_whaleRatings]	AS 
	SELECT CAST(rt.[Rating] AS DECIMAL(2,1)) [Average Rating],
		w.Name AS [Name],
		w.LastName AS [Last Name]
	FROM 
	(
		SELECT 
		AVG(CAST(r.WhaleRating AS FLOAT)) AS [Rating],
		t.WhaleId
		FROM Rating AS r
			INNER JOIN [dbo].[Transaction] t
				ON r.TransactionId = t.TransactionId
		GROUP BY t.WhaleId
	) AS rt
		LEFT JOIN [dbo].[Whale] w
			ON rt.WhaleId = w.WhaleId