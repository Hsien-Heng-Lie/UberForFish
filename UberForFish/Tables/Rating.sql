CREATE TABLE [dbo].[Rating]
(
	[RatingId] INT NOT NULL IDENTITY(1,1), 
    [TransactionId] INT NULL, 
    [WhaleRating] INT NULL, 
    [FishRating] INT NULL, 
    CONSTRAINT [PK_RatingId] PRIMARY KEY ([RatingId]), 
    CONSTRAINT [FK_Rating_TransactionId] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction]([TransactionId]), 
    CONSTRAINT [CK_Rating_WhaleRating] CHECK ([WhaleRating] < 6),
    CONSTRAINT [CK_Rating_FishRating] CHECK ([FishRating] < 6)
)
