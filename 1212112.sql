USE [master]
GO
/****** Object:  Database [cafe]    Script Date: 05.03.2024 13:55:50 ******/
CREATE DATABASE [cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\cafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\cafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cafe] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cafe] SET  MULTI_USER 
GO
ALTER DATABASE [cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cafe] SET QUERY_STORE = OFF
GO
USE [cafe]
GO
/****** Object:  Table [dbo].[Gang]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gang](
	[Name] [nvarchar](100) NULL,
	[Date] [date] NULL,
	[id_gang] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Gang] PRIMARY KEY CLUSTERED 
(
	[id_gang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gang_user]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gang_user](
	[id_user] [int] NULL,
	[id_gang] [int] NULL,
	[id_user_gang] [int] NOT NULL,
 CONSTRAINT [PK_Gang_user] PRIMARY KEY CLUSTERED 
(
	[id_user_gang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Name] [nvarchar](100) NULL,
	[id_gender] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id_gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [nvarchar](100) NULL,
	[id_cated_menu] [int] NULL,
	[id_menu] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_category]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_category](
	[Name] [nvarchar](100) NULL,
	[id_categ_menu] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Menu_category] PRIMARY KEY CLUSTERED 
(
	[id_categ_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[Number_desk] [int] NULL,
	[id_status_cook] [int] NULL,
	[id_status_pay] [int] NULL,
	[Number_people] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_menu]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_menu](
	[id_order] [int] NULL,
	[id_menu] [int] NULL,
	[id_order_menu] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Order_menu] PRIMARY KEY CLUSTERED 
(
	[id_order_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roly]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roly](
	[Name] [nvarchar](100) NULL,
	[id_roly] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Roly] PRIMARY KEY CLUSTERED 
(
	[id_roly] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_cook]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_cook](
	[Name] [nvarchar](100) NULL,
	[id_status_cook] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Status_cook] PRIMARY KEY CLUSTERED 
(
	[id_status_cook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_pay]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_pay](
	[Name] [nvarchar](100) NULL,
	[id_status_pay] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Status_pay] PRIMARY KEY CLUSTERED 
(
	[id_status_pay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 05.03.2024 13:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Surname] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Patronymic] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Bith_date] [date] NULL,
	[Login] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[id_roly] [int] NULL,
	[id_gender] [int] NULL,
	[id_user] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gang] ON 

INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 1', CAST(N'2020-03-03' AS Date), 1)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 2', CAST(N'2020-03-04' AS Date), 2)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 3', CAST(N'2020-03-03' AS Date), 3)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 4', CAST(N'2020-03-04' AS Date), 4)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 5', CAST(N'2020-03-05' AS Date), 5)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 6', CAST(N'2020-03-05' AS Date), 6)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 7', CAST(N'2020-03-06' AS Date), 7)
INSERT [dbo].[Gang] ([Name], [Date], [id_gang]) VALUES (N'смена 8', CAST(N'2020-03-06' AS Date), 8)
SET IDENTITY_INSERT [dbo].[Gang] OFF
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (1, 1, 1)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (20, 1, 2)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (21, 1, 3)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (24, 1, 4)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (25, 1, 5)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (40, 1, 6)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (41, 1, 7)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (42, 1, 8)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (44, 1, 9)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (45, 1, 10)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (47, 1, 11)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (2, 2, 12)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (22, 2, 13)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (23, 2, 14)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (26, 2, 15)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (46, 2, 16)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (48, 2, 17)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (49, 2, 18)
INSERT [dbo].[Gang_user] ([id_user], [id_gang], [id_user_gang]) VALUES (50, 2, 19)
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Name], [id_gender]) VALUES (N'мужской', 1)
INSERT [dbo].[Gender] ([Name], [id_gender]) VALUES (N'женский', 2)
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Кускус с куриным филе и овощами', N'Кускус, рукола, редис, помидоры, авокадо, куриное филе, соус деми гласс', N'769', 1, 1)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Буррата', N'Сыр буррата, помидоры, соусы:  песто и бальзамический', N'780', 1, 2)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Жульен традиционный', N'Шампиньоны, запеченные в сливочном соусе под сырной шапкой', N'240', 1, 3)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Сашими с лососем', N'Сырой лосось, лимон', N'490', 1, 4)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Салат с рукколой', N'Сыр «Моцарелла» ,помидор, руккола, соусы  песто и бальзамический', N'480', 1, 5)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Тартар из лосося', N'Лосось, авокадо, томатный терияки', N'990', 1, 6)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Гёдза с телятеной', N'Телятина, специи', N'590', 1, 7)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Цезарь с курицей ', N' салат из свежих овощей, курицы, сыра и заправленный соусом Цезарь', N'180', 1, 8)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Пицца "Маргарита" ', N' тонкое тесто, томатный соус, моцарелла и базилик', N'250', 1, 9)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Свиной стейк ', N' жареная свинина с соусом, подается с картофельным пюре', N'300', 1, 10)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Стейк из лосося', N'Лосось, специи, рисовый кейк, спайси голландез', N'1250', 1, 11)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Осьминог', N'бейби картофель, ореховй дрессинг', N'1990', 1, 12)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Краб камчатский', N'Клешни краба, рис', N'3330', 1, 13)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Шашлык из курицы ', N' кусочки куриного мяса на шпажках, подается с лавашом и соусом', N'200', 1, 14)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Утка по-пекински', N'Утка', N'1750', 1, 15)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Салат "Хрустящий"', N'Хрустящий цыпленок, шпинат, проростки маша, соус чили ананас', N'430', 1, 16)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Спагетти карбонара ', N' паста с кремовым соусом, беконом и пармезаном', N'190', 1, 17)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Шницель с картошкой ', N' курятина, обжаренная в хрустящей панировке, подается с отварным картофелем', N'250', 1, 18)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Минестроне ', N' итальянский овощной суп с пастой и бобами', N'160', 1, 19)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Салат "Рюрик"', N'Романа гриль, щупальца кальмара, ореховый вафу', N'550', 1, 20)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Лосось гриль ', N' жареный лосось с лимонным соусом, подается с овощами', N'280', 1, 21)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Ошидзусу', N'угорь, маринованный огурец, дайкон, крем унаги', N'540', 1, 22)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Закуска "Артишок"', N'артишок, базилик чимичурри, мусс рикотта', N'670', 1, 23)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Том ям', N'Ям том', N'890', 1, 24)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N' Рататуй ', N' французское овощное рагу', N'150', 1, 25)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Эвервесс Кола', N'EVERVESS Cola – современная и невероятно вкусная кола от бренда премиальных газированных напитков с более чем полувековой историей. Насладитесь ярким богатым вкусом и бодрящей свежестью Evervess Cola.', N'118', 2, 26)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Капучино Лесной орех', N'Капучино с воздушной молочной пенкой и сиропом со вкусом лесного ореха.', N'159', 2, 27)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Латте Лесной орех', N'Латте с тонким ароматом эспрессо, нежной молочной пеной и сиропом со вкусом лесного ореха.', N'159', 2, 28)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Согревающий пунш', N'Горячий напиток, в основе которого натуральное пюре из ягод с добавлением спелого апельсина и бадьяна.', N'135', 2, 29)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Капучино', N'Молочный напиток с тонким ароматом эспрессо и плотной шапкой молочной пены', N'85', 2, 30)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Коктейль Шоколадный', N'Великолепно взбитый коктейль, приготовленный из высококачественной молочной смеси и шоколадного сиропа', N'99', 2, 31)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Коктейль Клубничный', N'Великолепно взбитый коктейль, приготовленный из высококачественной молочной смеси и клубничного сиропа', N'99', 2, 32)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Коктейль Ванильный', N'Великолепно взбитый коктейль, приготовленный из высококачественной молочной смеси и ванильного сиропа', N'99', 2, 33)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Артезианская вода Черноголовка негазированная', N'Артезианская вода Черноголовка негазированная 0,5 л. — артезианская вода без газа', N'99', 2, 34)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Липтон Зеленый', N'Прохладительный напиток', N'99', 2, 35)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Липтон Лимон', N'Прохладительный напиток', N'99', 2, 36)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Апельсиновый сок', N'Свежевосстановленный апельсиновый сок', N'99', 2, 37)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Яблочный сок', N'Свежевосстановленный яблочный сок', N'99', 2, 38)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Латте', N'Молочный напиток с тонким ароматом эспрессо и нежной молочной пеной', N'125', 2, 39)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Чай черный Эрл Грей ', N'Чай черный Эрл Грей', N'65', 2, 40)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Чай Черный', N'Чай черный', N'65', 2, 41)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Чай Зеленый', N'Чай Зеленый', N'65', 2, 42)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Американо', N'Ароматный кофе Эспрессо с золотистой пеночкой с добавлением горячей воды', N'75', 2, 43)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Кофе Глясе', N'Ароматный Американо с добавлением мороженого', N'139', 2, 44)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Двойной Эспрессо', N'Крепкий кофе с тонкой золотистой кофейной пенкой крема', N'86', 2, 45)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Добрый Кола без сахара', N'Прохладительный газированный напиток', N'99', 2, 46)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Добрый Кола', N'Прохладительный газированный напиток', N'99', 2, 47)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Добрый Апельсин', N'Прохладительный газированный напиток', N'99', 2, 48)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Добрый Лимон-Лайм', N'Прохладительный газированный напиток', N'99', 2, 49)
INSERT [dbo].[Menu] ([Name], [Description], [Price], [id_cated_menu], [id_menu]) VALUES (N'Фраппе Карамельный', N'Лёгкий освежающий напиток с нежным вкусом карамели, украшенный взбитыми сливками и соусом из карамели.', N'171', 2, 50)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Menu_category] ON 

INSERT [dbo].[Menu_category] ([Name], [id_categ_menu]) VALUES (N'блюдо', 1)
INSERT [dbo].[Menu_category] ([Name], [id_categ_menu]) VALUES (N'напиток', 2)
SET IDENTITY_INSERT [dbo].[Menu_category] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (1, 40, 5, 2, 2, 2)
INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (2, 41, 3, 1, 2, 2)
INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (3, 42, 7, 1, 2, 1)
INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (4, 44, 2, 1, 1, 1)
INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (5, 43, 1, 1, 2, 3)
INSERT [dbo].[Order] ([id_order], [id_user], [Number_desk], [id_status_cook], [id_status_pay], [Number_people]) VALUES (6, 45, 5, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Roly] ON 

INSERT [dbo].[Roly] ([Name], [id_roly]) VALUES (N'администратор', 1)
INSERT [dbo].[Roly] ([Name], [id_roly]) VALUES (N'повар', 2)
INSERT [dbo].[Roly] ([Name], [id_roly]) VALUES (N'официант', 3)
SET IDENTITY_INSERT [dbo].[Roly] OFF
SET IDENTITY_INSERT [dbo].[Status_cook] ON 

INSERT [dbo].[Status_cook] ([Name], [id_status_cook]) VALUES (N'Готовится', 1)
INSERT [dbo].[Status_cook] ([Name], [id_status_cook]) VALUES (N'Готов', 2)
SET IDENTITY_INSERT [dbo].[Status_cook] OFF
SET IDENTITY_INSERT [dbo].[Status_pay] ON 

INSERT [dbo].[Status_pay] ([Name], [id_status_pay]) VALUES (N'Принят', 1)
INSERT [dbo].[Status_pay] ([Name], [id_status_pay]) VALUES (N'Оплачен', 2)
SET IDENTITY_INSERT [dbo].[Status_pay] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Шевцов', N'Игорь', N'Дмитриевич', N'253 (734) 534-17-44', CAST(N'1992-10-22' AS Date), N'111', N'111', 1, 1, 1)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Фролов', N'Владислав', N'Тимофеевич', N'+98 (091) 857-95-96', CAST(N'2000-09-13' AS Date), N'112', N'112', 1, 2, 2)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Петров', N'Михаил', N'Кириллович', N'+253 (734) 534-17-55', CAST(N'1996-03-20' AS Date), N'113', N'113', 1, 1, 3)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Потапов', N'Захар', N'Робертович', N'+32 (775) 031-01-44', CAST(N'1993-05-19' AS Date), N'114', N'114', 1, 1, 4)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Леонтьев', N'Руслан', N'Максимович', N'+222 (229) 228-14-05', CAST(N'2002-02-11' AS Date), N'115', N'115', 1, 1, 5)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Елисеева', N'Марта', N'Никитична', N'+43 (888) 292-61-27', CAST(N'1996-04-04' AS Date), N'116', N'116', 2, 2, 6)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Русанов', N'Артём', N'Андреевич', N'+91 (621) 895-24-91', CAST(N'2000-09-11' AS Date), N'117', N'117', 2, 1, 7)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Кондрашова', N'Амина', N'Григорьевна', N'+237 (396) 463-58-87', CAST(N'1995-03-20' AS Date), N'118', N'118', 2, 2, 8)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Федоров', N'Иван', N'Павлович', N'+598 (556) 684-44-02', CAST(N'2004-08-15' AS Date), N'119', N'119', 2, 1, 9)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Антонов', N'Артемий', N'Никитич', N'+372 (169) 544-54-39', CAST(N'1998-11-21' AS Date), N'120', N'120', 2, 1, 10)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Копылов', N'Иван', N'Глебович', N'+253 (468) 688-11-88', CAST(N'1993-02-16' AS Date), N'121', N'121', 2, 1, 11)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Алексеева', N'Ульяна', N'Юрьевна', N'+36 (883) 335-60-87', CAST(N'2000-10-26' AS Date), N'122', N'122', 2, 2, 12)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Гаврилова', N'Полина', N'Леонидовна', N'+92 (068) 372-77-06', CAST(N'2000-03-23' AS Date), N'123', N'123', 2, 2, 13)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Уткина', N'Арина', N'Степановна', N'+20 (141) 187-11-71', CAST(N'1993-06-09' AS Date), N'124', N'124', 2, 2, 14)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Афанасьев', N'Эмин', N'Глебович', N'+261 (823) 703-08-55', CAST(N'2004-11-18' AS Date), N'125', N'125', 2, 1, 15)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Круглова', N'Александра', N'Данииловна', N'+244 (252) 501-78-21', CAST(N'1999-04-06' AS Date), N'126', N'126', 2, 2, 16)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Баженов', N'Лука', N'Максимович', N'+352 (404) 092-26-69', CAST(N'1990-11-22' AS Date), N'127', N'127', 2, 2, 17)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Самсонова', N'Алиса', N'Леонидовна', N'+852 (167) 492-07-90', CAST(N'1991-03-29' AS Date), N'128', N'128', 2, 2, 18)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Куликова', N'Елизавета', N'Кирилловна', N'+236 (044) 604-25-41', CAST(N'1992-04-10' AS Date), N'129', N'129', 2, 2, 19)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Бородин', N'Артём', N'Кириллович', N'+230 (559) 216-76-50', CAST(N'1999-07-28' AS Date), N'130', N'130', 2, 1, 20)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Киселев', N'Игорь', N'Егорович', N'+220 (145) 900-56-00', CAST(N'1996-12-13' AS Date), N'131', N'131', 2, 1, 21)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Соболева', N'Ксения', N'Александровна', N'+506 (446) 271-12-41', CAST(N'1998-04-18' AS Date), N'132', N'132', 2, 2, 22)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Гусев', N'Святослав', N'Робертович', N'+45 (935) 390-03-55', CAST(N'1993-07-21' AS Date), N'133', N'133', 2, 1, 23)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Алехина', N'Марьяна', N'Львовна', N'+595 (592) 400-36-04', CAST(N'1999-08-18' AS Date), N'134', N'134', 2, 2, 24)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Новикова', N'Амина', N'Глебовна', N'+50 (506) 428-25-90', CAST(N'1997-01-04' AS Date), N'135', N'135', 2, 2, 25)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Герасимова', N'Валентина', N'Вячеславовна', N'+677 (020) 563-81-94', CAST(N'1993-12-30' AS Date), N'136', N'136', 3, 2, 26)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Рябинин', N'Илья', N'Максимович', N'+54 (806) 962-43-81', CAST(N'1994-10-12' AS Date), N'137', N'137', 3, 1, 27)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Александров', N'Елисей', N'Ярославович', N'+423 (022) 916-57-29', CAST(N'1996-02-09' AS Date), N'138', N'138', 3, 1, 28)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Галкина', N'Мария', N'Дмитриевна', N'+226 (529) 251-54-29', CAST(N'1993-08-09' AS Date), N'139', N'139', 3, 2, 29)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Воронина', N'Елизавета', N'Ивановна', N'+86 (664) 410-04-90', CAST(N'1998-10-28' AS Date), N'140', N'140', 3, 2, 30)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Никитина', N'Екатерина', N'Константиновна', N'+47 (146) 750-50-42', CAST(N'1990-10-08' AS Date), N'141', N'141', 3, 2, 31)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Белякова', N'Валерия', N'Мироновна', N'+66 (893) 567-74-63', CAST(N'2001-08-02' AS Date), N'142', N'142', 3, 2, 32)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Чернова', N'Александра', N'Егоровна', N'+962 (716) 221-22-34', CAST(N'1993-08-03' AS Date), N'143', N'143', 3, 2, 33)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Павлова', N'Арина', N'Николаевна', N'+423 (908) 470-94-69', CAST(N'1990-01-01' AS Date), N'144', N'144', 3, 2, 34)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Еремина', N'Амина', N'Мироновна', N'+590 (984) 335-81-71', CAST(N'1999-11-30' AS Date), N'145', N'145', 3, 2, 35)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Новиков', N'Дмитрий', N'Иванович', N'+968 (767) 187-06-75', CAST(N'2004-10-05' AS Date), N'146', N'146', 3, 1, 36)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Королева', N'Ксения', N'Сергеевна', N'+63 (743) 665-76-32', CAST(N'1992-07-24' AS Date), N'147', N'147', 3, 2, 37)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Горбачева', N'София', N'Дамировна', N'+81 (116) 803-40-59', CAST(N'2004-09-20' AS Date), N'148', N'148', 3, 2, 38)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Максимова', N'Вера', N'Богдановна', N'+213 (477) 660-36-93', CAST(N'2003-02-26' AS Date), N'149', N'149', 3, 2, 39)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Данилов', N'Тимофей', N'Романович', N'+355 (668) 773-13-83', CAST(N'1990-05-31' AS Date), N'150', N'150', 3, 1, 40)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Иванова', N'Элина', N'Леонидовна', N'+245 (831) 942-27-98', CAST(N'1998-06-24' AS Date), N'151', N'151', 3, 2, 41)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Артемова', N'Варвара', N'Сергеевна', N'+47 (403) 945-31-94', CAST(N'1998-03-11' AS Date), N'152', N'152', 3, 2, 42)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Кузнецов', N'Михаил', N'Максимович', N'+263 (441) 997-31-21', CAST(N'1991-02-23' AS Date), N'153', N'153', 3, 1, 43)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Орлова', N'Аврора', N'Максимовна', N'+385 (834) 742-59-97', CAST(N'1996-07-15' AS Date), N'154', N'154', 3, 2, 44)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Морозов', N'Кирилл', N'Маркович', N'+993 (254) 400-45-28', CAST(N'1990-01-23' AS Date), N'155', N'155', 3, 1, 45)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Смирнов', N'Лев', N'Дмитриевич', N'+850 (654) 316-29-46', CAST(N'1996-04-07' AS Date), N'156', N'156', 3, 1, 46)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Тихонов', N'Тимофей', N'Алексеевич', N'+20 (826) 835-49-73', CAST(N'1999-08-25' AS Date), N'157', N'157', 3, 1, 47)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Ермаков', N'Платон', N'Анатольевич', N'+267 (578) 550-13-41', CAST(N'1994-10-03' AS Date), N'158', N'158', 3, 1, 48)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Кондратьев', N'Яков', N'Тимофеевич', N'+389 (634) 841-24-05', CAST(N'1998-03-09' AS Date), N'159', N'159', 3, 1, 49)
INSERT [dbo].[User] ([Surname], [Name], [Patronymic], [Phone], [Bith_date], [Login], [Password], [id_roly], [id_gender], [id_user]) VALUES (N'Борисова', N'Анастасия', N'Артуровна', N'+227 (371) 846-46-12', CAST(N'1997-09-06' AS Date), N'160', N'160', 3, 2, 50)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Gang_user]  WITH CHECK ADD  CONSTRAINT [FK_Gang_user_Gang] FOREIGN KEY([id_gang])
REFERENCES [dbo].[Gang] ([id_gang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gang_user] CHECK CONSTRAINT [FK_Gang_user_Gang]
GO
ALTER TABLE [dbo].[Gang_user]  WITH CHECK ADD  CONSTRAINT [FK_Gang_user_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gang_user] CHECK CONSTRAINT [FK_Gang_user_User]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu_category] FOREIGN KEY([id_cated_menu])
REFERENCES [dbo].[Menu_category] ([id_categ_menu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu_category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status_cook] FOREIGN KEY([id_status_cook])
REFERENCES [dbo].[Status_cook] ([id_status_cook])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status_cook]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status_pay] FOREIGN KEY([id_status_pay])
REFERENCES [dbo].[Status_pay] ([id_status_pay])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status_pay]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_menu]  WITH CHECK ADD  CONSTRAINT [FK_Order_menu_Menu] FOREIGN KEY([id_menu])
REFERENCES [dbo].[Menu] ([id_menu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_menu] CHECK CONSTRAINT [FK_Order_menu_Menu]
GO
ALTER TABLE [dbo].[Order_menu]  WITH CHECK ADD  CONSTRAINT [FK_Order_menu_Order] FOREIGN KEY([id_order])
REFERENCES [dbo].[Order] ([id_order])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_menu] CHECK CONSTRAINT [FK_Order_menu_Order]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([id_gender])
REFERENCES [dbo].[Gender] ([id_gender])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Roly] FOREIGN KEY([id_roly])
REFERENCES [dbo].[Roly] ([id_roly])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Roly]
GO
USE [master]
GO
ALTER DATABASE [cafe] SET  READ_WRITE 
GO
