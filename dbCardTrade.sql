USE [CardTrade]
GO
ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[Report] DROP CONSTRAINT [FK_Report_ReportType]
GO
ALTER TABLE [dbo].[Report] DROP CONSTRAINT [FK_Report_Auction]
GO
ALTER TABLE [dbo].[R.Card-Mechanic] DROP CONSTRAINT [FK_R.Card-Mechanic_Mechanics]
GO
ALTER TABLE [dbo].[R.Card-Mechanic] DROP CONSTRAINT [FK_R.Card-Mechanic_Card]
GO
ALTER TABLE [dbo].[R.Card-Color] DROP CONSTRAINT [FK_R.Card-Color_Color]
GO
ALTER TABLE [dbo].[R.Card-Color] DROP CONSTRAINT [FK_R.Card-Color_Card]
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers] DROP CONSTRAINT [FK_R.Auction-CurrentUsers_User]
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers] DROP CONSTRAINT [FK_R.Auction-CurrentUsers_Auction]
GO
ALTER TABLE [dbo].[Profile] DROP CONSTRAINT [FK_Profile_User]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Auction]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_Auction]
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT [FK_Card_Supertype]
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT [FK_Card_Rarity]
GO
ALTER TABLE [dbo].[Card] DROP CONSTRAINT [FK_Card_Category]
GO
ALTER TABLE [dbo].[Auction] DROP CONSTRAINT [FK_Auction_UserSeller]
GO
ALTER TABLE [dbo].[Auction] DROP CONSTRAINT [FK_Auction_User]
GO
ALTER TABLE [dbo].[Auction] DROP CONSTRAINT [FK_Auction_Card]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Transaction]
GO
/****** Object:  Table [dbo].[Supertype]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Supertype]
GO
/****** Object:  Table [dbo].[Rules]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Rules]
GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[ReportType]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Report]
GO
/****** Object:  Table [dbo].[Rarity]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Rarity]
GO
/****** Object:  Table [dbo].[R.Card-Mechanic]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[R.Card-Mechanic]
GO
/****** Object:  Table [dbo].[R.Card-Color]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[R.Card-Color]
GO
/****** Object:  Table [dbo].[R.Auction-CurrentUsers]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[R.Auction-CurrentUsers]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Profile]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[Mechanics]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Mechanics]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Color]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Card]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 08/06/2018 09:54:26 p.m. ******/
DROP TABLE [dbo].[Auction]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCard] [int] NOT NULL,
	[idUserSeller] [int] NOT NULL,
	[beginDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[type] [nvarchar](10) NOT NULL,
	[currentAmount] [decimal](7, 2) NULL,
	[amount] [decimal](7, 2) NULL,
	[idCurrentUser] [int] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](250) NOT NULL,
	[cost] [decimal](7, 2) NOT NULL,
	[minValue] [decimal](7, 2) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[manaCost] [int] NOT NULL,
	[power] [int] NULL,
	[toughness] [int] NULL,
	[isFoil] [bit] NOT NULL,
	[idRarity] [int] NOT NULL,
	[idCategory] [int] NOT NULL,
	[idSupertype] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mechanics]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mechanics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Mechanics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAuction] [int] NOT NULL,
	[Reason] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[isReviced] [bit] NOT NULL,
	[dateRecived] [datetime] NULL,
	[status] [nvarchar](20) NOT NULL,
	[idAuction] [int] NOT NULL,
	[beginDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[shippingMethod] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[age] [varchar](50) NOT NULL,
	[sex] [varchar](50) NOT NULL,
	[coins] [int] NOT NULL,
	[rating] [decimal](18, 2) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[R.Auction-CurrentUsers]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R.Auction-CurrentUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCurrentUser] [int] NOT NULL,
	[amount] [decimal](7, 2) NOT NULL,
	[idAuction] [int] NULL,
 CONSTRAINT [PK_R.Auction-CurrentUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R.Card-Color]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R.Card-Color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCard] [int] NOT NULL,
	[idColor] [int] NOT NULL,
 CONSTRAINT [PK_R.Card-Color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R.Card-Mechanic]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R.Card-Mechanic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCard] [int] NOT NULL,
	[idMechanic] [int] NOT NULL,
 CONSTRAINT [PK_R.Card-Mechanic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rarity]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rarity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Rarity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](350) NOT NULL,
	[route] [nvarchar](50) NOT NULL,
	[idReportType] [int] NOT NULL,
	[idAuction] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rules]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supertype]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supertype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Supertype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[moneyAmount] [decimal](7, 2) NOT NULL,
	[coinsAmount] [int] NOT NULL,
	[transactionDate] [datetime] NOT NULL,
	[transactionType] [nvarchar](20) NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 08/06/2018 09:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Auction] ON 

INSERT [dbo].[Auction] ([id], [idCard], [idUserSeller], [beginDate], [endDate], [status], [type], [currentAmount], [amount], [idCurrentUser]) VALUES (9, 1, 1, CAST(0x0000A90800EDA008 AS DateTime), CAST(0x0000A90800EDA008 AS DateTime), N'active', N'premium', CAST(50.00 AS Decimal(7, 2)), CAST(1.00 AS Decimal(7, 2)), 1)
INSERT [dbo].[Auction] ([id], [idCard], [idUserSeller], [beginDate], [endDate], [status], [type], [currentAmount], [amount], [idCurrentUser]) VALUES (15, 2, 3, CAST(0x0000A90800000000 AS DateTime), CAST(0x0000A90800000000 AS DateTime), N'active', N'normal', CAST(5.00 AS Decimal(7, 2)), CAST(1.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[Auction] ([id], [idCard], [idUserSeller], [beginDate], [endDate], [status], [type], [currentAmount], [amount], [idCurrentUser]) VALUES (17, 3, 4, CAST(0x0000A90800000000 AS DateTime), CAST(0x0000A90800000000 AS DateTime), N'active', N'nomal', NULL, CAST(1.00 AS Decimal(7, 2)), NULL)
INSERT [dbo].[Auction] ([id], [idCard], [idUserSeller], [beginDate], [endDate], [status], [type], [currentAmount], [amount], [idCurrentUser]) VALUES (18, 1, 1, CAST(0x0000A90800000000 AS DateTime), CAST(0x0000A90800000000 AS DateTime), N'active', N'premium', CAST(10.00 AS Decimal(7, 2)), CAST(1.00 AS Decimal(7, 2)), NULL)
INSERT [dbo].[Auction] ([id], [idCard], [idUserSeller], [beginDate], [endDate], [status], [type], [currentAmount], [amount], [idCurrentUser]) VALUES (19, 2, 4, CAST(0x0000950F00EDA008 AS DateTime), CAST(0x0000A90800EDA008 AS DateTime), N'active', N'premium', CAST(20.00 AS Decimal(7, 2)), CAST(1.00 AS Decimal(7, 2)), 3)
SET IDENTITY_INSERT [dbo].[Auction] OFF
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([id], [name], [description], [cost], [minValue], [status], [manaCost], [power], [toughness], [isFoil], [idRarity], [idCategory], [idSupertype]) VALUES (1, N'Murasa''s Pulse', N'Return target creature or land from graveyard to your hand. You gain 6 life.', CAST(5.00 AS Decimal(7, 2)), CAST(2.00 AS Decimal(7, 2)), N'active', 3, NULL, NULL, 0, 1, 6, NULL)
INSERT [dbo].[Card] ([id], [name], [description], [cost], [minValue], [status], [manaCost], [power], [toughness], [isFoil], [idRarity], [idCategory], [idSupertype]) VALUES (2, N'Heartless Summoning', N'Creature spells cost 2 less to cast. Creatures you control get -1/-1', CAST(10.00 AS Decimal(7, 2)), CAST(4.00 AS Decimal(7, 2)), N'active', 3, NULL, NULL, 0, 1, 3, NULL)
INSERT [dbo].[Card] ([id], [name], [description], [cost], [minValue], [status], [manaCost], [power], [toughness], [isFoil], [idRarity], [idCategory], [idSupertype]) VALUES (3, N'Myr Retriever', N'When Myr Retriever is put into a graveyard return target artifact from graveyard to your hand', CAST(6.00 AS Decimal(7, 2)), CAST(2.00 AS Decimal(7, 2)), N'active', 2, 1, 1, 0, 1, 2, NULL)
INSERT [dbo].[Card] ([id], [name], [description], [cost], [minValue], [status], [manaCost], [power], [toughness], [isFoil], [idRarity], [idCategory], [idSupertype]) VALUES (4, N'Exodia', N'You won the game', CAST(10.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(7, 2)), N'active', 10, NULL, NULL, 0, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Card] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Artifact')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Creature')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Enchantment')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Land')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Sorcery')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Instant')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'test')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([id], [name]) VALUES (1, N'Blue')
INSERT [dbo].[Color] ([id], [name]) VALUES (2, N'Black')
INSERT [dbo].[Color] ([id], [name]) VALUES (3, N'White')
INSERT [dbo].[Color] ([id], [name]) VALUES (4, N'Red')
INSERT [dbo].[Color] ([id], [name]) VALUES (5, N'Colorless')
INSERT [dbo].[Color] ([id], [name]) VALUES (6, N'Green')
INSERT [dbo].[Color] ([id], [name]) VALUES (7, N'Universal')
INSERT [dbo].[Color] ([id], [name]) VALUES (8, N'Caster')
INSERT [dbo].[Color] ([id], [name]) VALUES (9, N'test')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Mechanics] ON 

INSERT [dbo].[Mechanics] ([id], [name]) VALUES (1, N'Defender')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (2, N'Double strike')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (3, N'Enchant')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (4, N'Equip')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (5, N'First strike
')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (6, N'Flash')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (7, N'Flying')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (8, N'Haste')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (9, N'Hexproof
')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (10, N'Indestructible')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (11, N'Lifelink')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (12, N'Menace')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (13, N'Prowess')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (14, N'Reach')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (15, N'Scry')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (16, N'Trample')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (17, N'Vigilance')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (18, N'Attach')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (20, N'Counter')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (21, N'Exile')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (22, N'Fight')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (23, N'Regenerate')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (24, N'Sacrifice')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (25, N'Tap/Untap')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (26, N'Absorb')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (27, N'Affinity')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (28, N'Aftermath')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (29, N'Amplify')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (30, N'Annihilator')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (31, N'Aura swap')
INSERT [dbo].[Mechanics] ([id], [name]) VALUES (32, N'Caster')
SET IDENTITY_INSERT [dbo].[Mechanics] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [isReviced], [dateRecived], [status], [idAuction], [beginDate], [endDate], [shippingMethod]) VALUES (3, 1, CAST(0x0000A8D8000B3EF5 AS DateTime), N'Delivered', 9, CAST(0x0000A8C200000000 AS DateTime), CAST(0x0000A8C900000000 AS DateTime), N'presencial')
INSERT [dbo].[Order] ([id], [isReviced], [dateRecived], [status], [idAuction], [beginDate], [endDate], [shippingMethod]) VALUES (4, 0, NULL, N'Active', 15, CAST(0x0000A8C20100FE55 AS DateTime), CAST(0x0000A8C90100FE55 AS DateTime), N'Presencial')
INSERT [dbo].[Order] ([id], [isReviced], [dateRecived], [status], [idAuction], [beginDate], [endDate], [shippingMethod]) VALUES (5, 0, NULL, N'Active', 19, CAST(0x0000A8D80005E279 AS DateTime), CAST(0x0000A8DF0005E279 AS DateTime), N'presencial')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([id], [name], [type], [status], [email], [phone], [age], [sex], [coins], [rating], [address], [idUser]) VALUES (1, N'Gabriel Alonso Benavente Soto', N'dev', N'active', N'gabosh140@gmail.com', N'947445621', N'22', N'male', 10000000, CAST(5.00 AS Decimal(18, 2)), N'Calle Nueva Esparta', 1)
INSERT [dbo].[Profile] ([id], [name], [type], [status], [email], [phone], [age], [sex], [coins], [rating], [address], [idUser]) VALUES (4, N'Luis Antezana', N'dev', N'active', N'asdas@mail.com', N'84196844', N'24', N'male', 10, CAST(2.00 AS Decimal(18, 2)), N'Calle fake 123', 4)
INSERT [dbo].[Profile] ([id], [name], [type], [status], [email], [phone], [age], [sex], [coins], [rating], [address], [idUser]) VALUES (5, N'Andre Puente caldas', N'dev', N'active', N'bridge619@gmail.com', N'55555555', N'23', N'male', 5000, CAST(4.00 AS Decimal(18, 2)), N'Calle Esperanza', 6)
SET IDENTITY_INSERT [dbo].[Profile] OFF
SET IDENTITY_INSERT [dbo].[R.Auction-CurrentUsers] ON 

INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (5, 6, CAST(2.00 AS Decimal(7, 2)), 9)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (6, 5, CAST(3.00 AS Decimal(7, 2)), 9)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (7, 4, CAST(4.00 AS Decimal(7, 2)), 9)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (8, 3, CAST(0.50 AS Decimal(7, 2)), 15)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (9, 3, CAST(20.00 AS Decimal(7, 2)), 19)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (10, 3, CAST(25.00 AS Decimal(7, 2)), 9)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (11, 3, CAST(5.00 AS Decimal(7, 2)), 15)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (12, 1, CAST(30.00 AS Decimal(7, 2)), 9)
INSERT [dbo].[R.Auction-CurrentUsers] ([id], [idCurrentUser], [amount], [idAuction]) VALUES (13, 1, CAST(50.00 AS Decimal(7, 2)), 9)
SET IDENTITY_INSERT [dbo].[R.Auction-CurrentUsers] OFF
SET IDENTITY_INSERT [dbo].[R.Card-Color] ON 

INSERT [dbo].[R.Card-Color] ([id], [idCard], [idColor]) VALUES (1, 1, 6)
SET IDENTITY_INSERT [dbo].[R.Card-Color] OFF
SET IDENTITY_INSERT [dbo].[Rarity] ON 

INSERT [dbo].[Rarity] ([id], [description]) VALUES (1, N'common')
INSERT [dbo].[Rarity] ([id], [description]) VALUES (2, N'uncommon')
INSERT [dbo].[Rarity] ([id], [description]) VALUES (3, N'rare')
INSERT [dbo].[Rarity] ([id], [description]) VALUES (4, N'mythic')
INSERT [dbo].[Rarity] ([id], [description]) VALUES (5, N'test')
SET IDENTITY_INSERT [dbo].[Rarity] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([id], [description], [route], [idReportType], [idAuction]) VALUES (1, N'test', N'test route', 1, 9)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([id], [description]) VALUES (1, N'Descripcion erronea')
INSERT [dbo].[ReportType] ([id], [description]) VALUES (2, N'Producto en mal estado')
INSERT [dbo].[ReportType] ([id], [description]) VALUES (3, N'Descripcion en blanco')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[Rules] ON 

INSERT [dbo].[Rules] ([id], [Description], [type]) VALUES (1, N'test', N'xd')
SET IDENTITY_INSERT [dbo].[Rules] OFF
SET IDENTITY_INSERT [dbo].[Supertype] ON 

INSERT [dbo].[Supertype] ([id], [name]) VALUES (1, N'basic')
INSERT [dbo].[Supertype] ([id], [name]) VALUES (2, N'snow')
INSERT [dbo].[Supertype] ([id], [name]) VALUES (3, N'legendary')
INSERT [dbo].[Supertype] ([id], [name]) VALUES (4, N'host')
INSERT [dbo].[Supertype] ([id], [name]) VALUES (5, N'ongoing')
INSERT [dbo].[Supertype] ([id], [name]) VALUES (6, N'world')
SET IDENTITY_INSERT [dbo].[Supertype] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [pass]) VALUES (1, N'Gabo', N'admin')
INSERT [dbo].[User] ([id], [username], [pass]) VALUES (3, N'Jorge', N'admin')
INSERT [dbo].[User] ([id], [username], [pass]) VALUES (4, N'Guillermo', N'admin')
INSERT [dbo].[User] ([id], [username], [pass]) VALUES (5, N'Jorge_Q', N'admin')
INSERT [dbo].[User] ([id], [username], [pass]) VALUES (6, N'Puente', N'admin')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Card] FOREIGN KEY([idCard])
REFERENCES [dbo].[Card] ([id])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_Card]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_User] FOREIGN KEY([idCurrentUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_User]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_UserSeller] FOREIGN KEY([idUserSeller])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_UserSeller]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Category]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Rarity] FOREIGN KEY([idRarity])
REFERENCES [dbo].[Rarity] ([id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Rarity]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Supertype] FOREIGN KEY([idSupertype])
REFERENCES [dbo].[Supertype] ([id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Supertype]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Auction] FOREIGN KEY([idAuction])
REFERENCES [dbo].[Auction] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Auction]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Auction] FOREIGN KEY([idAuction])
REFERENCES [dbo].[Auction] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Auction]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_User]
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers]  WITH CHECK ADD  CONSTRAINT [FK_R.Auction-CurrentUsers_Auction] FOREIGN KEY([idAuction])
REFERENCES [dbo].[Auction] ([id])
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers] CHECK CONSTRAINT [FK_R.Auction-CurrentUsers_Auction]
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers]  WITH CHECK ADD  CONSTRAINT [FK_R.Auction-CurrentUsers_User] FOREIGN KEY([idCurrentUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[R.Auction-CurrentUsers] CHECK CONSTRAINT [FK_R.Auction-CurrentUsers_User]
GO
ALTER TABLE [dbo].[R.Card-Color]  WITH CHECK ADD  CONSTRAINT [FK_R.Card-Color_Card] FOREIGN KEY([idCard])
REFERENCES [dbo].[Card] ([id])
GO
ALTER TABLE [dbo].[R.Card-Color] CHECK CONSTRAINT [FK_R.Card-Color_Card]
GO
ALTER TABLE [dbo].[R.Card-Color]  WITH CHECK ADD  CONSTRAINT [FK_R.Card-Color_Color] FOREIGN KEY([idColor])
REFERENCES [dbo].[Color] ([id])
GO
ALTER TABLE [dbo].[R.Card-Color] CHECK CONSTRAINT [FK_R.Card-Color_Color]
GO
ALTER TABLE [dbo].[R.Card-Mechanic]  WITH CHECK ADD  CONSTRAINT [FK_R.Card-Mechanic_Card] FOREIGN KEY([idCard])
REFERENCES [dbo].[Card] ([id])
GO
ALTER TABLE [dbo].[R.Card-Mechanic] CHECK CONSTRAINT [FK_R.Card-Mechanic_Card]
GO
ALTER TABLE [dbo].[R.Card-Mechanic]  WITH CHECK ADD  CONSTRAINT [FK_R.Card-Mechanic_Mechanics] FOREIGN KEY([idMechanic])
REFERENCES [dbo].[Mechanics] ([id])
GO
ALTER TABLE [dbo].[R.Card-Mechanic] CHECK CONSTRAINT [FK_R.Card-Mechanic_Mechanics]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Auction] FOREIGN KEY([idAuction])
REFERENCES [dbo].[Auction] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Auction]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_ReportType] FOREIGN KEY([idReportType])
REFERENCES [dbo].[ReportType] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_ReportType]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
