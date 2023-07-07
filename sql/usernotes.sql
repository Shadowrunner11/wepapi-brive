INSERT INTO [TestSchema].[User] (
	[Name],
	[Password],
	[RolId],
	[IsActive]
) VALUES (
	'Piero Ramirez',
	HASHBYTES('SHA2_512', 'BriveTrainee'),
	2,
	1
)

SELECT Id FROM [TestSchema].[User]

INSERT INTO [TestSchema].[Project](
	[Name],
	[UserId],
	[StatusId]
) VALUES ('Brive bootcamp', 4, 1)


INSERT INTO [TestSchema].[UserNote] (
  [Note],
  [UserId]
) VALUES ('Muy interesante: el instrcutor fue muy claro y empatico', 4)
