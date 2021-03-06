USE [master]
GO
/****** Object:  Database [ControlMeasurements]    Script Date: 10/12/2016 20:33:36 ******/
CREATE DATABASE [ControlMeasurements] ON  PRIMARY 
( NAME = N'ControlMeasurements', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ControlMeasurements.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ControlMeasurements_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ControlMeasurements_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ControlMeasurements] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlMeasurements].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlMeasurements] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ControlMeasurements] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ControlMeasurements] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ControlMeasurements] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ControlMeasurements] SET ARITHABORT OFF
GO
ALTER DATABASE [ControlMeasurements] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ControlMeasurements] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ControlMeasurements] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ControlMeasurements] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ControlMeasurements] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ControlMeasurements] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ControlMeasurements] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ControlMeasurements] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ControlMeasurements] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ControlMeasurements] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ControlMeasurements] SET  DISABLE_BROKER
GO
ALTER DATABASE [ControlMeasurements] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ControlMeasurements] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ControlMeasurements] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ControlMeasurements] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ControlMeasurements] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ControlMeasurements] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ControlMeasurements] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ControlMeasurements] SET  READ_WRITE
GO
ALTER DATABASE [ControlMeasurements] SET RECOVERY FULL
GO
ALTER DATABASE [ControlMeasurements] SET  MULTI_USER
GO
ALTER DATABASE [ControlMeasurements] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ControlMeasurements] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ControlMeasurements', N'ON'
GO
USE [ControlMeasurements]
GO
/****** Object:  Table [dbo].[Checkpoints]    Script Date: 10/12/2016 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkpoints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Checkpoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [CK_UniqueName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 10/12/2016 20:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CheckpointId] [int] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Equipment_Checkpoints]    Script Date: 10/12/2016 20:33:37 ******/
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Checkpoints] FOREIGN KEY([CheckpointId])
REFERENCES [dbo].[Checkpoints] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Checkpoints]
GO
