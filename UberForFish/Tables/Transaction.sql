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
    CONSTRAINT [FK_Transaction_WhaleId] FOREIGN KEY ([WhaleId]) REFERENCES [dbo].[Whale]([WhaleId]), 
    CONSTRAINT [FK_Transaction_FishId] FOREIGN KEY ([FishId]) REFERENCES [dbo].[Fish]([FishId]), 
    CONSTRAINT [UQ_Transaction] UNIQUE ([WhaleId], [DateTime], [FishId])    
)
