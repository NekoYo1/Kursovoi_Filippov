USE [master]
GO
/****** Object:  Database [AgenstvoNedvezj]    Script Date: 28.02.2023 11:44:43 ******/
CREATE DATABASE [AgenstvoNedvezj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TyrAgenstvo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TyrAgenstvo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TyrAgenstvo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TyrAgenstvo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AgenstvoNedvezj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgenstvoNedvezj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgenstvoNedvezj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgenstvoNedvezj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgenstvoNedvezj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgenstvoNedvezj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgenstvoNedvezj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgenstvoNedvezj] SET  MULTI_USER 
GO
ALTER DATABASE [AgenstvoNedvezj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgenstvoNedvezj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgenstvoNedvezj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgenstvoNedvezj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AgenstvoNedvezj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AgenstvoNedvezj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AgenstvoNedvezj] SET QUERY_STORE = OFF
GO
USE [AgenstvoNedvezj]
GO
/****** Object:  Table [dbo].[Nedvezj]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nedvezj](
	[IdNedvezj] [int] IDENTITY(1,1) NOT NULL,
	[IdNedvezjType] [int] NOT NULL,
	[IdRayon] [int] NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[Square] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Opisanie] [nvarchar](max) NOT NULL,
	[IdProdavec] [int] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Actual] [bit] NOT NULL,
 CONSTRAINT [PK_Nedvezj] PRIMARY KEY CLUSTERED 
(
	[IdNedvezj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NedvezjType]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NedvezjType](
	[IdNedvezjType] [int] IDENTITY(1,1) NOT NULL,
	[NedvezjTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NedvezjType] PRIMARY KEY CLUSTERED 
(
	[IdNedvezjType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodavec]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodavec](
	[IdProdavec] [int] IDENTITY(1,1) NOT NULL,
	[Familia] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Otchestvo] [nvarchar](50) NOT NULL,
	[Tel] [nvarchar](17) NOT NULL,
 CONSTRAINT [PK_Prodavec] PRIMARY KEY CLUSTERED 
(
	[IdProdavec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rayon]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rayon](
	[IdRayon] [int] IDENTITY(1,1) NOT NULL,
	[NameRayona] [nvarchar](50) NOT NULL,
	[NumRayona] [int] NOT NULL,
 CONSTRAINT [PK_Rayon] PRIMARY KEY CLUSTERED 
(
	[IdRayon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sdelki]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sdelki](
	[IdSdelki] [int] NOT NULL,
	[IdNedvej] [int] NOT NULL,
	[IdProdavec] [int] NOT NULL,
	[DateSdelki] [date] NOT NULL,
	[KomissiaAgenstva] [int] NOT NULL,
 CONSTRAINT [PK_Sdelki] PRIMARY KEY CLUSTERED 
(
	[IdSdelki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.02.2023 11:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[idProdavec] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Nedvezj] ON 

INSERT [dbo].[Nedvezj] ([IdNedvezj], [IdNedvezjType], [IdRayon], [Address], [Square], [Price], [Opisanie], [IdProdavec], [Image], [Actual]) VALUES (1, 1, 1, N'ул. Победы,14', 20, 2153345, N'Квартира около центра, магазины в доступности', 2, N'P1', 1)
INSERT [dbo].[Nedvezj] ([IdNedvezj], [IdNedvezjType], [IdRayon], [Address], [Square], [Price], [Opisanie], [IdProdavec], [Image], [Actual]) VALUES (3, 2, 3, N'ул. Амурская, 10', 25, 4235534, N'Евро ремонт, газовая плитка', 3, N'P2', 0)
INSERT [dbo].[Nedvezj] ([IdNedvezj], [IdNedvezjType], [IdRayon], [Address], [Square], [Price], [Opisanie], [IdProdavec], [Image], [Actual]) VALUES (4, 3, 4, N'ул. Победы, 25', 30, 5345345, N'Электро плитка, с мебелью', 4, N'P3', 1)
INSERT [dbo].[Nedvezj] ([IdNedvezj], [IdNedvezjType], [IdRayon], [Address], [Square], [Price], [Opisanie], [IdProdavec], [Image], [Actual]) VALUES (6, 4, 5, N'пр. Комсомольский, 50', 35, 3414124, N'Советский ремонт', 5, N'P4', 1)
INSERT [dbo].[Nedvezj] ([IdNedvezj], [IdNedvezjType], [IdRayon], [Address], [Square], [Price], [Opisanie], [IdProdavec], [Image], [Actual]) VALUES (10, 5, 7, N'пр. Октябарский, 15', 10, 4232223, N'Отопление, под одну машину', 6, N'P5', 1)
SET IDENTITY_INSERT [dbo].[Nedvezj] OFF
GO
SET IDENTITY_INSERT [dbo].[NedvezjType] ON 

INSERT [dbo].[NedvezjType] ([IdNedvezjType], [NedvezjTypeName]) VALUES (1, N'Квартира 1-к')
INSERT [dbo].[NedvezjType] ([IdNedvezjType], [NedvezjTypeName]) VALUES (2, N'Квартира 2-к')
INSERT [dbo].[NedvezjType] ([IdNedvezjType], [NedvezjTypeName]) VALUES (3, N'Квартира 3-к')
INSERT [dbo].[NedvezjType] ([IdNedvezjType], [NedvezjTypeName]) VALUES (4, N'Квартира 4-к')
INSERT [dbo].[NedvezjType] ([IdNedvezjType], [NedvezjTypeName]) VALUES (5, N'Гараж')
SET IDENTITY_INSERT [dbo].[NedvezjType] OFF
GO
SET IDENTITY_INSERT [dbo].[Prodavec] ON 

INSERT [dbo].[Prodavec] ([IdProdavec], [Familia], [Name], [Otchestvo], [Tel]) VALUES (2, N'Иванов', N'Семён', N'Евгеньевич', N'777777777')
INSERT [dbo].[Prodavec] ([IdProdavec], [Familia], [Name], [Otchestvo], [Tel]) VALUES (3, N'Копанев', N'Даниил', N'Олегович', N'788888888')
INSERT [dbo].[Prodavec] ([IdProdavec], [Familia], [Name], [Otchestvo], [Tel]) VALUES (4, N'Ушаков', N'Сергей', N'Александрович', N'799999999')
INSERT [dbo].[Prodavec] ([IdProdavec], [Familia], [Name], [Otchestvo], [Tel]) VALUES (5, N'Тихонов', N'Егор', N'Олегович', N'766666666')
INSERT [dbo].[Prodavec] ([IdProdavec], [Familia], [Name], [Otchestvo], [Tel]) VALUES (6, N'Филиппов', N'Константин', N'Павлович', N'755555555')
SET IDENTITY_INSERT [dbo].[Prodavec] OFF
GO
SET IDENTITY_INSERT [dbo].[Rayon] ON 

INSERT [dbo].[Rayon] ([IdRayon], [NameRayona], [NumRayona]) VALUES (1, N'Восьмой', 8)
INSERT [dbo].[Rayon] ([IdRayon], [NameRayona], [NumRayona]) VALUES (3, N'Южный', 5)
INSERT [dbo].[Rayon] ([IdRayon], [NameRayona], [NumRayona]) VALUES (4, N'Октябарский', 1)
INSERT [dbo].[Rayon] ([IdRayon], [NameRayona], [NumRayona]) VALUES (5, N'Центральный', 2)
INSERT [dbo].[Rayon] ([IdRayon], [NameRayona], [NumRayona]) VALUES (7, N'Промышленный', 3)
SET IDENTITY_INSERT [dbo].[Rayon] OFF
GO
INSERT [dbo].[Sdelki] ([IdSdelki], [IdNedvej], [IdProdavec], [DateSdelki], [KomissiaAgenstva]) VALUES (1, 1, 2, CAST(N'2023-02-22' AS Date), 10)
INSERT [dbo].[Sdelki] ([IdSdelki], [IdNedvej], [IdProdavec], [DateSdelki], [KomissiaAgenstva]) VALUES (2, 3, 3, CAST(N'2023-02-23' AS Date), 10)
INSERT [dbo].[Sdelki] ([IdSdelki], [IdNedvej], [IdProdavec], [DateSdelki], [KomissiaAgenstva]) VALUES (3, 4, 4, CAST(N'2023-02-24' AS Date), 15)
INSERT [dbo].[Sdelki] ([IdSdelki], [IdNedvej], [IdProdavec], [DateSdelki], [KomissiaAgenstva]) VALUES (4, 6, 5, CAST(N'2023-02-25' AS Date), 10)
INSERT [dbo].[Sdelki] ([IdSdelki], [IdNedvej], [IdProdavec], [DateSdelki], [KomissiaAgenstva]) VALUES (5, 10, 6, CAST(N'2023-02-26' AS Date), 5)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (2, N'IS', N'111', 2)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (3, N'KD', N'222', 3)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (4, N'YS', N'333', 4)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (5, N'TE', N'444', 5)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (6, N'FK', N'555', 6)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (7, N'KK', N'123', NULL)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (8, N'sa', N'sa2019', NULL)
INSERT [dbo].[Users] ([idUser], [Login], [Password], [idProdavec]) VALUES (9, N'SEMEN', N'semeN', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Nedvezj]  WITH CHECK ADD  CONSTRAINT [FK_Nedvezj_NedvezjType] FOREIGN KEY([IdNedvezjType])
REFERENCES [dbo].[NedvezjType] ([IdNedvezjType])
GO
ALTER TABLE [dbo].[Nedvezj] CHECK CONSTRAINT [FK_Nedvezj_NedvezjType]
GO
ALTER TABLE [dbo].[Nedvezj]  WITH CHECK ADD  CONSTRAINT [FK_Nedvezj_Prodavec] FOREIGN KEY([IdProdavec])
REFERENCES [dbo].[Prodavec] ([IdProdavec])
GO
ALTER TABLE [dbo].[Nedvezj] CHECK CONSTRAINT [FK_Nedvezj_Prodavec]
GO
ALTER TABLE [dbo].[Nedvezj]  WITH CHECK ADD  CONSTRAINT [FK_Nedvezj_Rayon] FOREIGN KEY([IdRayon])
REFERENCES [dbo].[Rayon] ([IdRayon])
GO
ALTER TABLE [dbo].[Nedvezj] CHECK CONSTRAINT [FK_Nedvezj_Rayon]
GO
ALTER TABLE [dbo].[Sdelki]  WITH CHECK ADD  CONSTRAINT [FK_Sdelki_Nedvezj] FOREIGN KEY([IdNedvej])
REFERENCES [dbo].[Nedvezj] ([IdNedvezj])
GO
ALTER TABLE [dbo].[Sdelki] CHECK CONSTRAINT [FK_Sdelki_Nedvezj]
GO
ALTER TABLE [dbo].[Sdelki]  WITH CHECK ADD  CONSTRAINT [FK_Sdelki_Prodavec] FOREIGN KEY([IdProdavec])
REFERENCES [dbo].[Prodavec] ([IdProdavec])
GO
ALTER TABLE [dbo].[Sdelki] CHECK CONSTRAINT [FK_Sdelki_Prodavec]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Prodavec] FOREIGN KEY([idProdavec])
REFERENCES [dbo].[Prodavec] ([IdProdavec])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Prodavec]
GO
USE [master]
GO
ALTER DATABASE [AgenstvoNedvezj] SET  READ_WRITE 
GO
