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
/****** Object:  Database [TimeFlow]    Script Date: 06/28/2016 22:24:14 ******/
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
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Album]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Habbit]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Label]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Habbit_User]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Follower]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Label_Photo]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 06/28/2016 22:24:15 ******/
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
/****** Object:  Default [DF__Photo__CommentsN__182C9B23]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__CommentsN__182C9B23]  DEFAULT ((0)) FOR [CommentsNum]
GO
/****** Object:  Default [DF__Photo__LikeNum__1920BF5C]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF__Photo__LikeNum__1920BF5C]  DEFAULT ((0)) FOR [LikeNum]
GO
/****** Object:  ForeignKey [FK__Habbit_Us__Clien__36B12243]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Habbit_User]  WITH CHECK ADD  CONSTRAINT [FK__Habbit_Us__Clien__36B12243] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Habbit_User] CHECK CONSTRAINT [FK__Habbit_Us__Clien__36B12243]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__267ABA7A]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__267ABA7A] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__267ABA7A]
GO
/****** Object:  ForeignKey [FK__Follower__Follow__276EDEB3]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK__Follower__Follow__276EDEB3] FOREIGN KEY([FolloweeID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK__Follower__Follow__276EDEB3]
GO
/****** Object:  ForeignKey [FK__Photo__AlbumID__1A14E395]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__AlbumID__1A14E395] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__AlbumID__1A14E395]
GO
/****** Object:  ForeignKey [FK__Photo__ClientID__1B0907CE]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK__Photo__ClientID__1B0907CE] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK__Photo__ClientID__1B0907CE]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Clien__20C1E124]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Clien__20C1E124] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Clien__20C1E124]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Label__1FCDBCEB]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB] FOREIGN KEY([LabelID])
REFERENCES [dbo].[Label] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Label__1FCDBCEB]
GO
/****** Object:  ForeignKey [FK__Label_Pho__Photo__21B6055D]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Label_Photo]  WITH CHECK ADD  CONSTRAINT [FK__Label_Pho__Photo__21B6055D] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Label_Photo] CHECK CONSTRAINT [FK__Label_Pho__Photo__21B6055D]
GO
/****** Object:  ForeignKey [FK__Comment__PhotoID__2E1BDC42]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PhotoID__2E1BDC42] FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PhotoID__2E1BDC42]
GO
/****** Object:  ForeignKey [FK__Comment__PrintUs__2C3393D0]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__PrintUs__2C3393D0] FOREIGN KEY([PrintUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__PrintUs__2C3393D0]
GO
/****** Object:  ForeignKey [FK__Comment__Receive__2D27B809]    Script Date: 06/28/2016 22:24:15 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Receive__2D27B809] FOREIGN KEY([ReceiveUserID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Receive__2D27B809]
GO
