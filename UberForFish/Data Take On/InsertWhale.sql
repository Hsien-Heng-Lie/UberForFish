INSERT INTO [dbo].Whale
(Name, LastName, Email,MobileNumber,WhaleTypeId)
VALUES
('Gary','Edwards','garyed@hotmail.com','0846561111',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Humpback')),
('Juan','Cuadrado','jc0204@gmail.com','0496324879',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Killer')),
('Jamie','Orr','vwenthusiast23@gmail.com','0648513632',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Brown')),
('Nelly','Furtado','promiscuousgirl@hotmail.com','0476219865',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Blue')),
('Bernie','Mac','berniemac@gmail.com','0876562149',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Sperm')),
('Pedro','Porro','perdop@gmail.com','0632195678',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Bowhead')),
('Dan','Bilzerian','danbilzerian@gmail.com','0845634789',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Gray')),
('George','Costanza','georgecostanza@nyyankees.com','0762875645',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'sei')),
('Ed','Helms','edhelms@gmail.com','0815486357',(SELECT [WhaleTypeId] FROM [WhaleType] WHERE [Type] = 'Beluga'))
;