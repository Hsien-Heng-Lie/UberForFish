CREATE TABLE [dbo].[Whale]
(
	[WhaleId] INT NOT NULL IDENTITY(1,1) , 
    [Name] VARCHAR(150) NOT NULL, 
    [LastName] VARCHAR(150) NOT NULL, 
    [Email] VARCHAR(150) NOT NULL, 
    [MobileNumber] VARCHAR(10)NOT NULL, 
    [WhaleTypeId] INT NULL, 
    CONSTRAINT [PK_WhaleId] PRIMARY KEY ([WhaleId]), 
    CONSTRAINT [FK_WhaleTypeId] FOREIGN KEY ([WhaleTypeId]) REFERENCES [dbo].[WhaleType]([WhaleTypeId]), 
    CONSTRAINT [UQ_WhaleEmail] UNIQUE ([Email])
)
