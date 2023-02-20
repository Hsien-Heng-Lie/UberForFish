CREATE TABLE [dbo].[WhaleType]
(
	[WhaleTypeId] INT NOT NULL IDENTITY(1,1), 
    [Type] VARCHAR(150) NOT NULL, 
    [CostPerMile] FLOAT NOT NULL, 
    [Capacity] INT NOT NULL, 
    [AvgTravelSpeed] FLOAT NOT NULL, 
    CONSTRAINT [PK_WhaleTypeId] PRIMARY KEY ([WhaleTypeId]), 
    CONSTRAINT [UQ_WhaleType] UNIQUE ([Type])
)
