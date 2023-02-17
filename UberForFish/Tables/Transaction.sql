CREATE TABLE [dbo].[Transaction]
(
	[TransactionId] INT NOT NULL, 
    [WhaleId] INT NOT NULL, 
    [DateTime] DATETIME NOT NULL, 
    [FishId] INT NOT NULL, 
    [PickUpLocation] [sys].[geography] NULL, 
    [DropOffLocation] [sys].[geography] NULL, 
    [PickUpTime] DATETIME NULL, 
    [DropOffTime] DATETIME NULL, 
    [Cost] FLOAT NULL, 
    CONSTRAINT [PK_TransactionId] PRIMARY KEY ([TransactionId]), 
    CONSTRAINT [FK_WhaleId] FOREIGN KEY ([WhaleId]) REFERENCES [dbo].[Whale]([WhaleId]), 
    CONSTRAINT [FK_FishId] FOREIGN KEY ([FishId]) REFERENCES [dbo].[Fish]([FishId])    
)
