UPDATE [dbo].[Transaction]
SET PickUpTime = GETDATE()

UPDATE [dbo].[Transaction]
SET DropOffTime = DATEADD(minute, RAND()*30 + 10, GETDATE())
WHERE TransactionId % 2 = 0

UPDATE [dbo].[Transaction]
SET DropOffTime = DATEADD(minute, RAND()*30, GETDATE())
WHERE TransactionId % 2 = 1