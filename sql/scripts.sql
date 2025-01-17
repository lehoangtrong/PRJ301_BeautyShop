USE [UserManagement]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 09/07/2024 9:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [nvarchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 09/07/2024 9:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[status] [bit] NOT NULL,
	[userID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 09/07/2024 9:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](50) NOT NULL,
	[productName] [varchar](255) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 09/07/2024 9:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status]) VALUES (N'O1', N'P01', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status]) VALUES (N'O1', N'P02', CAST(200.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status]) VALUES (N'O2', N'P01', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status]) VALUES (N'O3', N'P01', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [price], [quantity], [status]) VALUES (N'O4', N'P01', CAST(100.00 AS Decimal(10, 2)), 1, 1)
GO
INSERT [dbo].[tblOrders] ([orderID], [date], [total], [status], [userID]) VALUES (N'O1', CAST(N'2024-07-08' AS Date), CAST(700.00 AS Decimal(10, 2)), 1, N'user')
INSERT [dbo].[tblOrders] ([orderID], [date], [total], [status], [userID]) VALUES (N'O2', CAST(N'2024-07-08' AS Date), CAST(100.00 AS Decimal(10, 2)), 1, N'letrong')
INSERT [dbo].[tblOrders] ([orderID], [date], [total], [status], [userID]) VALUES (N'O3', CAST(N'2024-07-08' AS Date), CAST(100.00 AS Decimal(10, 2)), 1, N'letrong')
INSERT [dbo].[tblOrders] ([orderID], [date], [total], [status], [userID]) VALUES (N'O4', CAST(N'2024-07-08' AS Date), CAST(100.00 AS Decimal(10, 2)), 1, N'letrong')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P01', N'Lipstick', CAST(100.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P02', N'Foundation', CAST(200.00 AS Decimal(10, 2)), 17, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P03', N'Mascara', CAST(300.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P04', N'Eyeliner', CAST(400.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P05', N'Blush', CAST(500.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P06', N'Eyeshadow Palette', CAST(600.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P07', N'Concealer', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P08', N'Highlighter', CAST(250.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P09', N'Lip Gloss', CAST(120.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P10', N'Setting Spray', CAST(180.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P100', N'Beard Scissors', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P101', N'Foot Scrub', CAST(120.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P102', N'Foot Mask', CAST(140.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P103', N'Callus Remover', CAST(110.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P104', N'Heel Balm', CAST(100.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P105', N'Eyelash Curler', CAST(80.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P106', N'Makeup Brush Set', CAST(300.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P107', N'Makeup Sponge', CAST(50.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P108', N'Makeup Bag', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P109', N'Cosmetic Mirror', CAST(200.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P11', N'Primer', CAST(220.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P110', N'Tweezers', CAST(40.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P111', N'Eyebrow Razor', CAST(30.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P112', N'Facial Roller', CAST(180.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P113', N'Gua Sha Tool', CAST(160.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P114', N'Face Steamer', CAST(250.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P115', N'Pore Strips', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P116', N'Blackhead Remover', CAST(140.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P117', N'Acne Spot Treatment', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P118', N'Hydrocolloid Patches', CAST(110.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P119', N'Facial Spray', CAST(130.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P12', N'Bronzer', CAST(300.00 AS Decimal(10, 2)), 28, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P120', N'Setting Powder', CAST(180.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P121', N'Compact Powder', CAST(160.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P122', N'Loose Powder', CAST(200.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P123', N'Translucent Powder', CAST(170.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P124', N'Brow Gel', CAST(140.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P125', N'Brow Pomade', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P126', N'Brow Pencil', CAST(100.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P127', N'Brow Powder', CAST(120.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P128', N'Lash Serum', CAST(180.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P129', N'False Lashes', CAST(90.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P13', N'Makeup Remover', CAST(90.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P130', N'Lash Glue', CAST(70.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P131', N'Lash Applicator', CAST(60.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P132', N'Eyelash Extensions', CAST(250.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P133', N'Lash Lift Kit', CAST(200.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P134', N'Brow Lift Kit', CAST(220.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P135', N'Lash Tint', CAST(140.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P136', N'Brow Tint', CAST(130.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P137', N'Facial Epilator', CAST(210.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P138', N'Wax Strips', CAST(100.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P139', N'Hot Wax Kit', CAST(200.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P14', N'Face Serum', CAST(350.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P140', N'Sugar Wax', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P141', N'Cold Wax Strips', CAST(120.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P142', N'Hair Removal Cream', CAST(90.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P143', N'Epilator', CAST(250.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P144', N'Laser Hair Removal', CAST(300.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P145', N'Body Hair Trimmer', CAST(180.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P146', N'Face Hair Trimmer', CAST(170.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P147', N'Electric Razor', CAST(200.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P148', N'Disposable Razor', CAST(50.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P149', N'Razor Blades', CAST(40.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P15', N'Moisturizer', CAST(400.00 AS Decimal(10, 2)), 22, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P150', N'Shaving Kit', CAST(300.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P151', N'Aftershave Balm', CAST(130.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P152', N'Pre-Shave Oil', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P153', N'Shave Soap', CAST(80.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P154', N'Shaving Brush', CAST(110.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P155', N'Electric Shaver', CAST(250.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P156', N'Nail Clippers', CAST(60.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P157', N'Cuticle Pusher', CAST(40.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P158', N'Cuticle Oil', CAST(80.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P159', N'Nail File', CAST(30.00 AS Decimal(10, 2)), 60, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P16', N'Nail Polish', CAST(50.00 AS Decimal(10, 2)), 60, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P160', N'Nail Buffer', CAST(50.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P161', N'Nail Polish Remover Pads', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P162', N'Base Coat', CAST(100.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P163', N'Top Coat', CAST(110.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P164', N'Matte Top Coat', CAST(120.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P165', N'Nail Art Kit', CAST(200.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P166', N'UV Gel Polish', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P167', N'Acrylic Powder', CAST(140.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P168', N'Gel Nail Polish', CAST(130.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P169', N'Nail Art Stickers', CAST(40.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P17', N'Nail Polish Remover', CAST(30.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P170', N'Nail Glue', CAST(60.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P171', N'False Nails', CAST(80.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P172', N'Nail Tips', CAST(70.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P173', N'Nail Art Brushes', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P174', N'Nail Art Pen', CAST(50.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P175', N'Nail Art Rhinestones', CAST(60.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P176', N'Nail Art Foil', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P177', N'Nail Art Glitter', CAST(50.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P178', N'Nail Art Sequins', CAST(60.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P179', N'Nail Art Powder', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P18', N'Hair Spray', CAST(80.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P180', N'Dip Powder', CAST(100.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P181', N'Nail Lamp', CAST(200.00 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P182', N'Nail Drill', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P183', N'Manicure Kit', CAST(250.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P184', N'Pedicure Kit', CAST(200.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P185', N'Callus File', CAST(80.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P186', N'Foot File', CAST(70.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P187', N'Foot Lotion', CAST(90.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P188', N'Foot Cream', CAST(100.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P189', N'Foot Peel Mask', CAST(120.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P19', N'Hair Gel', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P190', N'Foot Spray', CAST(110.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P191', N'Foot Soak', CAST(130.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P192', N'Foot Spa', CAST(250.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P193', N'Toe Separators', CAST(50.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P194', N'Nail Hardener', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P195', N'Nail Strengthener', CAST(100.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P196', N'Nail Treatment', CAST(110.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P197', N'Nail Growth Serum', CAST(130.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P198', N'Nail Polish Remover', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P199', N'Nail Remover Clips', CAST(50.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P20', N'Shampoo', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P200', N'Nail Soak Off Bowl', CAST(60.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P21', N'Conditioner', CAST(140.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P22', N'Hair Oil', CAST(120.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P23', N'Hair Mask', CAST(200.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P24', N'Hair Serum', CAST(220.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P25', N'Hair Mousse', CAST(180.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P26', N'Curl Cream', CAST(190.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P27', N'Heat Protectant Spray', CAST(230.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P28', N'Dry Shampoo', CAST(160.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P29', N'Leave-In Conditioner', CAST(170.00 AS Decimal(10, 2)), 28, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P30', N'Body Lotion', CAST(100.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P31', N'Body Wash', CAST(120.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P32', N'Body Scrub', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P33', N'Hand Cream', CAST(90.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P34', N'Foot Cream', CAST(95.00 AS Decimal(10, 2)), 22, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P35', N'Sunscreen', CAST(180.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P36', N'After Sun Lotion', CAST(160.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P37', N'Tanning Lotion', CAST(170.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P38', N'Tanning Oil', CAST(200.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P39', N'Self Tanner', CAST(250.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P40', N'Face Wash', CAST(130.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P41', N'Face Scrub', CAST(140.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P42', N'Face Mask', CAST(180.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P43', N'Clay Mask', CAST(190.00 AS Decimal(10, 2)), 22, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P44', N'Sheet Mask', CAST(110.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P45', N'Peel-Off Mask', CAST(160.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P46', N'Exfoliating Scrub', CAST(130.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P47', N'Acne Treatment', CAST(220.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P48', N'Pimple Patches', CAST(140.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P49', N'Toner', CAST(170.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P50', N'Essence', CAST(200.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P51', N'Ampoule', CAST(230.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P52', N'Serum', CAST(250.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P53', N'Eye Cream', CAST(300.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P54', N'Lip Balm', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P55', N'Lip Scrub', CAST(100.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P56', N'Lip Mask', CAST(110.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P57', N'Lip Oil', CAST(120.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P58', N'Lip Treatment', CAST(130.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P59', N'Toothpaste', CAST(60.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P60', N'Mouthwash', CAST(80.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P61', N'Toothbrush', CAST(50.00 AS Decimal(10, 2)), 50, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P62', N'Floss', CAST(40.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P63', N'Whitening Strips', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P64', N'Mouth Freshener', CAST(70.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P65', N'Dental Kit', CAST(200.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P66', N'Facial Oil', CAST(270.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P67', N'Cleansing Balm', CAST(190.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P68', N'Micellar Water', CAST(160.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P69', N'Makeup Remover Wipes', CAST(70.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P70', N'Eye Makeup Remover', CAST(140.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P71', N'Double Cleansing Oil', CAST(200.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P72', N'Cleansing Foam', CAST(150.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P73', N'Cleansing Milk', CAST(180.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P74', N'Facial Cleansing Brush', CAST(250.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P75', N'Body Oil', CAST(220.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P76', N'Body Butter', CAST(180.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P77', N'Hand Soap', CAST(60.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P78', N'Hand Sanitizer', CAST(50.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P79', N'Bath Bombs', CAST(100.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P80', N'Bubble Bath', CAST(90.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P81', N'Shower Gel', CAST(120.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P82', N'Bath Salts', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P83', N'Body Mist', CAST(130.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P84', N'Deodorant', CAST(80.00 AS Decimal(10, 2)), 40, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P85', N'Antiperspirant', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P86', N'Perfume', CAST(300.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P87', N'Eau de Toilette', CAST(250.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P88', N'Eau de Cologne', CAST(220.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P89', N'Body Spray', CAST(200.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P90', N'Aftershave', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P91', N'Shaving Cream', CAST(100.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P92', N'Shaving Gel', CAST(110.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P93', N'Shaving Foam', CAST(90.00 AS Decimal(10, 2)), 35, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P94', N'Beard Oil', CAST(140.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P95', N'Beard Balm', CAST(150.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P96', N'Beard Wax', CAST(130.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P97', N'Beard Wash', CAST(120.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P98', N'Mustache Wax', CAST(110.00 AS Decimal(10, 2)), 22, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [status]) VALUES (N'P99', N'Beard Comb', CAST(70.00 AS Decimal(10, 2)), 40, 1)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'admin', N'1', N'Admin', N'tronglhqe180185@fpt.edu.vn', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'hoadnt', N'1', N'Hoa Doan', N'abc@gmail.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'hoangtrong', N'1', N'Le Hoang Trong', N'lehoangtrongcsgl@icoud.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'letrong', N'1', N'Le Hoang Trong', N'lehoangtrongcsgl@icloud.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'linhttt', N'1', N'Linh Tran', N'thuylinhtran@gmail.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'QE180185', N'1', N'Le Hoang Trong', N'lehoangtrongcsgl@icloud.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'tronglh', N'1', N'Trong Le', N'lehoangtrongcsgl@gmail.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [email], [roleID], [status]) VALUES (N'user', N'1', N'User', N'lehoangtrongcsgl@gmail.com', N'US', 1)
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
