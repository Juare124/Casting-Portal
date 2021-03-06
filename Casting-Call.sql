USE [master]
GO
/****** Object:  Database [ChapCastCall]    Script Date: 2/28/2017 7:04:54 PM ******/
CREATE DATABASE [ChapCastCall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChapCastCall', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChapCastCall.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChapCastCall_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChapCastCall_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChapCastCall] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChapCastCall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChapCastCall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChapCastCall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChapCastCall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChapCastCall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChapCastCall] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChapCastCall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChapCastCall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChapCastCall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChapCastCall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChapCastCall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChapCastCall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChapCastCall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChapCastCall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChapCastCall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChapCastCall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChapCastCall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChapCastCall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChapCastCall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChapCastCall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChapCastCall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChapCastCall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChapCastCall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChapCastCall] SET RECOVERY FULL 
GO
ALTER DATABASE [ChapCastCall] SET  MULTI_USER 
GO
ALTER DATABASE [ChapCastCall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChapCastCall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChapCastCall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChapCastCall] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChapCastCall] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ChapCastCall]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] NOT NULL,
	[token] [varchar](40) NULL,
	[created_date] [datetime] NULL,
	[last_access] [datetime] NULL,
	[email] [varchar](80) NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Actors2]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actors2](
	[gid] [int] NULL,
	[accountid] [int] NULL,
	[availability] [bit] NULL,
	[notifications] [int] NULL,
	[gender] [int] NULL,
	[birthdate] [datetime] NULL,
	[tags] [binary](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[api]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[api](
	[id] [int] NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Calls]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calls](
	[gid] [int] NULL,
	[directorid] [int] NULL,
	[summary] [varchar](1000) NULL,
	[start_shooting_date] [datetime] NULL,
	[location] [varchar](100) NULL,
	[title] [varchar](100) NULL,
	[audition_date] [datetime] NULL,
	[project_type] [int] NULL,
	[estimated_length] [datetime] NULL,
	[end_shooting_date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Characters](
	[id] [int] NOT NULL,
	[call_id] [int] NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
	[min_age] [int] NULL,
	[max_age] [int] NULL,
	[gender] [int] NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[gid] [int] NULL,
	[accountid] [int] NULL,
	[notifications] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[page_id] [int] NULL,
	[id] [int] NOT NULL,
	[asset_url] [nchar](10) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Videos]    Script Date: 2/28/2017 7:04:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Videos](
	[page_id] [int] NULL,
	[id] [int] NOT NULL,
	[asset_url] [varchar](100) NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [ChapCastCall] SET  READ_WRITE 
GO
