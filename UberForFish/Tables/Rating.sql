CREATE TABLE [dbo].[Rating]
(
	[RatingId] INT NOT NULL IDENTITY(1,1), 
    [WhaleId] INT NULL, 
    [FishId] INT NULL, 
    [TransactionId] INT NULL, 
    [WhaleRating] INT NULL, 
    [FishRating] INT NULL, 
    CONSTRAINT [PK_RatingId] PRIMARY KEY ([RatingId]), 
    CONSTRAINT [FK_Rating_WhaleId] FOREIGN KEY ([WhaleId]) REFERENCES [dbo].[Whale]([WhaleId]),
    CONSTRAINT [FK_Rating_FishId] FOREIGN KEY ([FishId]) REFERENCES [dbo].[Fish]([FishId]),
    CONSTRAINT [FK_Rating_TransactionId] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction]([TransactionId])
)
