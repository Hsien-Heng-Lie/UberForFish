CREATE TABLE [dbo].[Fish]
(
	[FishId] INT NOT NULL IDENTITY(1,1), 
    [Name] VARCHAR(150) NOT NULL, 
    [LastName] VARCHAR(150) NOT NULL, 
    [Email] VARCHAR(100) NOT NULL, 
    [MobileNumber] VARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_FishId] PRIMARY KEY ([FishId]), 
    CONSTRAINT [UQ_FishEmail] UNIQUE ([Email])

)
