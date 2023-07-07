CREATE SCHEMA [TestSchema];

CREATE TABLE IF NOT EXISTS [TestSchema].[Products] (ProductID int PRIMARY KEY NOT NULL,
    ProductName varchar(25) NOT NULL,
    Price money NULL,
    ProductDescription varchar(max) NULL
)

CREATE TABLE IF NOT EXISTS [TestSchema].[CatRol] (
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[Name] VARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULL
)

CREATE TABLE IF NOT EXISTS [TestSchema].[CatStatus]  (
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[Name] VARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULL
)

CREATE TABLE IF NOT EXISTS [TestSchema].[User] (
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[Name] VARCHAR(100) NOT NULL,
	[Password] BINARY(64) NOT NULL,
	[RolId] INT FOREIGN KEY REFERENCES [TestSchema].[CatRol]([Id]),
	[IsActive] BIT NOT NULL
)

CREATE TABLE IF NOT EXISTS [TestSchema].[UserNote](
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[Note] VARCHAR(50) NOT NULL,
	[UserId] INT FOREIGN KEY REFERENCES [TestSchema].[User]([Id])
)

CREATE TABLE IF NOT EXISTS [TestSchema].[Project] (
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[Name] VARCHAR(500) NOT NULL,
	[UserId] INT FOREIGN KEY REFERENCES [TestSchema].[User]([Id]),
	[StatusId] INT FOREIGN KEY REFERENCES [TestSchema].[CatStatus]([Id])
)

