USE [master]
GO
/****** Object:  Database [CHUDU]    Script Date: 8/26/2021 8:35:45 AM ******/
CREATE DATABASE [CHUDU]
GO
ALTER DATABASE [CHUDU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUDU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUDU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUDU] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUDU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUDU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUDU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUDU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUDU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUDU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUDU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUDU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUDU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUDU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUDU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUDU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUDU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUDU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUDU] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUDU] SET  MULTI_USER 
GO
ALTER DATABASE [CHUDU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUDU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUDU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUDU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHUDU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHUDU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUDU', N'ON'
GO
ALTER DATABASE [CHUDU] SET QUERY_STORE = OFF
GO
USE [CHUDU]
GO
/****** Object:  Table [dbo].[ChiTietKhuyenMai]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKhuyenMai](
	[IDKhuyenMai] [int] NOT NULL,
	[IDPhongKS] [int] NOT NULL,
	[Gia] [money] NULL,
	[ThoiGian] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiTietKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[IDKhuyenMai] ASC,
	[IDPhongKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLoaiKS]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoaiKS](
	[IDKS] [int] NOT NULL,
	[IDLoaiKS] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietLoaiKS] PRIMARY KEY CLUSTERED 
(
	[IDKS] ASC,
	[IDLoaiKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatPhong](
	[IDDatPhong] [int] IDENTITY(1,1) NOT NULL,
	[IDPhongKS] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[SDT] [nvarchar](max) NULL,
	[ThoiGian] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[IDDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachSan]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachSan](
	[IDKS] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Anh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[IDThanhPho] [int] NULL,
 CONSTRAINT [PK_KhachSan] PRIMARY KEY CLUSTERED 
(
	[IDKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[IDKhuyenMai] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[IDKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKS]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKS](
	[IDLoaiKs] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiKS] PRIMARY KEY CLUSTERED 
(
	[IDLoaiKs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongKS]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongKS](
	[IDPhongKS] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[Loai] [nvarchar](max) NULL,
	[Gia] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[IDKS] [int] NOT NULL,
 CONSTRAINT [PK_PhongKS] PRIMARY KEY CLUSTERED 
(
	[IDPhongKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTK] [int] IDENTITY(1,1) NOT NULL,
	[MatKhau] [nchar](16) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nchar](16) NOT NULL,
	[VaiTro] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 8/26/2021 8:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[IDThanhPho] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[Anh] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDThanhPho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 145, 1100000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 146, 1100000.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 147, 1100000.0000, N'đến hết tháng 8')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 150, 1100000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 151, 1100000.0000, N'đến hết ngày 10/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 229, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 295, 1000000.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (11, 296, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (12, 148, 1000000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (12, 149, 1100000.0000, N'đến hết ngày 25/8')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (12, 152, 1000000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (12, 230, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 153, 1500000.0000, N'đến hết tháng 8')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 235, 1300000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 259, 1400000.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 260, 1400000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 301, 1400000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 302, 1400000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (13, 331, 1000000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 154, 1500000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 236, 1300000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 265, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 266, 1000000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 307, 999999.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 308, 999999.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (14, 332, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (15, 169, 1000000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (15, 242, 1000000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (15, 313, 1299999.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (15, 314, 1299999.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (16, 170, 1000000.0000, N'đến hết ngày 25/8')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (16, 243, 4500000.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (16, 277, 1000000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (16, 278, 1000000.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (17, 193, 500000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (17, 247, 1200000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (17, 283, 1000000.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (17, 326, 1299999.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (18, 194, 500000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (18, 217, 1000000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (18, 248, 1200000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (18, 284, 1000000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (18, 319, 1099999.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (19, 218, 1000000.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (19, 253, 1000000.0000, N'đến hết tháng 9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (19, 320, 1099999.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 223, 1300000.0000, N'đến hết ngày 30/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 224, 1300000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 254, 1000000.0000, N'đến hết 15/10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 289, 1200000.0000, N'đến hết ngày 28/9')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 290, 1200000.0000, N'đến hết tháng 10')
INSERT [dbo].[ChiTietKhuyenMai] ([IDKhuyenMai], [IDPhongKS], [Gia], [ThoiGian]) VALUES (20, 325, 1299999.0000, N'đến hết 15/10')
GO
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (30, 8)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (31, 9)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (32, 10)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (33, 14)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (34, 13)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (35, 10)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (36, 11)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (37, 8)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (38, 9)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (39, 11)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (40, 12)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (41, 9)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (42, 10)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (45, 10)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (46, 11)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (47, 12)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (48, 13)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (49, 8)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (50, 9)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (51, 10)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (52, 11)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (53, 12)
INSERT [dbo].[ChiTietLoaiKS] ([IDKS], [IDLoaiKS]) VALUES (54, 8)
GO
SET IDENTITY_INSERT [dbo].[DatPhong] ON 

INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (7, 145, N'duchuy@gmail.com', N'9482377877', N'1 ngày', 2)
INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (8, 146, N'tienhuy@gmail.com', N'9698789878', N'2 ngày', 2)
INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (9, 147, N'huudung@gmail.com', N'3867845673', N'3 ngày', 2)
SET IDENTITY_INSERT [dbo].[DatPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachSan] ON 

INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (30, N'Melia Hồ Tràm Beach Resort', N'Hồ Tràm, Xã Phước Thuận, Huyện Xuyên Mộc, Vũng Tàu', N'130505661.jpg', N'Giá đặc biệt chỉ từ 1.200k/đêm', 1)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (31, N'The Cliff Resort & Residences Mũi Né', N'Khu Phố 5, phường Phú Hài, Phan Thiết ', N'the-cliff-resort-residences-0.jpg', N'Ưu đãi giá tốt chỉ từ 800k/khách/đêm', 2)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (32, N'Hyatt Regency Danang Resort & Spa', N'Phường Hòa Hải, Ngũ Hành Sơn, Đà Nẵng ', N'4c48b87b87ca7e9427db15-1021494.jpg', N'Siêu khuyến mãi chỉ từ 11.000k/đêm', 3)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (33, N'Vinpearl Luxury Landmark 81', N'Vinhomes Central Park, số 208 Nguyễn Hữu Cảnh, phường 22, quận Bình Thạnh, Hồ Chí Minh (Sài Gòn) ', N'vinpearl-luxury-landmark-81-4.jpg', N'Hè vui rộn rã chỉ từ 1.320k/khách', 5)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (34, N'Sofitel Legend Metropole Hanoi', N'15 Ngô Quyền, Hoàn Kiếm, Hà Nội ', N'sofitel-legend-metropole-hanoi-5.jpg', N'Giá siêu tốt chỉ từ 1.070k/đêm', 6)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (35, N'Six Senses Ninh Vân Bay', N'Ninh Vân, Ninh Hòa, Nha Trang', N'six-senses-ninh-van-bay.jpg', N'Giá sốc chỉ từ 3.100k/đêm', 7)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (36, N'Vinpearl Phú Quốc Resort & Spa', N'Bãi Dài, Xã Gành Dầu, Phú Quốc ', N'vinpearl-resort-spa-phu-quoc-1-1-1628147.jpg', N'Chỉ từ 1.071k/khách đặt 03 đêm | Phiếu quà tặng 500.000', 8)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (37, N'Vinpearl Đà Nẵng Resort & Spa', N'Đường Trường Sa, Phường Hòa Hải, Quận Ngũ Hành Sơn, Đà Nẵng', N'khach-san-fusion-suites-vung-tau-8.jpg', N'Siêu đẳng cấp từ 21.300k/đêm', 3)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (38, N'Khách sạn Golden Bay Đà Nẵng', N'01 Lê Văn Duyệt, Quận Sơn Trà, Đà Nẵng', N'khach-san-intercontinental-nha-trang-0.jpg', N'View tuyệt đẹp chỉ từ 1.600k/đêm', 3)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (39, N'Khách sạn Four Points by Sheraton Danang', N'118 - 120 Võ Nguyên Giáp, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng', N'khach-san-seashells-phu-quoc-1.jpg', N'Giá sốc chỉ từ 1.115k/đêm', 3)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (40, N'InterContinental Nha Trang', N'118 - Võ Thị Sáu - Liên Chiểu', N'melia-ho-tram-6701-1632578.jpg', N'Siêu hot chỉ từ 1.430k/đêm', 3)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (41, N'Vinoasis Phú Quốc', N'Phú Quốc', N'minera-binh-chau-hot-spring-resort.jpg', N'Hot nhất nhì Đảo Ngọc, từ 1.820k/đêm', 8)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (42, N'Lan Rừng Phước Hải Resort & Spa', N'Tỉnh lộ 44A, thị trấn Phước Hải, huyện Đất Đỏ, tỉnh Bà Rịa Vũng Tàu, Vũng Tàu', N'lan-rung-phuoc-hai-resort-spa-11.jpg', N'Ưu đãi trong tuần giá chỉ còn từ 735k/khách', 1)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (45, N'Anantara Mui Ne Resort', N'12A Nguyễn Đình Chiểu, Hàm Tiến, Phan Thiết', N'anantara-mui-ne-resort (1).jpg', N'Ưu đãi giá tốt từ 2.xxx.000VND/đêm', 2)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (46, N'Khách sạn InterContinental Saigon', N'Ngã tư Hai Bà Trưng và Lê Duẩn, Quận 1, Hồ Chí Minh (Sài Gòn)', N'khach-san-intercontinental-saigon.jpg', N'Miễn phí trẻ em từ 2.000k/ đêm', 5)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (47, N'Khách sạn Melia Hanoi', N'44B phố Lý Thường Kiệt, Hà Nội', N'khach-san-melia-hanoi.jpg', N'Ưu đãi giá tốt chỉ từ 1.025k/khách', 6)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (48, N'Movenpick Cam Ranh Resort Nha Trang', N'Lô D12 ABC, xã Cam Hải Đông, huyện Cam Lâm, Nha Trang', N'movenpick-cam-ranh-resort-nha-trang-2.jpg', N'Biệt thự có hồ bơi từ 1.320k/ người - Đến 31/08', 7)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (49, N'VinOasis Phú Quốc Resort', N'Bãi Dài, Xã Gành Dầu, Phú Quốc', N'vinoasis-phu-quoc-resort-0.jpg', N'Chỉ từ 910k/khách đặt 03 đêm | Phiếu quà tặng 500.000', 8)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (50, N'InterContinental Phú Quốc Long Beach Resort', N'Bãi Trường, Xã Dương Tơ, Phú Quốc ', N'intercontinental-phu-quoc-long-beach-resort-6.jpg', N'Giá sốc thành viên tặng thêm đến 700k', 8)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (51, N'Premier Village Phu Quoc Resort Managed By AccorHotels', N'Mũi Ông Đội, thị trấn An Thới, Phú Quốc ', N'premier-village-phu-quoc-resort-managed-by-accorhotels-3.jpg', N'Ưu đãi khách Việt từ 1029k/khách-Biệt thự 3 phòng ngủ', 8)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (52, N'InterContinental Grand Hồ Tràm', N'Phước Thuận, Xuyên Mộc, Vũng Tàu', N'the-grand-ho-tram-strip.jpg', N'Giá sốc thứ 6-thứ 7 từ 1.6xxk/ khách-Chỉ trong tháng 6', 1)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (53, N'Terracotta Đà Lạt Hotel & Resort', N'Phân khu chức năng 7.9, Khu du lịch Tuyền Lâm, Phường 3, Đà Lạt', N'terracotta-da-lat-hotel-resort-0.jpg', N'Ưu đãi tháng 6 giá chỉ từ 520k/khách', 9)
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [DiaChi], [Anh], [MoTa], [IDThanhPho]) VALUES (54, N'Khách sạn Colline Đà Lạt', N'10 Phan Bội Châu, Phường 1, Đà Lạt', N'21a3292-hdr-1359413.jpg', N'Ưu đãi tháng 5 + 6 giá chỉ từ 595k/khách', 9)
SET IDENTITY_INSERT [dbo].[KhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (11, N'Khuyến mãi InterContinental Đà Nẵng Sun Peninsula Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (12, N'Khuyến mãi Sheraton Grand Đà Nẵng Resort', N'Khuyến mãi mừng khai trương')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (13, N'Khuyến mãi Hyatt Regency Danang Resort & Spa', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (14, N'Khuyến mãi Furama Đà Nẵng Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (15, N'Khuyến mãi Pullman Danang Beach Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (16, N'Khuyến mãi Premier Village Danang Resort Managed by Accor', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (17, N'Khuyến mãi khách sạn Mường Thanh Luxury Đà Nẵng', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (18, N'Khuyến mãi Vinpearl Đà Nẵng Resort & Spa', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (19, N'Khuyến mãi khách sạn Golden Bay Đà Nẵng', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (20, N'Khuyến mãi khách sạn Four Points by Sheraton Danang', N'Khuyến mãi chào hè')
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKS] ON 

INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (8, N'Khách sạn 1 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (9, N'Khách sạn 2 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (10, N'Khách sạn 3 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (11, N'Khách sạn 4 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (12, N'Khách sạn 5 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (13, N'Khách sạn gần biển')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (14, N'Khách sạn gần trung tâm thành phố')
SET IDENTITY_INSERT [dbo].[LoaiKS] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongKS] ON 

INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (145, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (146, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (147, N'103', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (148, N'104', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (149, N'201', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (150, N'202', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (151, N'203', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (152, N'204', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (153, N'301', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (154, N'302', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (155, N'303', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (156, N'304', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (157, N'401', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (158, N'402', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (159, N'403', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (160, N'404', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (161, N'501', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (162, N'502', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (163, N'503', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (164, N'504', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (165, N'601', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (166, N'602', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (167, N'603', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (168, N'604', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (169, N'101', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (170, N'102', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (171, N'103', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (172, N'104', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (173, N'201', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (174, N'202', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (175, N'203', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (176, N'204', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (177, N'301', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (178, N'302', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (179, N'303', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (180, N'304', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (181, N'401', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (182, N'402', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (183, N'403', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (184, N'404', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (185, N'501', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (186, N'502', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (187, N'503', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (188, N'504', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (189, N'601', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (190, N'602', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (191, N'603', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (192, N'604', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (193, N'101', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (194, N'102', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (195, N'103', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (196, N'104', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (197, N'201', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (198, N'202', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (199, N'203', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (200, N'204', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (201, N'301', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (202, N'302', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (203, N'303', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (204, N'304', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (205, N'401', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (206, N'402', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (207, N'403', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (208, N'404', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (209, N'501', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (210, N'502', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (211, N'503', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (212, N'504', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (213, N'601', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (214, N'602', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (215, N'603', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (216, N'604', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (217, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (218, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (219, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (220, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (221, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (222, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 34)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (223, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (224, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (225, N'301', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (226, N'302', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (227, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (228, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 35)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (229, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (230, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (231, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (232, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (233, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (234, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 36)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (235, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (236, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (237, N'301', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (238, N'302', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (239, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (240, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 37)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (241, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 38)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (242, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 38)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (243, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 38)
GO
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (244, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 38)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (245, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 38)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (246, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 38)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (247, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (248, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (249, N'301', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (250, N'302', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (251, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (252, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 39)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (253, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (254, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (255, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (256, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (257, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (258, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 40)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (259, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (260, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (261, N'301', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (262, N'302', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (263, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (264, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 41)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (265, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (266, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (267, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (268, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (269, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (270, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 42)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (277, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (278, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (279, N'301', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (280, N'302', N'Cao cấp', 4500000.0000, N'Phòng tầng ba', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (281, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (282, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 45)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (283, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (284, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (285, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (286, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (287, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (288, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 46)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (289, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (290, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (291, N'301', N'Cao cấp', 4700000.0000, N'Phòng tầng ba', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (292, N'302', N'Cao cấp', 4700000.0000, N'Phòng tầng ba', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (293, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (294, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 47)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (295, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (296, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (297, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (298, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (299, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (300, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 48)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (301, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (302, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (303, N'301', N'Cao cấp', 4900000.0000, N'Phòng tầng ba', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (304, N'302', N'Cao cấp', 4900000.0000, N'Phòng tầng ba', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (305, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (306, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 49)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (307, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (308, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (309, N'304', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (310, N'305', N'Cao cấp', 5000000.0000, N'Phòng tầng ba', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (311, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (312, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 50)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (313, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (314, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (315, N'301', N'Cao cấp', 5100000.0000, N'Phòng tầng ba', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (316, N'302', N'Cao cấp', 5100000.0000, N'Phòng tầng ba', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (317, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (318, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 51)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (319, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (320, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (321, N'304', N'Cao cấp', 5200000.0000, N'Phòng tầng ba', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (322, N'305', N'Cao cấp', 5200000.0000, N'Phòng tầng ba', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (323, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (324, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 52)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (325, N'201', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (326, N'202', N'Tiêu chuẩn', 1500000.0000, N'Phòng tầng hai', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (327, N'301', N'Cao cấp', 5300000.0000, N'Phòng tầng ba', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (328, N'302', N'Cao cấp', 5300000.0000, N'Phòng tầng ba', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (329, N'401', N'hạng sang', 9000000.0000, N'Phòng tầng thượng', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (330, N'402', N'Hạng sang', 9000000.0000, N'Phòng tầng thượng', 53)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (331, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 54)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (332, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 54)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (333, N'304', N'Cao cấp', 5400000.0000, N'Phòng tầng ba', 54)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (334, N'305', N'Cao cấp', 5400000.0000, N'Phòng tầng ba', 54)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (335, N'1001', N'hạng sang', 10000000.0000, N'Phòng tầng thượng', 54)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (336, N'1002', N'Hạng sang', 10000000.0000, N'Phòng tầng thượng', 54)
SET IDENTITY_INSERT [dbo].[PhongKS] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (4, N'111111          ', N'Bùi Hữu Dũng', N'Hà Nội', N'0123456789      ', 1)
INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (5, N'111111          ', N'Trần Đức Huy', N'Hà Tĩnh', N'0123456789      ', 1)
INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (6, N'111111          ', N'Nguyễn Tiến Huy', N'Bắc Ninh', N'0123456789      ', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhPho] ON 

INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (1, N'Vũng Tàu', N'vung-tau.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (2, N'Phan Thiết', N'phan-thiet.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (3, N'Đà Nẵng', N'da-nang.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (5, N'TP Hồ Chí Minh', N'ho-chi-minh.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (6, N'Hà Nội', N'hanoi.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (7, N'Nha Trang', N'nha-trang.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (8, N'Kiên Giang', N'phu-quoc.jpg')
INSERT [dbo].[ThanhPho] ([IDThanhPho], [Ten], [Anh]) VALUES (9, N'Đà Lạt', N'dalat.jpg')
SET IDENTITY_INSERT [dbo].[ThanhPho] OFF
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai] FOREIGN KEY([IDKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([IDKhuyenMai])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_Phong] FOREIGN KEY([IDPhongKS])
REFERENCES [dbo].[PhongKS] ([IDPhongKS])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_Phong]
GO
ALTER TABLE [dbo].[ChiTietLoaiKS]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiKS_KS] FOREIGN KEY([IDKS])
REFERENCES [dbo].[KhachSan] ([IDKS])
GO
ALTER TABLE [dbo].[ChiTietLoaiKS] CHECK CONSTRAINT [FK_ChiTietLoaiKS_KS]
GO
ALTER TABLE [dbo].[ChiTietLoaiKS]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiKS_LoaiKS] FOREIGN KEY([IDLoaiKS])
REFERENCES [dbo].[LoaiKS] ([IDLoaiKs])
GO
ALTER TABLE [dbo].[ChiTietLoaiKS] CHECK CONSTRAINT [FK_ChiTietLoaiKS_LoaiKS]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_Phong] FOREIGN KEY([IDPhongKS])
REFERENCES [dbo].[PhongKS] ([IDPhongKS])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_Phong]
GO
ALTER TABLE [dbo].[KhachSan]  WITH CHECK ADD  CONSTRAINT [FK_KhachSan_ThanhPho] FOREIGN KEY([IDThanhPho])
REFERENCES [dbo].[ThanhPho] ([IDThanhPho])
GO
ALTER TABLE [dbo].[KhachSan] CHECK CONSTRAINT [FK_KhachSan_ThanhPho]
GO
ALTER TABLE [dbo].[PhongKS]  WITH CHECK ADD  CONSTRAINT [FK_PhongKS_KS] FOREIGN KEY([IDKS])
REFERENCES [dbo].[KhachSan] ([IDKS])
GO
ALTER TABLE [dbo].[PhongKS] CHECK CONSTRAINT [FK_PhongKS_KS]
GO
USE [master]
GO
ALTER DATABASE [CHUDU] SET  READ_WRITE 
GO
