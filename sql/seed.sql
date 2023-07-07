INSERT INTO [TestSchema].[CatRol] ([Name], [IsActive]) VALUES ('BackEnd', 1), ('FrontEnd', 1), ('Tester', 1)

INSERT INTO [TestSchema].[User] (
	[Name],
	[Password],
	[RolId],
	[IsActive]
) VALUES (
	'Pollito',
	HASHBYTES('SHA2_512', '1234ASDF'),
	2,
	1
),(
	'Vaquita',
	HASHBYTES('SHA2_512', '1234ASDF'),
	3,
	1
)

INSERT INTO [TestSchema].[CatStatus](
	[Name], 
	[IsActive]
) VALUES 
	('Active', 1),
	('Inactive', 1),
	('Finalize', 1)
	
INSERT INTO [TestSchema].[Project](
	[Name],
	[UserId],
	[StatusId]
) VALUES ('Pollito con papas', 1, 1)

INSERT INTO [TestSchema].[Project](
	[Name],
	[UserId],
	[StatusId]
) VALUES 
('Zeus', 3, 1),
('Poseidon',4,1)



SELECT Id from TestSchema.[User]

UPDATE [TestSchema].[Project]
SET [StatusId] = 3
WHERE [StatusId] = 1


SELECT U.Name , CR.Name FROM (SELECT Name, RolId FROM TestSchema.[USER] WHERE Id = 1) as U
JOIN TestSchema.[CatRol] as CR on U.RolId = CR.Id  


SELECT * FROM [TestSchema].[User] WHERE Name = 'Pollito' AND Password = HASHBYTES('SHA2_512', '1234ASDF')

CREATE PROCEDURE [TestSchema].[GetUserByNameAndPassword] @name nvarchar(100), @password nvarchar(100)
AS
	SELECT * FROM [TestSchema].[User] WHERE Name = @name AND Password = HASHBYTES('SHA2_512', @password);

EXEC [TestSchema].GetUserByNameAndPassword N'Pollito', N'1234ASDF'
