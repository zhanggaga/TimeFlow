USE [master]
GO
/****** Object:  Database [TimeFlow]    Script Date: 07/05/2016 17:13:20 ******/
CREATE DATABASE [TimeFlow] ON  PRIMARY 
( NAME = N'TimeFlow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TimeFlow.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeFlow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TimeFlow_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimeFlow] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeFlow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeFlow] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TimeFlow] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TimeFlow] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TimeFlow] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TimeFlow] SET ARITHABORT OFF
GO
ALTER DATABASE [TimeFlow] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TimeFlow] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TimeFlow] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TimeFlow] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TimeFlow] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TimeFlow] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TimeFlow] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TimeFlow] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TimeFlow] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TimeFlow] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TimeFlow] SET  DISABLE_BROKER
GO
ALTER DATABASE [TimeFlow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TimeFlow] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TimeFlow] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TimeFlow] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TimeFlow] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TimeFlow] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TimeFlow] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TimeFlow] SET  READ_WRITE
GO
ALTER DATABASE [TimeFlow] SET RECOVERY FULL
GO
ALTER DATABASE [TimeFlow] SET  MULTI_USER
GO
ALTER DATABASE [TimeFlow] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TimeFlow] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeFlow', N'ON'
GO
USE [TimeFlow]
GO
/****** Object:  Table [dbo].[Habbit]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Habbit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Habbit__3214EC2730F848ED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Habbit] ON
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (1, N'文艺')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (2, N'小清新')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (3, N'可爱')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (4, N'运动')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (5, N'音乐')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (6, N'摇滚')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (7, N'动漫')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (8, N'摄影')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (9, N'旅行')
INSERT [dbo].[Habbit] ([ID], [Name]) VALUES (10, N'电影')
SET IDENTITY_INSERT [dbo].[Habbit] OFF
/****** Object:  Table [dbo].[Label]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Label](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [varchar](20) NULL,
 CONSTRAINT [PK__Label__3214EC270EA330E9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_label_name] UNIQUE NONCLUSTERED 
(
	[LabelName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Label] ON
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (5, N'电影')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (1, N'风景')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (3, N'纪实')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (2, N'建筑')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (4, N'美食')
SET IDENTITY_INSERT [dbo].[Label] OFF
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[ID] [int] NOT NULL,
	[FollowerNum] [int] NULL,
	[FolloweeNum] [int] NULL,
	[NickName] [varchar](40) NULL,
	[Sex] [char](1) NULL,
	[Pic] [varchar](40) NULL,
	[Country] [varchar](8) NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](10) NULL,
 CONSTRAINT [PK__ClientIn__3214EC2707020F21] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (1, 50, 50, N'gaga', N'F', N'Portrait/1.jpg', N'China', N'ChongQing', N'ChongQing')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (2, 50, 50, N'cm', N'F', N'Portrait/2.jpg', N'China', N'ZheJiang', N'TaiZhou')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (3, 50, 50, N'YiHuaLing', N'F', N'Portrait/3.jpg', N'China', N'SiChuan', N'BaZhong')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (4, 50, 50, N'HuWanLin', N'F', N'Portrait/4.jpg', N'China', N'SiChuan', N'ChengDu')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (5, 50, 50, N'XingPengFei', N'M', N'Portrait/5.jpg', N'China', N'SiChuan', N'ChengDu')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (6, 50, 50, N'Jay', N'M', N'Portrait/6.jpg', N'China', N'ChongQing', N'ChongQing')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (7, 50, 50, N'Jeff', N'M', N'Portrait/7.jpg', N'China', N'ChongQing', N'ChongQing')
/****** Object:  Table [dbo].[Client]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [varchar](40) NULL,
	[Phone] [varchar](20) NULL,
	[Password] [varchar](40) NULL,
	[addData] [datetime] NULL,
	[validateCode] [varchar](50) NULL,
	[UserState] [int] NULL,
	[LockState] [int] NULL,
 CONSTRAINT [PK__Client__3214EC2703317E3D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (1, N'1421636811@qq.com', N'13368191682', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A513018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (2, N'1234567890@163.com', N'13368197138', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A531018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (3, N'20131947@qq.com', N'13347253451', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A56E018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (4, N'20131946@qq.com', N'13324156782', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A58D018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (5, N'20131945@qq.com', N'13345178672', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A5AC018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (6, N'15@qq.com', NULL, N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A5C9018B80D4 AS DateTime), NULL, 1, 1)
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password], [addData], [validateCode], [UserState], [LockState]) VALUES (7, NULL, N'13345178671', N'96E79218965EB72C92A549DD5A330112', CAST(0x0000A5E8018B80D4 AS DateTime), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  Table [dbo].[Album]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [varchar](40) NOT NULL,
 CONSTRAINT [PK__Album__3214EC271273C1CD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Album] ON
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (1, N'School')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (2, N'Animal')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (3, N'Flower')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (4, N'Building')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (5, N'People')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (6, N'Food')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (7, N'Sea')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (8, N'Saturday')
SET IDENTITY_INSERT [dbo].[Album] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](40) NULL,
 CONSTRAINT [PK__Admin__3214EC277F60ED59] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (1, N'Iris', N'96E79218965EB72C92A549DD5A330112')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (2, N'Bella', N'96E79218965EB72C92A549DD5A330112')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (3, N'Emma', N'96E79218965EB72C92A549DD5A330112')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (4, N'Chris', N'96E79218965EB72C92A549DD5A330112')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (5, N'Jay', N'96E79218965EB72C92A549DD5A330112')
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Table [dbo].[Photo]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Photo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Pic] [varchar](80) NOT NULL,
	[CommentsNum] [int] NOT NULL,
	[LikeNum] [int] NOT NULL,
	[AlbumID] [int] NULL,
	[ClientID] [int] NOT NULL,
	[IfPublic] [char](1) NOT NULL,
 CONSTRAINT [PK__Photo__3214EC27164452B1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Photo] ON
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), N'picture/1.jpg', 3, 10, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (2, CAST(0x0000A51400107994 AS DateTime), N'picture/2.jpg', 1, 0, 2, 1, N'N')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (3, CAST(0x0000A53200AD08E0 AS DateTime), N'picture/3.jpg', 1, 15, 3, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (4, CAST(0x0000A5E900AD08E0 AS DateTime), N'picture/4.jpg', 2, 12, 4, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (5, CAST(0x0000A60700AD08E0 AS DateTime), N'picture/5.jpg', 0, 0, 5, 4, N'N')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (6, CAST(0x0000A63700A98864 AS DateTime), N'picture/6.jpg', 0, 0, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (7, CAST(0x0000A63700A9BF78 AS DateTime), N'picture/7.jpg', 0, 0, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (8, CAST(0x0000A63700AE9624 AS DateTime), N'picture/8.jpg', 0, 0, 8, 2, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (9, CAST(0x0000A63701024404 AS DateTime), N'picture/9.jpg', 0, 0, 3, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (10, CAST(0x0000A6370112BEC4 AS DateTime), N'picture/10.jpg', 0, 0, 6, 4, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (11, CAST(0x0000A63701130514 AS DateTime), N'picture/11.jpg', 0, 1, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (12, CAST(0x0000A63701141E54 AS DateTime), N'picture/12.jpg', 0, 1, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (13, CAST(0x0000A63701233984 AS DateTime), N'picture/13.jpg', 0, 1, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (14, CAST(0x0000A63701442F04 AS DateTime), N'picture/14.jpg', 0, 2, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (15, CAST(0x0000A63701652484 AS DateTime), N'picture/15.jpg', 0, 3, 2, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (16, CAST(0x0000A63701759F44 AS DateTime), N'picture/16.jpg', 0, 5, 2, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (17, CAST(0x0000A63701861A04 AS DateTime), N'picture/17.jpg', 0, 8, 7, 5, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (18, CAST(0x0000A6370188D924 AS DateTime), N'picture/18.jpg', 0, 0, 8, 2, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (19, CAST(0x0000A638008EE8C4 AS DateTime), N'picture/19.jpg', 0, 0, 3, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (20, CAST(0x0000A6380112BEC4 AS DateTime), N'picture/20.jpg', 0, 0, 5, 4, N'N')
SET IDENTITY_INSERT [dbo].[Photo] OFF
/****** Object:  Table [dbo].[Follower]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follower](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FollowerID] [int] NOT NULL,
	[FolloweeID] [int] NOT NULL,
 CONSTRAINT [PK__Follower__3214EC2724927208] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Follower] ON
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (1, 1, 2)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (2, 1, 3)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (3, 4, 5)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (4, 2, 4)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (5, 3, 5)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (6, 1, 4)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (7, 1, 5)
INSERT [dbo].[Follower] ([ID], [FollowerID], [FolloweeID]) VALUES (10, 3, 1)
SET IDENTITY_INSERT [dbo].[Follower] OFF
/****** Object:  Table [dbo].[Habbit_User]    Script Date: 07/05/2016 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habbit_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HabbitID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK__Habbit_U__3214EC2734C8D9D1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_habbit] UNIQUE NONCLUSTERED 
(
	[HabbitID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Habbit_User] ON
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (1, 1, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (6, 1, 2)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (10, 1, 3)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (2, 2, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (7, 2, 2)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (11, 2, 3)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (8, 3, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (9, 3, 2)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (3, 3, 3)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (17, 4, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (4, 4, 4)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (16, 5, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (12, 5, 4)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (5, 5, 5)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (14, 5, 6)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (15, 5, 7)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (18, 7, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (20, 7, 5)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (19, 7, 6)
SET IDENTITY_INSERT [dbo].[Habbit_User] OFF
/****** Object:  View [dbo].[View_habbit_user]    Script Date: 07/05/2016 17:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_habbit_user]
as
select [TimeFlow].[dbo].[ClientInfo].NickName, Habbit.Name, ClientInfo.ID as Cid, Habbit.ID as Hid
from [TimeFlow].[dbo].[ClientInfo], [TimeFlow].[dbo].[Habbit_User],[TimeFlow].[dbo].[Habbit]
where [TimeFlow].[dbo].[Habbit_User].ClientID = [TimeFlow].[dbo].[ClientInfo].ID and [TimeFlow].[dbo].[Habbit_User].HabbitID = Habbit.ID
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_All_Fan]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_All_Fan](@ClientID int='')
returns @all_info table (Follower_id int,Follower_num int,Followee_num int,Nickname varchar(40),
Sex char(1),Client_pic varchar(40),Country varchar(8),Province varchar(20),City varchar(10),ID int)
as
begin
insert @all_info
	select distinct ClientInfo.ID,FollowerNum,FolloweeNum,NickName,Sex,Pic,Country,Province,City,Follower.ID
    from ClientInfo,Follower 
    where  ClientInfo.ID = Follower.FollowerID and Follower.FolloweeID = @ClientID     
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_Cilent_photo]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_Cilent_photo]()
returns @all_info table (Client_id int,Client_name varchar(40), photo_num int, like_num int, 
follow_num int, followee_num int, album_num int)
as
begin
insert @all_info
	select ClientInfo.ID, ClientInfo.NickName,COUNT(distinct Photo.ID),SUM(Photo.LikeNum), ClientInfo.FollowerNum,
	ClientInfo.FolloweeNum, COUNT(distinct Photo.AlbumID)
	from ClientInfo, Photo
	where ClientInfo.ID = Photo.ClientID
	group by ClientInfo.ID, ClientInfo.NickName, ClientInfo.FolloweeNum, ClientInfo.FollowerNum
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_Cilent_album]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_Cilent_album](@Client_id int='')
returns @all_info table (Client_id int,Client_name varchar(40), photo_id int,pic varchar(80), like_num int, comment_num int,
album_name varchar(40),album_id int)
as
begin
insert @all_info
	select ClientInfo.ID, ClientInfo.NickName,Photo.ID,Photo.Pic,Photo.LikeNum, Photo.CommentsNum,
	Album.AlbumName, Album.ID 
	from ClientInfo, Photo, Album 
	where ClientInfo.ID = Photo.ClientID and Photo.AlbumID = Album.ID and ClientInfo.ID = @Client_id order by Album.ID
	return
	end
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Content] [varchar](120) NOT NULL,
	[PrintUserID] [int] NOT NULL,
	[ReceiveUserID] [int] NOT NULL,
	[PhotoID] [int] NOT NULL,
 CONSTRAINT [PK__Comment__3214EC272A4B4B5E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), N'明天快到了', 2, 1, 1)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (2, CAST(0x0000A51400000000 AS DateTime), N'又是新的一天', 1, 2, 1)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (3, CAST(0x0000A51400008CA0 AS DateTime), N'该睡觉啦', 2, 1, 1)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (4, CAST(0x0000A5AC017B0740 AS DateTime), N'你个傻逼', 2, 3, 2)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (5, CAST(0x0000A60600E6B680 AS DateTime), N'翘课出去玩', 4, 3, 3)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (6, CAST(0x0000A60800F73140 AS DateTime), N'热成狗了', 3, 4, 4)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (7, CAST(0x0000A60800F7BDE0 AS DateTime), N'天气预报说会有暴雨', 5, 3, 4)
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  UserDefinedFunction [dbo].[fun_get_Follower_Photo]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_Follower_Photo](@ClientID int='')

returns @all_info table (Client_id int,Nickname varchar(40),ClientInfo_pic varchar(40),Photo_id int,Photo_time datetime,Photo_pic varchar(80),Photo_commentsNum int,
Photo_likeNum int)
as
begin
insert @all_info
	select Photo.ClientID,ClientInfo.NickName,ClientInfo.Pic,Photo.ID,Photo.[Time],Photo.Pic,Photo.CommentsNum,Photo.LikeNum 
    from ClientInfo,Follower,Photo 
    where ClientInfo.ID = Follower.FolloweeID and Photo.ClientID = Follower.FolloweeID  and Follower.FollowerID = @ClientID and Photo.IfPublic = 'Y' 
	return
	end
GO
/****** Object:  Table [dbo].[Like]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_like] UNIQUE NONCLUSTERED 
(
	[PhotoID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Like] ON
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (1, 1, 1)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (2, 3, 3)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (3, 4, 3)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (4, 6, 1)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (5, 7, 1)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (6, 8, 2)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (7, 9, 3)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (8, 10, 4)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (9, 11, 1)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (10, 12, 1)
INSERT [dbo].[Like] ([ID], [PhotoID], [ClientID]) VALUES (11, 13, 1)
SET IDENTITY_INSERT [dbo].[Like] OFF
/****** Object:  Table [dbo].[Label_Photo]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Label_Photo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[LabelID] [int] NOT NULL,
	[PhotoID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Label_Photo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unique_label] UNIQUE NONCLUSTERED 
(
	[LabelID] ASC,
	[PhotoID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Label_Photo] ON
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), 1, 1, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (2, CAST(0x0000A51400107994 AS DateTime), 4, 2, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (3, CAST(0x0000A53200AD08E0 AS DateTime), 1, 3, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (4, CAST(0x0000A5E900AD08E0 AS DateTime), 2, 4, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (5, CAST(0x0000A60700AD08E0 AS DateTime), 3, 5, 4)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (6, CAST(0x0000A63700A98864 AS DateTime), 3, 6, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (7, CAST(0x0000A63700A9BF78 AS DateTime), 4, 7, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (8, CAST(0x0000A63700AE9624 AS DateTime), 4, 8, 2)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (9, CAST(0x0000A63701024404 AS DateTime), 1, 9, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (10, CAST(0x0000A6370112BEC4 AS DateTime), 5, 10, 4)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (11, CAST(0x0000A63701130514 AS DateTime), 1, 11, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (12, CAST(0x0000A63701141E54 AS DateTime), 4, 12, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (13, CAST(0x0000A63701233984 AS DateTime), 1, 13, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (14, CAST(0x0000A63701442F04 AS DateTime), 4, 14, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (15, CAST(0x0000A63701652484 AS DateTime), 1, 15, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (16, CAST(0x0000A63701759F44 AS DateTime), 1, 16, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (17, CAST(0x0000A63701861A04 AS DateTime), 5, 17, 5)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (18, CAST(0x0000A6370188D924 AS DateTime), 5, 18, 2)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (19, CAST(0x0000A638008EE8C4 AS DateTime), 2, 19, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (20, CAST(0x0000A6380112BEC4 AS DateTime), 2, 20, 4)
SET IDENTITY_INSERT [dbo].[Label_Photo] OFF
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_ByTime_getLabelinTime]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_ByTime_getLabelinTime](@Client_id int='')
returns @all_info table ([time] datetime,LabelID int, PhotoID int, id int)
as
begin
insert @all_info
	select [Time], LabelID, PhotoID,ROW_NUMBER() OVER (ORDER BY [time]desc) as id
	from Label_Photo
	where @Client_id  = ClientID order by [Time] desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_getLabels](@Client_id int='')
returns @all_info table (label_id int, label_name varchar(20),time datetime)
as
begin
insert @all_info
	select Label_Photo.LabelID, Label.LabelName, Label_Photo.Time
	from Label_Photo,Label
	where  Label.ID = Label_Photo.LabelID and Label_Photo.ClientID = @Client_id
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_FanInfo_Followed]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_FanInfo_Followed](@ClientID int='')

returns @all_info table (Follower_id int,Followee_id int,Follower_num int,Followee_num int,Nickname varchar(40),
Sex char(1),Client_pic varchar(40),Country varchar(8),Province varchar(20),City varchar(10),IF_Followed int)
as
begin
insert @all_info
	select  distinct b.Follower_id,Follower.FollowerID,b.Follower_num,b.Followee_num,b.Nickname,b.Sex,b.Client_pic,b.Country,b.Province,b.City,b.ID
	from Follower,fun_get_All_Fan(@ClientId) b
	where Follower.FollowerID = @ClientID and Follower.FolloweeID = b.Follower_id
	
    update @all_info set IF_followed = 1 
       
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similar_Client]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similar_Client](@client_id int)
returns @all_info table (Client_id int,Client_name varchar(40),
habbit_name varchar(40),habbit_id int)
as
begin
insert @all_info
	select b.Cid, b.NickName, a.Name, a.Hid
	from View_habbit_user a, View_habbit_user b
	where  a.Cid <> b.Cid and a.Hid = b.Hid and a.Cid = @client_id order by b.Cid
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_Photo_Label_Comments]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_Photo_Label_Comments]()

returns @all_info table (Photo_id int,Comment_time datetime,Comment_content varchar(120),Comment_printUserID int,Comment_receiveUserID int,Label_name varchar(20))
as
begin
insert @all_info
	select Photo.ID,Comment.[Time],Comment.Content,Comment.PrintUserID,Comment.ReceiveUserID,Label.LabelName
    from Photo,Comment,Label_Photo,Label 
    where Photo.ID = Comment.PhotoID and Photo.ID = Label_Photo.PhotoID and Label_Photo.LabelID = Label.ID and Photo.IfPublic = 'Y'
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_Follower_Photo_Label_Comments]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_Follower_Photo_Label_Comments](@ClientID int='')

returns @all_info table (Follower_id int,Nickname varchar(40),ClientInfo_pic varchar(40),Photo_id int,Photo_time datetime,Photo_pic varchar(80),Photo_commentsNum int,
Photo_likeNum int,Comment_time datetime,Comment_content varchar(120),Comment_printUserID int,Comment_receiveUserID int,Label_name varchar(20))
as
begin
insert @all_info
	select a.Client_id, a.Nickname,a.ClientInfo_pic,a.Photo_id,a.Photo_time,a.Photo_pic,a.Photo_commentsNum ,
a.Photo_likeNum, b.Comment_time,b.Comment_content,b.Comment_printUserID,b.Comment_receiveUserID,b.Label_name 
    from fun_get_Follower_Photo(@ClientID) a,fun_get_Photo_Label_Comments() b
    where a.Photo_id = b.Photo_id
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_FanInfo_NotFollowed]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_get_FanInfo_NotFollowed](@ClientID int='')

returns @all_info table (Follower_id int,Followee_id int,Follower_num int,Followee_num int,Nickname varchar(40),
Sex char(1),Client_pic varchar(40),Country varchar(8),Province varchar(20),City varchar(10),IF_Followed int)
as
begin
insert @all_info
	select distinct b.Follower_id,@ClientID,b.Follower_num,b.Followee_num,
	b.Nickname,b.Sex,b.Client_pic,b.Country,b.Province,b.City,b.ID 
	from Follower,fun_get_ALL_Fan(@ClientID) b 
	where  Follower_id not in(select Follower_id from fun_get_FanInfo_Followed(@ClientID))    
    
    update @all_info set IF_Followed = 0
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels_Count]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_getLabels_Count](@Client_id int='')
returns @all_info table (label_id int,label_name varchar(20),times int)
as
begin
insert @all_info
	select a.label_id, a.label_name,count(a.label_id)as times
	from fun_get_similiar_Label_getLabels(@Client_id) a
	group by a.label_id,a.label_name order by times desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_ByTime_Photo_RecentLabel]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similiar_Label_ByTime_Photo_RecentLabel](@Client_id int='')
returns @all_info table (LabelID int, id int)
as
begin
insert @all_info
	select  LabelID , id from fun_get_similiar_Label_ByTime_getLabelinTime(@Client_id)
	WHERE id  IN (select MIN(id) 
	from fun_get_similiar_Label_ByTime_getLabelinTime(@Client_id) GROUP BY LabelID);
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_ByTime_getPhoto]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_ByTime_getPhoto](@Client_id int='')
returns @all_info table (LabelID int,PhotoID int, ClientID int, [time] datetime)
as
begin
insert @all_info
	select distinct Label_Photo.LabelID, Label_Photo.PhotoID, Label_Photo.ClientID, Label_Photo.Time
	from Label_Photo,fun_get_similiar_Label_ByTime_getLabelinTime(@Client_id) a
	where a.LabelID  = Label_Photo.LabelID and Label_Photo.ClientID > @Client_id 
	order by Label_Photo.Time desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similar_Client_Count]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similar_Client_Count](@client_id int)
returns @all_info table (Client_id int,Times varchar(40))
as
begin
insert @all_info
	select a.Client_id,COUNT(a.Client_id)as times
	from fun_get_similar_Client(@client_id) a
	group by a.Client_id order by times desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_ByTime_PhotoDetail]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_ByTime_PhotoDetail](@Client_id int='')
returns @all_info table (PhotoID int,LikeNum int,CommentsNum int,pic varchar(80),id int)
as
begin
insert @all_info
	select  Photo.ID, Photo.LikeNum, Photo.CommentsNum, Photo.Pic,a.id
	from fun_get_similiar_Label_ByTime_Photo_RecentLabel(@Client_id) a, Photo,Label_Photo
	WHERE Label_Photo.LabelID = a.LabelID and Label_Photo.PhotoID = Photo.ID and Label_Photo.ClientID <> @Client_id
	
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels_photos]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similiar_Label_getLabels_photos](@Client_id int='')
returns @all_info table (times int,client_id int, photo_id int,lable_id int)
as
begin
insert @all_info
	select a.times as times,Label_Photo.ClientID, Label_Photo.PhotoID,Label_Photo.LabelID
	from fun_get_similiar_Label_getLabels_Count(@Client_id) a, Label_Photo
	where a.label_id = Label_Photo.LabelID and @Client_id <> Label_Photo.ClientID
	order by times desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similar_Client_Info]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similar_Client_Info](@Client_id int='')
returns @all_info table (Client_id int,Client_name varchar(40),Pic varchar(40))
as
begin
insert @all_info
	select a.Client_id, ClientInfo.NickName, ClientInfo.Pic
	from fun_get_similar_Client_Count(@Client_id) a, ClientInfo
	where  a.Client_id = ClientInfo.ID
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels_photos_photostime]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun_get_similiar_Label_getLabels_photos_photostime](@Client_id int='')
returns @all_info table (photo_id int, photo_show_time int)
as
begin
insert @all_info
	select a.photo_id,COUNT(a.photo_id) as photo_num
	from fun_get_similiar_Label_getLabels_photos(@Client_id) a
	group by a.photo_id
	order by photo_num desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels_photos_serialize]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similiar_Label_getLabels_photos_serialize](@Client_id int='')
returns @all_info table (photo_show_time int,photo_id int, label_times int)
as
begin
insert @all_info
	select b.photo_show_time,a.photo_id,a.times
	from fun_get_similiar_Label_getLabels_photos(@Client_id) a inner join fun_get_similiar_Label_getLabels_photos_photostime(@Client_id) b
	on a.photo_id = b.photo_id
	order by a.times desc,b.photo_show_time desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_getLabels_photos_getthePhoto]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similiar_Label_getLabels_photos_getthePhoto](@Client_id int='')
returns @all_info table (sum_label_time int,photo_id int, photo_show_time int)
as
begin
insert @all_info
	select SUM(a.label_times)as sum_label_time, a.photo_id,a.photo_show_time
	from fun_get_similiar_Label_getLabels_photos_serialize(@Client_id) a

	group by a.photo_id,a.photo_show_time order by sum_label_time desc,a.photo_show_time desc
	return
	end
GO
/****** Object:  UserDefinedFunction [dbo].[fun_get_similiar_Label_detail]    Script Date: 07/05/2016 17:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_get_similiar_Label_detail](@Client_id int='')
returns @all_info table (photo_id int,LikeNum int, CommentsNum int,IfPublic char(1),pic varchar(80))
as
begin
insert @all_info
	select a.photo_id, Photo.LikeNum, Photo.CommentsNum, Photo.IfPublic, Photo.Pic
	from fun_get_similiar_Label_getLabels_photos_getthePhoto(@Client_id) a, Photo
	where a.photo_id = Photo.ID
	return
	end
GO
/****** Object:  Default [DF__Photo__CommentsN__182C9B23]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__CommentsN__182C9B23]  DEFAULT ((0)) FOR [CommentsNum]
GO
/****** Object:  Default [DF__Photo__LikeNum__1920BF5C]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__LikeNum__1920BF5C]  DEFAULT ((0)) FOR [LikeNum]
GO
/****** Object:  ForeignKey [FK__Photo__AlbumID__1A14E395]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__AlbumID__1A14E395] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__AlbumID__1A14E395]
GO
/****** Object:  ForeignKey [FK__Photo__ClientID__1B0907CE]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__ClientID__1B0907CE] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__ClientID__1B0907CE]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__267ABA7A]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__267ABA7A] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__267ABA7A]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__276EDEB3]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__276EDEB3] FOREIGN KEY([FolloweeID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__276EDEB3]
GO
/****** Object:  ForeignKey [FK__Habbit_Us__Clien__36B12243]    Script Date: 07/05/2016 17:13:20 ******/
ALTER TABLE [dbo].[Habbit_User]  WITH CHECK ADD  CONSTRAINT [FK__Habbit_Us__Clien__36B12243] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Habbit_User] CHECK CONSTRAINT [FK__Habbit_Us__Clien__36B12243]
GO
/****** Object:  ForeignKey [FK__Comment__PhotoID__2E1BDC42]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PhotoID__2E1BDC42] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PhotoID__2E1BDC42]
GO
/****** Object:  ForeignKey [FK__Comment__PrintUs__2C3393D0]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PrintUs__2C3393D0] FOREIGN KEY([PrintUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PrintUs__2C3393D0]
GO
/****** Object:  ForeignKey [FK__Comment__Receive__2D27B809]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Receive__2D27B809] FOREIGN KEY([ReceiveUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Receive__2D27B809]
GO
/****** Object:  ForeignKey [FK__Like__ClientID__33D4B598]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Like]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
/****** Object:  ForeignKey [FK__Like__PhotoID__34C8D9D1]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Like]  WITH CHECK ADD FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
/****** Object:  ForeignKey [FK__Label_Pho__Clien__20C1E124]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Clien__20C1E124] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Clien__20C1E124]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Label__1FCDBCEB]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB] FOREIGN KEY([LabelID])
REFERENCES [dbo].[Label] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Photo__21B6055D]    Script Date: 07/05/2016 17:13:23 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Photo__21B6055D] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Photo__21B6055D]
GO
