USE [master]
GO
/****** Object:  DeleteDatabase [TimeFlow]    Script Date: 06/28/2016 22:24:14 ******/
declare @dbname sysname 
set @dbname='TimeFlow' --这个是要删除的数据库库名

declare @s nvarchar(1000) 
declare tb cursor local for 
select s='kill '+cast(spid as varchar) 
from master..sysprocesses 
where dbid=db_id(@dbname) 
open tb 
fetch next from tb into @s 
while @@fetch_status=0 
begin 
exec(@s) 
fetch next from tb into @s 
end 
close tb 
deallocate tb 
exec('drop database ['+@dbname+']')
/****** Object:  Database [TimeFlow]    Script Date: 06/28/2016 22:47:07 ******/
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
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 06/28/2016 22:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[ClientInfo] ON
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (1, 50, 50, N'gaga', N'F', N'C01/img/1.jpg', N'China', N'ChongQing', N'ChongQing')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (2, 50, 50, N'cm', N'F', N'C02/img/1.jpg', N'China', N'ZheJiang', N'TaiZhou')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (3, 50, 50, N'YiHuaLing', N'F', N'C03/img/1.jpg', N'China', N'SiChuan', N'BaZhong')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (4, 50, 50, N'HuWanLin', N'F', N'C04/img/1.jpg', N'China', N'SiChuan', N'ChengDu')
INSERT [dbo].[ClientInfo] ([ID], [FollowerNum], [FolloweeNum], [NickName], [Sex], [Pic], [Country], [Province], [City]) VALUES (5, 50, 50, N'XingPengFei', N'M', N'C05/img/1.jpg', N'China', N'SiChuan', N'ChengDu')
SET IDENTITY_INSERT [dbo].[ClientInfo] OFF
/****** Object:  Table [dbo].[Client]    Script Date: 06/28/2016 22:47:07 ******/
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
 CONSTRAINT [PK__Client__3214EC2703317E3D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password]) VALUES (1, N'1421636811@qq.com', N'13368191682', N'123456')
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password]) VALUES (2, N'1234567890@163.com', N'13368197138', N'123456')
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password]) VALUES (3, N'20131947@cqu.cn', N'13347253451', N'123456')
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password]) VALUES (4, N'20131946@cqu.cn', N'13324156782', N'123456')
INSERT [dbo].[Client] ([ID], [Mail], [Phone], [Password]) VALUES (5, N'20131945@cqu.cn', N'13345178672', N'123456')
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  Table [dbo].[Album]    Script Date: 06/28/2016 22:47:07 ******/
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
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (1, N'Scene')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (2, N'Animal')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (3, N'Flower')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (4, N'Building')
INSERT [dbo].[Album] ([ID], [AlbumName]) VALUES (5, N'People')
SET IDENTITY_INSERT [dbo].[Album] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 06/28/2016 22:47:07 ******/
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
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (1, N'Iris', N'111')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (2, N'Bella', N'222')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (3, N'Emma', N'333')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (4, N'Chris', N'444')
INSERT [dbo].[Admin] ([ID], [Username], [Password]) VALUES (5, N'Jay', N'555')
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Table [dbo].[Habbit]    Script Date: 06/28/2016 22:47:07 ******/
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
SET IDENTITY_INSERT [dbo].[Habbit] OFF
/****** Object:  Table [dbo].[Label]    Script Date: 06/28/2016 22:47:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Label] ON
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (1, N'风景')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (2, N'建筑')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (3, N'纪实')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (4, N'美食')
INSERT [dbo].[Label] ([ID], [LabelName]) VALUES (5, N'电影')
SET IDENTITY_INSERT [dbo].[Label] OFF
/****** Object:  Table [dbo].[Habbit_User]    Script Date: 06/28/2016 22:47:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Habbit_User] ON
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (1, 1, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (2, 2, 1)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (3, 3, 3)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (4, 4, 4)
INSERT [dbo].[Habbit_User] ([ID], [HabbitID], [ClientID]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[Habbit_User] OFF
/****** Object:  Table [dbo].[Follower]    Script Date: 06/28/2016 22:47:07 ******/
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
SET IDENTITY_INSERT [dbo].[Follower] OFF
/****** Object:  Table [dbo].[Photo]    Script Date: 06/28/2016 22:47:07 ******/
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
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), N'C01/img/1.jpg', 5, 10, 1, 1, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (2, CAST(0x0000A51400107994 AS DateTime), N'C01/img/2.jpg', 0, 0, 2, 1, N'N')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (3, CAST(0x0000A53200AD08E0 AS DateTime), N'C03/img/1.jpg', 6, 15, 3, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (4, CAST(0x0000A5E900AD08E0 AS DateTime), N'C03/img/2.jpg', 7, 12, 4, 3, N'Y')
INSERT [dbo].[Photo] ([ID], [Time], [Pic], [CommentsNum], [LikeNum], [AlbumID], [ClientID], [IfPublic]) VALUES (5, CAST(0x0000A60700AD08E0 AS DateTime), N'C04/img/1.jpg', 0, 0, 5, 4, N'N')
SET IDENTITY_INSERT [dbo].[Photo] OFF
/****** Object:  Table [dbo].[Label_Photo]    Script Date: 06/28/2016 22:47:07 ******/
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
 CONSTRAINT [PK__Label_Ph__3214EC271DE57479] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Label_Photo] ON
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), 1, 1, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (2, CAST(0x0000A51400107994 AS DateTime), 1, 2, 1)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (3, CAST(0x0000A53200AD08E0 AS DateTime), 2, 3, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (4, CAST(0x0000A5E900AD08E0 AS DateTime), 3, 4, 3)
INSERT [dbo].[Label_Photo] ([ID], [Time], [LabelID], [PhotoID], [ClientID]) VALUES (5, CAST(0x0000A60700AD08E0 AS DateTime), 3, 5, 4)
SET IDENTITY_INSERT [dbo].[Label_Photo] OFF
/****** Object:  Table [dbo].[Comment]    Script Date: 06/28/2016 22:47:07 ******/
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
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (1, CAST(0x0000A513018B80D4 AS DateTime), N'明天快到了', 1, 2, 1)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (2, CAST(0x0000A58D00000000 AS DateTime), N'又是新的一天', 2, 1, 2)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (3, CAST(0x0000A5AC00000000 AS DateTime), N'又是新的一天', 3, 4, 4)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (4, CAST(0x0000A5AC017B0740 AS DateTime), N'睡觉', 5, 3, 5)
INSERT [dbo].[Comment] ([ID], [Time], [Content], [PrintUserID], [ReceiveUserID], [PhotoID]) VALUES (5, CAST(0x0000A60600E6B680 AS DateTime), N'上课时间', 4, 2, 3)
SET IDENTITY_INSERT [dbo].[Comment] OFF
/****** Object:  Default [DF__Photo__CommentsN__182C9B23]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__CommentsN__182C9B23]  DEFAULT ((0)) FOR [CommentsNum]
GO
/****** Object:  Default [DF__Photo__LikeNum__1920BF5C]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__LikeNum__1920BF5C]  DEFAULT ((0)) FOR [LikeNum]
GO
/****** Object:  ForeignKey [FK__Habbit_Us__Clien__36B12243]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Habbit_User]  WITH CHECK ADD  CONSTRAINT [FK__Habbit_Us__Clien__36B12243] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Habbit_User] CHECK CONSTRAINT [FK__Habbit_Us__Clien__36B12243]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__267ABA7A]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__267ABA7A] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__267ABA7A]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__276EDEB3]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__276EDEB3] FOREIGN KEY([FolloweeID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__276EDEB3]
GO
/****** Object:  ForeignKey [FK__Photo__AlbumID__1A14E395]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__AlbumID__1A14E395] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__AlbumID__1A14E395]
GO
/****** Object:  ForeignKey [FK__Photo__ClientID__1B0907CE]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__ClientID__1B0907CE] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__ClientID__1B0907CE]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Clien__20C1E124]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Clien__20C1E124] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Clien__20C1E124]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Label__1FCDBCEB]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB] FOREIGN KEY([LabelID])
REFERENCES [dbo].[Label] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Photo__21B6055D]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Photo__21B6055D] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Photo__21B6055D]
GO
/****** Object:  ForeignKey [FK__Comment__PhotoID__2E1BDC42]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PhotoID__2E1BDC42] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PhotoID__2E1BDC42]
GO
/****** Object:  ForeignKey [FK__Comment__PrintUs__2C3393D0]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PrintUs__2C3393D0] FOREIGN KEY([PrintUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PrintUs__2C3393D0]
GO
/****** Object:  ForeignKey [FK__Comment__Receive__2D27B809]    Script Date: 06/28/2016 22:47:07 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Receive__2D27B809] FOREIGN KEY([ReceiveUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Receive__2D27B809]
GO
