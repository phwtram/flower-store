USE [master]
GO
/****** Object:  Database [AssPRJ301]    Script Date: 07/07/2023 9:57:51 CH ******/
CREATE DATABASE [AssPRJ301]

GO
ALTER DATABASE [AssPRJ301] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssPRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssPRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssPRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssPRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssPRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssPRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssPRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssPRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssPRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssPRJ301] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssPRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssPRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssPRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssPRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssPRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssPRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssPRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssPRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [AssPRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssPRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssPRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssPRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssPRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssPRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssPRJ301] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssPRJ301] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AssPRJ301]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 07/07/2023 9:57:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 07/07/2023 9:57:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 07/07/2023 9:57:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](20) NOT NULL,
	[name] [nvarchar](250) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[img] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 07/07/2023 9:57:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 3, N'01', 30, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 3, N'02', 30, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 3, N'03', 35, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 3, N'04', 20, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 4, N'01', 30, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 4, N'02', 30, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 4, N'03', 35, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 4, N'04', 20, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 5, N'01', 30, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 5, N'02', 30, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 5, N'03', 35, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 5, N'04', 20, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 6, N'02', 30, 8)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 7, N'01', 30, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (1, N'pthehehe', CAST(N'2023-07-07' AS Date), 30)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (2, N'pthehehe', CAST(N'2023-07-07' AS Date), 30)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (3, N'pthehehe', CAST(N'2023-07-07' AS Date), 115)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (4, N'pthehehe', CAST(N'2023-07-07' AS Date), 115)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (5, N'pthehehe', CAST(N'2023-07-07' AS Date), 175)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (6, N'pthehehe', CAST(N'2023-07-07' AS Date), 240)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (7, N'pthehehe', CAST(N'2023-07-07' AS Date), 30)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'01                  ', N'Rose Bouquet', 30, 10, N'rose.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'02                  ', N'Freesia Pot', 30, 20, N'freesia.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'03                  ', N'Pink Rose Pot', 35, 30, N'Pink-rose.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'04                  ', N'Orchids Bouquet', 20, 60, N'orchids.webp')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'admin hehe', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'pthehehe', N'Phuong Tram', N'12', N'US', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Bao', N'1', N' AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
GO
USE [master]
GO
ALTER DATABASE [AssPRJ301] SET  READ_WRITE 
GO
