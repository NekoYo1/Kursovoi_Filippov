USE [master]
GO
/****** Object:  Database [Kursovoi_Filippov1]    Script Date: 22.02.2023 7:19:35 ******/
CREATE DATABASE [Kursovoi_Filippov1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kursovoi_Filippov1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kursovoi_Filippov1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kursovoi_Filippov1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kursovoi_Filippov1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kursovoi_Filippov1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kursovoi_Filippov1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET  MULTI_USER 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kursovoi_Filippov1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kursovoi_Filippov1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kursovoi_Filippov1] SET QUERY_STORE = OFF
GO
USE [Kursovoi_Filippov1]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 22.02.2023 7:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IDClient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Tel] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IDClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListNedvez]    Script Date: 22.02.2023 7:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListNedvez](
	[IDNedvez] [int] NOT NULL,
	[TypeNameNedvez] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[IDClient] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_ListNedvez] PRIMARY KEY CLUSTERED 
(
	[IDNedvez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nedvez]    Script Date: 22.02.2023 7:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nedvez](
	[IDNedvez] [int] IDENTITY(1,1) NOT NULL,
	[IDTypeNameNedvez] [int] NOT NULL,
 CONSTRAINT [PK_Nedvez] PRIMARY KEY CLUSTERED 
(
	[IDNedvez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 22.02.2023 7:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeNameNedvez]    Script Date: 22.02.2023 7:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeNameNedvez](
	[IDTypeNameNedvez] [int] IDENTITY(1,1) NOT NULL,
	[TypeNameNedvez] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeNameNedvez] PRIMARY KEY CLUSTERED 
(
	[TypeNameNedvez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IDClient], [Name], [Surname], [Tel]) VALUES (1, N'Семён', N'Иванов', 1111)
INSERT [dbo].[Client] ([IDClient], [Name], [Surname], [Tel]) VALUES (2, N'Даниил', N'Копанев', 2222)
INSERT [dbo].[Client] ([IDClient], [Name], [Surname], [Tel]) VALUES (3, N'Сергей', N'Ушаков', 3333)
INSERT [dbo].[Client] ([IDClient], [Name], [Surname], [Tel]) VALUES (4, N'Егор', N'Тихонов', 4444)
INSERT [dbo].[Client] ([IDClient], [Name], [Surname], [Tel]) VALUES (5, N'Глеб', N'Чемерис', 5555)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ListNedvez] ON 

INSERT [dbo].[ListNedvez] ([IDNedvez], [TypeNameNedvez], [Price], [IDClient], [Photo]) VALUES (1, N'Квартира 1-к', 100.0000, 1, 0x68747470733A2F2F6D6E6F676F626C6F672E72752F77702D636F6E74656E742F75706C6F6164732F323031382F30342F6264332E706E67)
INSERT [dbo].[ListNedvez] ([IDNedvez], [TypeNameNedvez], [Price], [IDClient], [Photo]) VALUES (2, N'Квартира 2-к', 200.0000, 2, 0x68747470733A2F2F6D6E6F676F626C6F672E72752F77702D636F6E74656E742F75706C6F6164732F323031382F30342F6264332E706E67)
INSERT [dbo].[ListNedvez] ([IDNedvez], [TypeNameNedvez], [Price], [IDClient], [Photo]) VALUES (3, N'Квартира 3-к', 300.0000, 3, 0x68747470733A2F2F6D6E6F676F626C6F672E72752F77702D636F6E74656E742F75706C6F6164732F323031382F30342F6264332E706E67)
INSERT [dbo].[ListNedvez] ([IDNedvez], [TypeNameNedvez], [Price], [IDClient], [Photo]) VALUES (4, N'Дача', 400.0000, 5, 0x68747470733A2F2F6D6E6F676F626C6F672E72752F77702D636F6E74656E742F75706C6F6164732F323031382F30342F6264332E706E67)
SET IDENTITY_INSERT [dbo].[ListNedvez] OFF
GO
SET IDENTITY_INSERT [dbo].[Nedvez] ON 

INSERT [dbo].[Nedvez] ([IDNedvez], [IDTypeNameNedvez]) VALUES (1, 1)
INSERT [dbo].[Nedvez] ([IDNedvez], [IDTypeNameNedvez]) VALUES (2, 2)
INSERT [dbo].[Nedvez] ([IDNedvez], [IDTypeNameNedvez]) VALUES (3, 3)
INSERT [dbo].[Nedvez] ([IDNedvez], [IDTypeNameNedvez]) VALUES (4, 4)
INSERT [dbo].[Nedvez] ([IDNedvez], [IDTypeNameNedvez]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Nedvez] OFF
GO
INSERT [dbo].[Price] ([Price]) VALUES (100.0000)
INSERT [dbo].[Price] ([Price]) VALUES (200.0000)
INSERT [dbo].[Price] ([Price]) VALUES (300.0000)
INSERT [dbo].[Price] ([Price]) VALUES (400.0000)
INSERT [dbo].[Price] ([Price]) VALUES (500.0000)
GO
SET IDENTITY_INSERT [dbo].[TypeNameNedvez] ON 

INSERT [dbo].[TypeNameNedvez] ([IDTypeNameNedvez], [TypeNameNedvez]) VALUES (5, N'Гараж')
INSERT [dbo].[TypeNameNedvez] ([IDTypeNameNedvez], [TypeNameNedvez]) VALUES (4, N'Дача')
INSERT [dbo].[TypeNameNedvez] ([IDTypeNameNedvez], [TypeNameNedvez]) VALUES (1, N'Квартира 1-к')
INSERT [dbo].[TypeNameNedvez] ([IDTypeNameNedvez], [TypeNameNedvez]) VALUES (2, N'Квартира 2-к')
INSERT [dbo].[TypeNameNedvez] ([IDTypeNameNedvez], [TypeNameNedvez]) VALUES (3, N'Квартира 3-к')
SET IDENTITY_INSERT [dbo].[TypeNameNedvez] OFF
GO
ALTER TABLE [dbo].[ListNedvez]  WITH CHECK ADD  CONSTRAINT [FK_ListNedvez_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([IDClient])
GO
ALTER TABLE [dbo].[ListNedvez] CHECK CONSTRAINT [FK_ListNedvez_Client]
GO
ALTER TABLE [dbo].[ListNedvez]  WITH CHECK ADD  CONSTRAINT [FK_ListNedvez_Nedvez] FOREIGN KEY([IDNedvez])
REFERENCES [dbo].[Nedvez] ([IDNedvez])
GO
ALTER TABLE [dbo].[ListNedvez] CHECK CONSTRAINT [FK_ListNedvez_Nedvez]
GO
ALTER TABLE [dbo].[ListNedvez]  WITH CHECK ADD  CONSTRAINT [FK_ListNedvez_Price] FOREIGN KEY([Price])
REFERENCES [dbo].[Price] ([Price])
GO
ALTER TABLE [dbo].[ListNedvez] CHECK CONSTRAINT [FK_ListNedvez_Price]
GO
ALTER TABLE [dbo].[ListNedvez]  WITH CHECK ADD  CONSTRAINT [FK_ListNedvez_TypeNameNedvez] FOREIGN KEY([TypeNameNedvez])
REFERENCES [dbo].[TypeNameNedvez] ([TypeNameNedvez])
GO
ALTER TABLE [dbo].[ListNedvez] CHECK CONSTRAINT [FK_ListNedvez_TypeNameNedvez]
GO
USE [master]
GO
ALTER DATABASE [Kursovoi_Filippov1] SET  READ_WRITE 
GO
