USE [master]
GO
/****** Object:  Database [TrolleyTracker]    Script Date: 7/26/2015 5:02:49 PM ******/
CREATE DATABASE [TrolleyTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrolleyTracker', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrolleyTracker.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrolleyTracker_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrolleyTracker_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrolleyTracker] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrolleyTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrolleyTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrolleyTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrolleyTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrolleyTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrolleyTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrolleyTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrolleyTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrolleyTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrolleyTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [TrolleyTracker] SET  MULTI_USER 
GO
ALTER DATABASE [TrolleyTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrolleyTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrolleyTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrolleyTracker] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TrolleyTracker] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TrolleyTracker]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[LongName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
	[FlagStopsOnly] [bit] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteSchedule]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RouteSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteStops]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[StopID] [int] NOT NULL,
	[StopSequence] [int] NOT NULL,
 CONSTRAINT [PK_RouteStops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shapes]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shapes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
	[Sequence] [int] NOT NULL,
	[DistanceTraveled] [float] NOT NULL,
 CONSTRAINT [PK_Shapes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stops]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
 CONSTRAINT [PK_Stops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trolley]    Script Date: 7/26/2015 5:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trolley](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrolleyName] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[CurrentLat] [float] NULL,
	[CurrentLon] [float] NULL,
 CONSTRAINT [PK_Trolley] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (1, N'ShortMain', N'Main Street short', N'North Main Street to Fluor Field - no Heritage Green', 0)
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (2, N'HeritageGreen', N'Main Street plus museums', N'Main Street, Including Heritage Green', 0)
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (3, N'LunchLink', N'Friday Lunch Route', N'From University Ridge / County Square to Hyatt', 1)
SET IDENTITY_INSERT [dbo].[Routes] OFF
SET IDENTITY_INSERT [dbo].[RouteSchedule] ON 

INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (5, 2, 6, CAST(N'1970-01-01 10:00:00.000' AS DateTime), CAST(N'1970-01-01 18:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (6, 1, 6, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (7, 2, 0, CAST(N'1970-01-01 13:00:00.000' AS DateTime), CAST(N'1970-01-01 18:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (8, 1, 0, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 20:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (9, 3, 5, CAST(N'1970-01-01 11:00:00.000' AS DateTime), CAST(N'1970-01-01 14:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (10, 1, 4, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (11, 1, 5, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RouteSchedule] OFF
SET IDENTITY_INSERT [dbo].[RouteStops] ON 

INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (176, 2, 44, 0)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (177, 2, 43, 1)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (178, 2, 31, 2)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (179, 2, 32, 3)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (180, 2, 33, 4)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (181, 2, 34, 5)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (182, 2, 35, 6)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (183, 2, 36, 7)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (184, 2, 37, 8)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (185, 2, 38, 9)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (186, 2, 30, 10)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (187, 2, 29, 11)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (188, 2, 28, 12)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (189, 2, 27, 13)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (190, 2, 26, 14)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (191, 2, 25, 15)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (192, 2, 24, 16)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (193, 2, 45, 17)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (194, 2, 42, 18)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (195, 2, 41, 19)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (196, 2, 40, 20)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (197, 2, 39, 21)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (198, 2, 46, 22)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (199, 1, 44, 0)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (200, 1, 43, 1)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (201, 1, 31, 2)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (202, 1, 32, 3)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (203, 1, 33, 4)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (204, 1, 34, 5)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (205, 1, 35, 6)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (206, 1, 36, 7)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (207, 1, 37, 8)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (208, 1, 38, 9)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (209, 1, 30, 10)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (210, 1, 29, 11)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (211, 1, 28, 12)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (212, 1, 27, 13)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (213, 1, 26, 14)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (214, 1, 25, 15)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (215, 1, 24, 16)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (216, 1, 45, 17)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (217, 1, 42, 18)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (218, 1, 41, 19)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (219, 1, 40, 20)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (220, 1, 39, 21)
SET IDENTITY_INSERT [dbo].[RouteStops] OFF
SET IDENTITY_INSERT [dbo].[Shapes] ON 

INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21292, 2, 34.8512766, -82.4006823, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21293, 2, 34.8511927, -82.4007197, 1, 9.94491436805421)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21294, 2, 34.8507494, -82.4009175, 2, 62.497085232929862)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21295, 2, 34.85068, -82.4009712, 3, 71.648265501624948)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21296, 2, 34.8506107, -82.4010315, 4, 81.126731303423412)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21297, 2, 34.8505403, -82.4011173, 5, 92.2103933257261)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21298, 2, 34.8504775, -82.4012045, 6, 102.80955794072314)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21299, 2, 34.8503642, -82.4013695, 7, 122.4634199542497)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21300, 2, 34.85025, -82.4015094, 8, 140.48953543222771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21301, 2, 34.85025, -82.4015094, 9, 140.48953543222771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21302, 2, 34.850193, -82.4015847, 10, 149.84811901521047)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21303, 2, 34.8501292, -82.401641, 11, 158.61670626171983)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21304, 2, 34.850061, -82.4016799, 12, 166.99978641372644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21305, 2, 34.850061, -82.4016799, 13, 166.99978641372644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21306, 2, 34.8492822, -82.4020625, 14, 260.4759111656453)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21307, 2, 34.8492141, -82.4020964, 15, 268.6649475676694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21308, 2, 34.8492141, -82.4020964, 16, 268.6649475676694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21309, 2, 34.8490935, -82.4021634, 17, 283.4193743415085)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21310, 2, 34.8489769, -82.4022439, 18, 298.33757847347221)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21311, 2, 34.8489769, -82.4022439, 19, 298.33757847347221)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21312, 2, 34.8489294, -82.4022956, 20, 305.42694418972889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21313, 2, 34.8489294, -82.4022956, 21, 305.42694418972889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21314, 2, 34.8488921, -82.4023453, 22, 311.57900800189037)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21315, 2, 34.8486125, -82.4027172, 23, 357.655866512118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21316, 2, 34.848518, -82.402843, 24, 373.23631577653845)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21317, 2, 34.848518, -82.402843, 25, 373.23631577653845)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21318, 2, 34.848372, -82.403049, 26, 398.10237083236007)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21319, 2, 34.8482573, -82.4032, 27, 416.89923864677434)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21320, 2, 34.8482573, -82.4032, 28, 416.89923864677434)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21321, 2, 34.848224, -82.4032486, 29, 422.68195682301189)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21322, 2, 34.8481977, -82.403277, 30, 426.59370170521566)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21323, 2, 34.8481435, -82.4033269, 31, 434.15533609422681)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21324, 2, 34.848032, -82.403413, 32, 448.84995048689296)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21325, 2, 34.847512, -82.403757, 33, 514.71687728324116)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21326, 2, 34.847171, -82.403983, 34, 557.92852893536735)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21327, 2, 34.8467981, -82.4042084, 35, 604.26636183119263)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21328, 2, 34.846764, -82.404229, 36, 608.50184969943575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21329, 2, 34.846642, -82.40429, 37, 623.18139600042946)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21330, 2, 34.84653, -82.404319, 38, 635.927607326078)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21331, 2, 34.84653, -82.404319, 39, 635.927607326078)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21332, 2, 34.846353, -82.404338, 40, 655.70722711881569)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21333, 2, 34.8462646, -82.404344, 41, 665.56318493693277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21334, 2, 34.845478, -82.404397, 42, 753.26090326060819)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21335, 2, 34.845478, -82.404397, 43, 753.26090326060819)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21336, 2, 34.8453134, -82.4043812, 44, 771.640585921081)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21337, 2, 34.844992, -82.404324, 45, 807.79839465154248)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21338, 2, 34.844619, -82.4042173, 46, 850.449531785202)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21339, 2, 34.84459, -82.404209, 47, 853.76647062841062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21340, 2, 34.844521, -82.404215, 48, 861.466601495064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21341, 2, 34.844521, -82.404215, 49, 861.466601495064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21342, 2, 34.844473, -82.404229, 50, 866.96096062312222)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21343, 2, 34.844406, -82.404275, 51, 875.52156758564831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21344, 2, 34.8441825, -82.4045141, 52, 908.63017147497487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21345, 2, 34.84409, -82.404614, 53, 922.38988712740172)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21346, 2, 34.843726, -82.404983, 54, 975.10064009714074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21347, 2, 34.843453, -82.405245, 55, 1013.7857308795494)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21348, 2, 34.843372, -82.405325, 56, 1025.3928769240079)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21349, 2, 34.843052, -82.405586, 57, 1068.2594913619134)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21350, 2, 34.842519, -82.4059946, 58, 1138.3594981232745)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21351, 2, 34.842452, -82.406046, 59, 1147.1732951654615)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21352, 2, 34.842057, -82.406315, 60, 1197.5466078246961)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21353, 2, 34.841948, -82.40636, 61, 1210.3578512629174)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21354, 2, 34.8417973, -82.4063993, 62, 1227.5135872529663)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21355, 2, 34.8417225, -82.4064188, 63, 1236.0292313444575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21356, 2, 34.8507403, -82.3989856, 64, 2448.0056182338103)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21357, 2, 34.8506693, -82.3990179, 65, 2456.4424022031581)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21358, 2, 34.8506412, -82.3990306, 66, 2459.7783494475029)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21359, 2, 34.8496109, -82.3994984, 67, 2582.1739470100274)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21360, 2, 34.8495248, -82.3995375, 68, 2592.4022974758277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21361, 2, 34.8492914, -82.3996435, 69, 2620.1300277389223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21362, 2, 34.8488156, -82.3998595, 70, 2676.6521495964739)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21363, 2, 34.8487026, -82.3999109, 71, 2690.0789437005283)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21364, 2, 34.8486664, -82.3999273, 72, 2694.3800363345608)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21365, 2, 34.8485024, -82.4000017, 73, 2713.8605542257533)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21366, 2, 34.8483374, -82.4000767, 74, 2733.4644862489727)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21367, 2, 34.8479487, -82.4002528, 75, 2779.6283044777178)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21368, 2, 34.847705499999996, -82.4003635, 76, 2808.5284585856643)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21369, 2, 34.8475797, -82.4004207, 77, 2823.4756982571553)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21370, 2, 34.8474487, -82.4004802, 78, 2839.0387450261815)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21371, 2, 34.8464867, -82.400917, 79, 2953.3214196337226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21372, 2, 34.8464867, -82.400917, 80, 2953.3214196337226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21373, 2, 34.846392, -82.400971, 81, 2964.9600408980682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21374, 2, 34.8461845, -82.4011174, 82, 2991.6515109587785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21375, 2, 34.8461845, -82.4011174, 83, 2991.6515109587785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21376, 2, 34.845958, -82.401324, 84, 3023.1474484410269)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21377, 2, 34.845895, -82.401377, 85, 3031.669454613414)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21378, 2, 34.845834, -82.40143, 86, 3040.0093227242769)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21379, 2, 34.8455653, -82.4016592, 87, 3076.5218829573491)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21380, 2, 34.8455653, -82.4016592, 88, 3076.5218829573491)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21381, 2, 34.845494, -82.40172, 89, 3086.2096033083076)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21382, 2, 34.8451446, -82.4020518, 90, 3135.5219171412277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21383, 2, 34.844934, -82.402251, 91, 3165.2004789767343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21384, 2, 34.844857, -82.40235, 92, 3177.6621712104929)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21385, 2, 34.844755, -82.40253, 93, 3197.6462392983358)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21386, 2, 34.8447009, -82.4026392, 94, 3209.2995974186742)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21387, 2, 34.8446767, -82.4027505, 95, 3219.8187768796975)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21388, 2, 34.844664, -82.402825, 96, 3226.7704719039643)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21389, 2, 34.844631, -82.403026, 97, 3245.4977709324226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21390, 2, 34.8445617, -82.4037552, 98, 3312.5629509049804)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21391, 2, 34.844521, -82.404215, 99, 3354.814054565833)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21392, 2, 34.8507403, -82.3989856, 100, 4195.9783990783644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21393, 2, 34.8508232, -82.3989461, 101, 4205.886915065108)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21394, 2, 34.8515463, -82.3986011, 102, 4292.3321124043441)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21395, 2, 34.8515463, -82.3986011, 103, 4292.3321124043441)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21396, 2, 34.8524767, -82.398182, 104, 4402.7534583088)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21397, 2, 34.8539543, -82.3975115, 105, 4578.2731725386611)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21398, 2, 34.8539543, -82.3975115, 106, 4578.2731725386611)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21399, 2, 34.8540729, -82.39748, 107, 4591.7858045784778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21400, 2, 34.854146, -82.397464, 108, 4600.0538790885894)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21401, 2, 34.854588, -82.397282, 109, 4651.9900144119838)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21402, 2, 34.854858, -82.397156, 110, 4684.1747605582332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21403, 2, 34.854858, -82.397156, 111, 4684.1747605582332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21404, 2, 34.854962, -82.3971008, 112, 4696.80242639267)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21405, 2, 34.855293, -82.396958, 113, 4735.8900754880106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21406, 2, 34.8570122, -82.3962211, 114, 4938.7635493833286)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21407, 2, 34.85715, -82.396162, 115, 4955.0259450484518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21408, 2, 34.85715, -82.396162, 116, 4955.0259450484518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21409, 2, 34.8572429, -82.3961232, 117, 4965.9577970167084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21410, 2, 34.857724, -82.395922, 118, 5022.5793941685424)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21411, 2, 34.8581325, -82.3957502, 119, 5070.685101203936)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21412, 2, 34.8581408, -82.3957468, 120, 5071.6543393309685)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21413, 2, 34.858231, -82.39571, 121, 5082.2428457321657)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21414, 2, 34.858231, -82.39571, 122, 5082.2428457321657)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21415, 2, 34.8583026, -82.3956795, 123, 5090.6860512048934)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21416, 2, 34.859888, -82.395005, 124, 5277.6172334610419)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21417, 2, 34.8604683, -82.394752, 125, 5346.2251698425625)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21418, 2, 34.861544, -82.394283, 126, 5473.4038526970126)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21419, 2, 34.861544, -82.394283, 127, 5473.4038526970126)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21420, 2, 34.862797, -82.393742, 128, 5621.3817897613217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21421, 2, 34.862797, -82.393742, 129, 5621.3817897613217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21422, 2, 34.863003, -82.395912, 130, 5820.9119275730336)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21423, 2, 34.854524, -82.398794, 131, 6800.81418692242)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21424, 2, 34.85431, -82.398929, 132, 6827.63916791223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21425, 2, 34.854085, -82.399121, 133, 6858.2165836895038)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21426, 2, 34.853918, -82.399292, 134, 6882.49874055032)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21427, 2, 34.85375, -82.3994669, 135, 6907.0959812865676)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21428, 2, 34.853545, -82.399636, 136, 6934.6531340501888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21429, 2, 34.853366, -82.399751, 137, 6957.1789999836164)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21430, 2, 34.853233, -82.399817, 138, 6973.1652148073863)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21431, 2, 34.8529968, -82.3999247, 139, 7001.2393568428461)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21432, 2, 34.844521, -82.404215, 140, 8022.93040084407)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21433, 2, 34.8444546, -82.4044559, 141, 8046.14741654199)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21434, 2, 34.8443957, -82.4046618, 142, 8066.0685567856717)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21435, 2, 34.8442789, -82.4050744, 143, 8105.94324457682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21436, 2, 34.8441, -82.4057166, 144, 8167.9029446678251)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21437, 2, 34.8437897, -82.4068233, 145, 8274.74993013743)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21438, 2, 34.8435696, -82.4076083, 146, 8350.53845459233)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21439, 2, 34.8431161, -82.4092238, 147, 8506.528359866963)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21440, 2, 34.843083, -82.409344, 148, 8518.111355979061)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21441, 2, 34.843083, -82.409344, 149, 8518.111355979061)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21442, 2, 34.8429736, -82.4092959, 150, 8531.0586617669851)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21443, 2, 34.842127, -82.40896, 151, 8630.1724882796243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21444, 2, 34.842127, -82.40896, 152, 8630.1724882796243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21445, 2, 34.8414045, -82.4086855, 153, 8714.4202217353886)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21446, 2, 34.8413229, -82.4086575, 154, 8723.8576198817445)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21447, 2, 34.8413229, -82.4086575, 155, 8723.8576198817445)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21448, 2, 34.841604, -82.407404, 156, 8842.5803128607477)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21449, 2, 34.8416568, -82.4070651, 157, 8874.0963196693574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21450, 2, 34.8416888, -82.406861, 158, 8893.0808679463062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21451, 2, 34.8417035, -82.4067203, 159, 8906.0396801282332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21452, 2, 34.8417213, -82.406557, 160, 8921.0905038441979)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21453, 2, 34.8417222, -82.4065174, 161, 8924.7083326534121)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21454, 2, 34.8417225, -82.4064188, 162, 8933.7167540132887)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21455, 2, 34.858579, -82.397365, 163, 10984.372266070734)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21456, 2, 34.858706, -82.397352, 164, 10998.559277055156)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21457, 2, 34.859272, -82.39718, 165, 11063.495449537675)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21458, 2, 34.85939, -82.397134, 166, 11077.286967475118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21459, 2, 34.860346, -82.39669, 167, 11191.174390621603)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21460, 2, 34.860794, -82.396485, 168, 11244.445026609421)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21461, 2, 34.86159, -82.39611, 169, 11339.4453873446)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21462, 2, 34.861714, -82.396078, 170, 11353.555146969369)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21463, 2, 34.863003, -82.395912, 171, 11497.844788146314)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21464, 2, 34.858579, -82.397365, 172, 12007.892437244094)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21465, 2, 34.85889, -82.398836, 173, 12146.648837596023)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21466, 2, 34.859101, -82.399857, 174, 12242.823816983422)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21467, 2, 34.859135, -82.400019, 175, 12258.097451473595)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21468, 2, 34.859212, -82.400388, 176, 12292.876191050867)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21469, 2, 34.859238, -82.40054, 177, 12307.058744415641)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21470, 2, 34.859227, -82.400612, 178, 12313.74889124617)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21471, 2, 34.854524, -82.398794, 179, 12862.992040388974)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21472, 2, 34.854691, -82.399241, 180, 12907.857925673514)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21473, 2, 34.8547474, -82.3993579, 181, 12920.24546214658)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21474, 2, 34.8548802, -82.3996333, 182, 12949.424941446514)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21475, 2, 34.854937, -82.399751, 183, 12961.898225954625)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21476, 2, 34.8550754, -82.4001561, 184, 13001.982697245252)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21477, 2, 34.8551261, -82.4003076, 185, 13016.929030409934)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21478, 2, 34.8551261, -82.4003076, 186, 13016.929030409934)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21479, 2, 34.8551808, -82.4004524, 187, 13031.49057250976)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21480, 2, 34.8552145, -82.4005417, 188, 13040.469364954177)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21481, 2, 34.855328, -82.4008424, 189, 13070.704253199723)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21482, 2, 34.8556092, -82.4015872, 190, 13145.596203704949)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21483, 2, 34.8557044, -82.4018394, 191, 13170.954689447754)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21484, 2, 34.8558946, -82.4023433, 192, 13221.621054072726)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21485, 2, 34.8558946, -82.4023433, 193, 13221.621054072726)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21486, 2, 34.8559338, -82.4024194, 194, 13229.828820888568)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21487, 2, 34.8559756, -82.4025008, 195, 13238.600498023203)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21488, 2, 34.8561175, -82.4026932, 196, 13262.231292357214)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21489, 2, 34.8562525, -82.4028649, 197, 13283.953240704363)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21490, 2, 34.8564019, -82.4030516, 198, 13307.774583715835)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21491, 2, 34.8564019, -82.4030516, 199, 13307.774583715835)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21492, 2, 34.8569558, -82.4035033, 200, 13381.966605419631)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21493, 2, 34.8569558, -82.4035033, 201, 13381.966605419631)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21494, 2, 34.8570834, -82.4034416, 202, 13397.247926245271)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21495, 2, 34.8573552, -82.4032806, 203, 13430.889437025184)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21496, 2, 34.8574169, -82.4032364, 204, 13438.857076900842)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21497, 2, 34.8574849, -82.4031629, 205, 13448.975327332279)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21498, 2, 34.8575436, -82.4030741, 206, 13459.391385668194)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21499, 2, 34.8576097, -82.4029483, 207, 13473.036396568416)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21500, 2, 34.857724, -82.402761, 208, 13494.358152648378)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21501, 2, 34.857892, -82.40247, 209, 13526.8593288814)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21502, 2, 34.858079, -82.402181, 210, 13560.478277687475)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21503, 2, 34.859161, -82.40073, 211, 13739.572801744622)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21504, 2, 34.859227, -82.400612, 212, 13752.617415258073)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21505, 2, 34.8512766, -82.4006823, 213, 14637.6749156242)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21506, 2, 34.8513617, -82.4006448, 214, 14647.748430446882)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21507, 2, 34.852291, -82.4002356, 215, 14757.744312047154)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21508, 2, 34.8523937, -82.4001903, 216, 14769.902954669107)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21509, 2, 34.8524809, -82.4001519, 217, 14780.224491859926)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21510, 2, 34.8529968, -82.3999247, 218, 14841.289600316666)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21511, 1, 34.8512766, -82.4006823, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21512, 1, 34.8511927, -82.4007197, 1, 9.94491436805421)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21513, 1, 34.8507494, -82.4009175, 2, 62.497085232929862)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21514, 1, 34.85068, -82.4009712, 3, 71.648265501624948)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21515, 1, 34.8506107, -82.4010315, 4, 81.126731303423412)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21516, 1, 34.8505403, -82.4011173, 5, 92.2103933257261)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21517, 1, 34.8504775, -82.4012045, 6, 102.80955794072314)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21518, 1, 34.8503642, -82.4013695, 7, 122.4634199542497)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21519, 1, 34.85025, -82.4015094, 8, 140.48953543222771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21520, 1, 34.85025, -82.4015094, 9, 140.48953543222771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21521, 1, 34.850193, -82.4015847, 10, 149.84811901521047)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21522, 1, 34.8501292, -82.401641, 11, 158.61670626171983)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21523, 1, 34.850061, -82.4016799, 12, 166.99978641372644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21524, 1, 34.850061, -82.4016799, 13, 166.99978641372644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21525, 1, 34.8492822, -82.4020625, 14, 260.4759111656453)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21526, 1, 34.8492141, -82.4020964, 15, 268.6649475676694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21527, 1, 34.8492141, -82.4020964, 16, 268.6649475676694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21528, 1, 34.8490935, -82.4021634, 17, 283.4193743415085)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21529, 1, 34.8489769, -82.4022439, 18, 298.33757847347221)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21530, 1, 34.8489769, -82.4022439, 19, 298.33757847347221)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21531, 1, 34.8489294, -82.4022956, 20, 305.42694418972889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21532, 1, 34.8489294, -82.4022956, 21, 305.42694418972889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21533, 1, 34.8488921, -82.4023453, 22, 311.57900800189037)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21534, 1, 34.8486125, -82.4027172, 23, 357.655866512118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21535, 1, 34.848518, -82.402843, 24, 373.23631577653845)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21536, 1, 34.848518, -82.402843, 25, 373.23631577653845)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21537, 1, 34.848372, -82.403049, 26, 398.10237083236007)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21538, 1, 34.8482573, -82.4032, 27, 416.89923864677434)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21539, 1, 34.8482573, -82.4032, 28, 416.89923864677434)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21540, 1, 34.848224, -82.4032486, 29, 422.68195682301189)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21541, 1, 34.8481977, -82.403277, 30, 426.59370170521566)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21542, 1, 34.8481435, -82.4033269, 31, 434.15533609422681)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21543, 1, 34.848032, -82.403413, 32, 448.84995048689296)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21544, 1, 34.847512, -82.403757, 33, 514.71687728324116)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21545, 1, 34.847171, -82.403983, 34, 557.92852893536735)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21546, 1, 34.8467981, -82.4042084, 35, 604.26636183119263)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21547, 1, 34.846764, -82.404229, 36, 608.50184969943575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21548, 1, 34.846642, -82.40429, 37, 623.18139600042946)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21549, 1, 34.84653, -82.404319, 38, 635.927607326078)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21550, 1, 34.84653, -82.404319, 39, 635.927607326078)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21551, 1, 34.846353, -82.404338, 40, 655.70722711881569)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21552, 1, 34.8462646, -82.404344, 41, 665.56318493693277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21553, 1, 34.845478, -82.404397, 42, 753.26090326060819)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21554, 1, 34.845478, -82.404397, 43, 753.26090326060819)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21555, 1, 34.8453134, -82.4043812, 44, 771.640585921081)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21556, 1, 34.844992, -82.404324, 45, 807.79839465154248)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21557, 1, 34.844619, -82.4042173, 46, 850.449531785202)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21558, 1, 34.84459, -82.404209, 47, 853.76647062841062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21559, 1, 34.844521, -82.404215, 48, 861.466601495064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21560, 1, 34.844521, -82.404215, 49, 861.466601495064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21561, 1, 34.844473, -82.404229, 50, 866.96096062312222)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21562, 1, 34.844406, -82.404275, 51, 875.52156758564831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21563, 1, 34.8441825, -82.4045141, 52, 908.63017147497487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21564, 1, 34.84409, -82.404614, 53, 922.38988712740172)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21565, 1, 34.843726, -82.404983, 54, 975.10064009714074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21566, 1, 34.843453, -82.405245, 55, 1013.7857308795494)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21567, 1, 34.843372, -82.405325, 56, 1025.3928769240079)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21568, 1, 34.843052, -82.405586, 57, 1068.2594913619134)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21569, 1, 34.842519, -82.4059946, 58, 1138.3594981232745)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21570, 1, 34.842452, -82.406046, 59, 1147.1732951654615)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21571, 1, 34.842057, -82.406315, 60, 1197.5466078246961)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21572, 1, 34.841948, -82.40636, 61, 1210.3578512629174)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21573, 1, 34.8417973, -82.4063993, 62, 1227.5135872529663)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21574, 1, 34.8417225, -82.4064188, 63, 1236.0292313444575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21575, 1, 34.8507403, -82.3989856, 64, 2448.0056182338103)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21576, 1, 34.8506693, -82.3990179, 65, 2456.4424022031581)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21577, 1, 34.8506412, -82.3990306, 66, 2459.7783494475029)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21578, 1, 34.8496109, -82.3994984, 67, 2582.1739470100274)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21579, 1, 34.8495248, -82.3995375, 68, 2592.4022974758277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21580, 1, 34.8492914, -82.3996435, 69, 2620.1300277389223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21581, 1, 34.8488156, -82.3998595, 70, 2676.6521495964739)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21582, 1, 34.8487026, -82.3999109, 71, 2690.0789437005283)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21583, 1, 34.8486664, -82.3999273, 72, 2694.3800363345608)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21584, 1, 34.8485024, -82.4000017, 73, 2713.8605542257533)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21585, 1, 34.8483374, -82.4000767, 74, 2733.4644862489727)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21586, 1, 34.8479487, -82.4002528, 75, 2779.6283044777178)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21587, 1, 34.847705499999996, -82.4003635, 76, 2808.5284585856643)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21588, 1, 34.8475797, -82.4004207, 77, 2823.4756982571553)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21589, 1, 34.8474487, -82.4004802, 78, 2839.0387450261815)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21590, 1, 34.8464867, -82.400917, 79, 2953.3214196337226)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21591, 1, 34.8464867, -82.400917, 80, 2953.3214196337226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21592, 1, 34.846392, -82.400971, 81, 2964.9600408980682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21593, 1, 34.8461845, -82.4011174, 82, 2991.6515109587785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21594, 1, 34.8461845, -82.4011174, 83, 2991.6515109587785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21595, 1, 34.845958, -82.401324, 84, 3023.1474484410269)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21596, 1, 34.845895, -82.401377, 85, 3031.669454613414)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21597, 1, 34.845834, -82.40143, 86, 3040.0093227242769)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21598, 1, 34.8455653, -82.4016592, 87, 3076.5218829573491)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21599, 1, 34.8455653, -82.4016592, 88, 3076.5218829573491)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21600, 1, 34.845494, -82.40172, 89, 3086.2096033083076)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21601, 1, 34.8451446, -82.4020518, 90, 3135.5219171412277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21602, 1, 34.844934, -82.402251, 91, 3165.2004789767343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21603, 1, 34.844857, -82.40235, 92, 3177.6621712104929)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21604, 1, 34.844755, -82.40253, 93, 3197.6462392983358)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21605, 1, 34.8447009, -82.4026392, 94, 3209.2995974186742)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21606, 1, 34.8446767, -82.4027505, 95, 3219.8187768796975)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21607, 1, 34.844664, -82.402825, 96, 3226.7704719039643)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21608, 1, 34.844631, -82.403026, 97, 3245.4977709324226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21609, 1, 34.8445617, -82.4037552, 98, 3312.5629509049804)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21610, 1, 34.844521, -82.404215, 99, 3354.814054565833)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21611, 1, 34.8507403, -82.3989856, 100, 4195.9783990783644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21612, 1, 34.8508232, -82.3989461, 101, 4205.886915065108)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21613, 1, 34.8515463, -82.3986011, 102, 4292.3321124043441)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21614, 1, 34.8515463, -82.3986011, 103, 4292.3321124043441)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21615, 1, 34.8524767, -82.398182, 104, 4402.7534583088)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21616, 1, 34.8539543, -82.3975115, 105, 4578.2731725386611)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21617, 1, 34.8539543, -82.3975115, 106, 4578.2731725386611)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21618, 1, 34.8540729, -82.39748, 107, 4591.7858045784778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21619, 1, 34.854146, -82.397464, 108, 4600.0538790885894)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21620, 1, 34.854588, -82.397282, 109, 4651.9900144119838)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21621, 1, 34.854858, -82.397156, 110, 4684.1747605582332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21622, 1, 34.854858, -82.397156, 111, 4684.1747605582332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21623, 1, 34.854962, -82.3971008, 112, 4696.80242639267)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21624, 1, 34.855293, -82.396958, 113, 4735.8900754880106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21625, 1, 34.8570122, -82.3962211, 114, 4938.7635493833286)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21626, 1, 34.85715, -82.396162, 115, 4955.0259450484518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21627, 1, 34.85715, -82.396162, 116, 4955.0259450484518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21628, 1, 34.8572429, -82.3961232, 117, 4965.9577970167084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21629, 1, 34.857724, -82.395922, 118, 5022.5793941685424)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21630, 1, 34.8581325, -82.3957502, 119, 5070.685101203936)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21631, 1, 34.8581408, -82.3957468, 120, 5071.6543393309685)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21632, 1, 34.858231, -82.39571, 121, 5082.2428457321657)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21633, 1, 34.858231, -82.39571, 122, 5082.2428457321657)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21634, 1, 34.8583026, -82.3956795, 123, 5090.6860512048934)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21635, 1, 34.859888, -82.395005, 124, 5277.6172334610419)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21636, 1, 34.8604683, -82.394752, 125, 5346.2251698425625)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21637, 1, 34.861544, -82.394283, 126, 5473.4038526970126)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21638, 1, 34.861544, -82.394283, 127, 5473.4038526970126)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21639, 1, 34.862797, -82.393742, 128, 5621.3817897613217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21640, 1, 34.862797, -82.393742, 129, 5621.3817897613217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21641, 1, 34.863003, -82.395912, 130, 5820.9119275730336)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21642, 1, 34.854524, -82.398794, 131, 6800.81418692242)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21643, 1, 34.85431, -82.398929, 132, 6827.63916791223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21644, 1, 34.854085, -82.399121, 133, 6858.2165836895038)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21645, 1, 34.853918, -82.399292, 134, 6882.49874055032)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21646, 1, 34.85375, -82.3994669, 135, 6907.0959812865676)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21647, 1, 34.853545, -82.399636, 136, 6934.6531340501888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21648, 1, 34.853366, -82.399751, 137, 6957.1789999836164)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21649, 1, 34.853233, -82.399817, 138, 6973.1652148073863)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21650, 1, 34.8529968, -82.3999247, 139, 7001.2393568428461)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21651, 1, 34.844521, -82.404215, 140, 8022.93040084407)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21652, 1, 34.8444546, -82.4044559, 141, 8046.14741654199)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21653, 1, 34.8443957, -82.4046618, 142, 8066.0685567856717)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21654, 1, 34.8442789, -82.4050744, 143, 8105.94324457682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21655, 1, 34.8441, -82.4057166, 144, 8167.9029446678251)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21656, 1, 34.8437897, -82.4068233, 145, 8274.74993013743)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21657, 1, 34.8435696, -82.4076083, 146, 8350.53845459233)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21658, 1, 34.8431161, -82.4092238, 147, 8506.528359866963)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21659, 1, 34.843083, -82.409344, 148, 8518.111355979061)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21660, 1, 34.843083, -82.409344, 149, 8518.111355979061)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21661, 1, 34.8429736, -82.4092959, 150, 8531.0586617669851)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21662, 1, 34.842127, -82.40896, 151, 8630.1724882796243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21663, 1, 34.842127, -82.40896, 152, 8630.1724882796243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21664, 1, 34.8414045, -82.4086855, 153, 8714.4202217353886)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21665, 1, 34.8413229, -82.4086575, 154, 8723.8576198817445)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21666, 1, 34.8413229, -82.4086575, 155, 8723.8576198817445)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21667, 1, 34.841604, -82.407404, 156, 8842.5803128607477)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21668, 1, 34.8416568, -82.4070651, 157, 8874.0963196693574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21669, 1, 34.8416888, -82.406861, 158, 8893.0808679463062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21670, 1, 34.8417035, -82.4067203, 159, 8906.0396801282332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21671, 1, 34.8417213, -82.406557, 160, 8921.0905038441979)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21672, 1, 34.8417222, -82.4065174, 161, 8924.7083326534121)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21673, 1, 34.8417225, -82.4064188, 162, 8933.7167540132887)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21674, 1, 34.854524, -82.398794, 163, 10519.907578363867)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21675, 1, 34.8549102, -82.3986459, 164, 10564.977552112101)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21676, 1, 34.8552753, -82.398506, 165, 10607.5820708723)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21677, 1, 34.8552753, -82.398506, 166, 10607.5820708723)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21678, 1, 34.855416, -82.398457, 167, 10623.871660733967)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21679, 1, 34.855416, -82.398457, 168, 10623.871660733967)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21680, 1, 34.85569, -82.398354, 169, 10655.791498067223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21681, 1, 34.856403, -82.398103, 170, 10738.407650918882)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21682, 1, 34.857666, -82.397668, 171, 10884.511411455411)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21683, 1, 34.858066, -82.397535, 172, 10930.666815074854)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21684, 1, 34.858579, -82.397365, 173, 10989.847376749436)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21685, 1, 34.858579, -82.397365, 174, 10989.847376749436)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21686, 1, 34.858706, -82.397352, 175, 11004.034387733858)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21687, 1, 34.859272, -82.39718, 176, 11068.970560216378)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21688, 1, 34.85939, -82.397134, 177, 11082.762078153821)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21689, 1, 34.860346, -82.39669, 178, 11196.649501300306)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21690, 1, 34.860794, -82.396485, 179, 11249.920137288123)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21691, 1, 34.86159, -82.39611, 180, 11344.920498023303)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21692, 1, 34.861714, -82.396078, 181, 11359.030257648072)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21693, 1, 34.863003, -82.395912, 182, 11503.319898825017)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21694, 1, 34.8512766, -82.4006823, 183, 12879.505162291405)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21695, 1, 34.8513617, -82.4006448, 184, 12889.578677114087)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21696, 1, 34.852291, -82.4002356, 185, 12999.574558714359)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21697, 1, 34.8523937, -82.4001903, 186, 13011.733201336312)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21698, 1, 34.8524809, -82.4001519, 187, 13022.054738527131)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21699, 1, 34.8529968, -82.3999247, 188, 13083.119846983871)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21856, 3, 34.8401632, -82.4038722, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21857, 3, 34.8401364, -82.403428, 1, 40.69401953825021)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21858, 3, 34.8400884, -82.4026554, 2, 111.48490579105575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21859, 3, 34.840085, -82.402576, 3, 118.74921959140585)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21860, 3, 34.8400301, -82.4016603, 4, 202.63549486915949)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21861, 3, 34.8400301, -82.4016603, 5, 202.63549486915949)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21862, 3, 34.8402332, -82.4016417, 6, 225.30844917934766)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21863, 3, 34.841089, -82.4015651, 7, 320.832414695708)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21864, 3, 34.841133, -82.4015959, 8, 326.48079808903213)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21865, 3, 34.841133, -82.4015959, 9, 326.48079808903213)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21866, 3, 34.8411403, -82.4017372, 10, 339.41588894094912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21867, 3, 34.8411512, -82.4019459, 11, 358.52232734688056)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21868, 3, 34.8411625, -82.4021632, 12, 378.41578892845655)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21869, 3, 34.8411736, -82.4023764, 13, 397.93382952130389)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21870, 3, 34.8411832, -82.4025601, 14, 414.75163109844544)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21871, 3, 34.8411873, -82.40264, 15, 422.06551431588451)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21872, 3, 34.8411924, -82.4027372, 16, 430.9644757227768)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21873, 3, 34.8411985, -82.4028552, 17, 441.76665697543092)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21874, 3, 34.8411985, -82.4028552, 18, 441.76665697543092)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21875, 3, 34.8411963, -82.4029545, 19, 450.84250944923372)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21876, 3, 34.8411803, -82.4030323, 20, 458.17058181703595)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21877, 3, 34.8411803, -82.4030323, 21, 458.17058181703595)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21878, 3, 34.8411909, -82.4032048, 22, 473.97494838342141)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21879, 3, 34.8411967, -82.4032991, 23, 482.6148535242009)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21880, 3, 34.8411998, -82.4033511, 24, 487.37832575264241)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21881, 3, 34.841204, -82.4034195, 25, 493.64530977906674)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21882, 3, 34.8412099, -82.4035162, 26, 502.50459571029097)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21883, 3, 34.8412144, -82.4035899, 27, 509.25723409545446)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21884, 3, 34.8412204, -82.4036878, 28, 518.22696772561449)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21885, 3, 34.8412313, -82.403865, 29, 534.46212364346)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21886, 3, 34.841242, -82.4040405, 30, 550.54073858934669)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21887, 3, 34.8412527, -82.4042152, 31, 566.54671772306619)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21888, 3, 34.8412635, -82.404392, 32, 582.74455331479624)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21889, 3, 34.8412684, -82.4044713, 33, 590.01011047224574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21890, 3, 34.8412684, -82.4044713, 34, 590.01011047224574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21891, 3, 34.8412944, -82.4045699, 35, 599.47236152822086)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21892, 3, 34.8413537, -82.4047159, 36, 614.35570893315275)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21893, 3, 34.8413537, -82.4047159, 37, 614.35570893315275)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21894, 3, 34.841239, -82.404768, 38, 627.98283428575473)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21895, 3, 34.840931, -82.40488, 39, 663.7636998294505)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21896, 3, 34.8407754, -82.4049099, 40, 681.29881391307981)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21897, 3, 34.8406996, -82.4049091, 41, 689.73666847236518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21898, 3, 34.8406996, -82.4049091, 42, 689.73666847236518)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21899, 3, 34.8406111, -82.4048701, 43, 700.21282452421644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21900, 3, 34.8403796, -82.4047463, 44, 728.35637916396331)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21901, 3, 34.8402874, -82.4046957, 45, 739.6134961052843)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21902, 3, 34.8507403, -82.3989856, 46, 2014.8122110111717)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21903, 3, 34.8506693, -82.3990179, 47, 2023.2489949805195)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21904, 3, 34.8506412, -82.3990306, 48, 2026.5849422248643)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21905, 3, 34.8496109, -82.3994984, 49, 2148.9805397873888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21906, 3, 34.8495248, -82.3995375, 50, 2159.2088902531891)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21907, 3, 34.8492914, -82.3996435, 51, 2186.9366205162837)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21908, 3, 34.8488156, -82.3998595, 52, 2243.4587423738353)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21909, 3, 34.8487026, -82.3999109, 53, 2256.8855364778897)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21910, 3, 34.8486664, -82.3999273, 54, 2261.1866291119222)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21911, 3, 34.8485024, -82.4000017, 55, 2280.6671470031147)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21912, 3, 34.8483374, -82.4000767, 56, 2300.2710790263341)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21913, 3, 34.8479487, -82.4002528, 57, 2346.4348972550792)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21914, 3, 34.847705499999996, -82.4003635, 58, 2375.3350513630257)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21915, 3, 34.8475797, -82.4004207, 59, 2390.2822910345167)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21916, 3, 34.8474487, -82.4004802, 60, 2405.8453378035429)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21917, 3, 34.8464867, -82.400917, 61, 2520.128012411084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21918, 3, 34.8464867, -82.400917, 62, 2520.128012411084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21919, 3, 34.846392, -82.400971, 63, 2531.7666336754296)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21920, 3, 34.8461845, -82.4011174, 64, 2558.45810373614)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21921, 3, 34.8461845, -82.4011174, 65, 2558.45810373614)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21922, 3, 34.845958, -82.401324, 66, 2589.9540412183883)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21923, 3, 34.845895, -82.401377, 67, 2598.4760473907754)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21924, 3, 34.845834, -82.40143, 68, 2606.8159155016383)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21925, 3, 34.8455653, -82.4016592, 69, 2643.3284757347105)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21926, 3, 34.8455653, -82.4016592, 70, 2643.3284757347105)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21927, 3, 34.845494, -82.40172, 71, 2653.016196085669)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21928, 3, 34.8451446, -82.4020518, 72, 2702.3285099185891)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21929, 3, 34.844934, -82.402251, 73, 2732.0070717540957)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21930, 3, 34.844857, -82.40235, 74, 2744.4687639878543)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21931, 3, 34.844755, -82.40253, 75, 2764.4528320756972)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21932, 3, 34.8447009, -82.4026392, 76, 2776.1061901960356)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21933, 3, 34.8446767, -82.4027505, 77, 2786.6253696570589)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21934, 3, 34.844664, -82.402825, 78, 2793.5770646813257)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21935, 3, 34.844631, -82.403026, 79, 2812.304363709784)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21936, 3, 34.8445617, -82.4037552, 80, 2879.3695436823418)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21937, 3, 34.844521, -82.404215, 81, 2921.6206473431944)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21938, 3, 34.844521, -82.404215, 82, 2921.6206473431944)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21939, 3, 34.844473, -82.404229, 83, 2927.1150064712529)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21940, 3, 34.844406, -82.404275, 84, 2935.6756134337788)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21941, 3, 34.8441825, -82.4045141, 85, 2968.7842173231052)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21942, 3, 34.84409, -82.404614, 86, 2982.5439329755318)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21943, 3, 34.843726, -82.404983, 87, 3035.2546859452709)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21944, 3, 34.843453, -82.405245, 88, 3073.9397767276796)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21945, 3, 34.843372, -82.405325, 89, 3085.5469227721383)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21946, 3, 34.843052, -82.405586, 90, 3128.4135372100441)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21947, 3, 34.842519, -82.4059946, 91, 3198.5135439714054)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21948, 3, 34.842452, -82.406046, 92, 3207.3273410135926)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21949, 3, 34.842057, -82.406315, 93, 3257.7006536728272)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21950, 3, 34.841948, -82.40636, 94, 3270.5118971110487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21951, 3, 34.8417973, -82.4063993, 95, 3287.6676331010976)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21952, 3, 34.8417225, -82.4064188, 96, 3296.1832771925888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21953, 3, 34.8417225, -82.4064188, 97, 3296.1832771925888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21954, 3, 34.841608, -82.406432, 98, 3308.9860569147763)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21955, 3, 34.84155, -82.4064386, 99, 3315.4705146317033)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21956, 3, 34.841415, -82.406454, 100, 3330.5641888209461)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21957, 3, 34.841219, -82.406466, 101, 3352.4105337202436)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21958, 3, 34.8408978, -82.4064644, 102, 3388.1669031484967)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21959, 3, 34.8408978, -82.4064644, 103, 3388.1669031484967)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21960, 3, 34.8408932, -82.406384, 104, 3395.5306354464433)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21961, 3, 34.8406996, -82.4049091, 105, 3531.9968299462043)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21962, 3, 34.8507403, -82.3989856, 106, 4773.8383520339212)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21963, 3, 34.8508232, -82.3989461, 107, 4783.7468680206648)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21964, 3, 34.8515463, -82.3986011, 108, 4870.1920653599009)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21965, 3, 34.8515463, -82.3986011, 109, 4870.1920653599009)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21966, 3, 34.8524767, -82.398182, 110, 4980.6134112643567)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21967, 3, 34.8539543, -82.3975115, 111, 5156.1331254942179)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21968, 3, 34.8539543, -82.3975115, 112, 5156.1331254942179)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21969, 3, 34.8540603, -82.397749, 113, 5180.83005150516)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21970, 3, 34.8542001, -82.398064, 114, 5213.5439782782478)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21971, 3, 34.8543672, -82.3984406, 115, 5252.6532286648644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21972, 3, 34.854524, -82.398794, 116, 5289.3528328177244)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21973, 3, 34.854524, -82.398794, 117, 5289.3528328177244)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21974, 3, 34.8549102, -82.3986459, 118, 5334.4228065659581)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21975, 3, 34.8552753, -82.398506, 119, 5377.0273253261566)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21976, 3, 34.8552753, -82.398506, 120, 5377.0273253261566)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21977, 3, 34.855416, -82.398457, 121, 5393.3169151878228)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21978, 3, 34.844521, -82.404215, 122, 6715.3008372130571)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21979, 3, 34.8444546, -82.4044559, 123, 6738.5178529109771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21980, 3, 34.8443957, -82.4046618, 124, 6758.4389931546584)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21981, 3, 34.8442789, -82.4050744, 125, 6798.3136809458065)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21982, 3, 34.8441, -82.4057166, 126, 6860.2733810368118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21983, 3, 34.8437897, -82.4068233, 127, 6967.1203665064168)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21984, 3, 34.8435696, -82.4076083, 128, 7042.9088909613156)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21985, 3, 34.8431161, -82.4092238, 129, 7198.89879623595)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21986, 3, 34.843083, -82.409344, 130, 7210.4817923480487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21987, 3, 34.843083, -82.409344, 131, 7210.4817923480487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21988, 3, 34.8429736, -82.4092959, 132, 7223.4290981359727)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21989, 3, 34.842127, -82.40896, 133, 7322.5429246486128)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21990, 3, 34.842127, -82.40896, 134, 7322.5429246486128)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21991, 3, 34.8414045, -82.4086855, 135, 7406.7906581043771)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21992, 3, 34.8413229, -82.4086575, 136, 7416.228056250734)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21993, 3, 34.8413229, -82.4086575, 137, 7416.228056250734)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21994, 3, 34.841604, -82.407404, 138, 7534.950749229738)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21995, 3, 34.8416568, -82.4070651, 139, 7566.4667560383477)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21996, 3, 34.8416888, -82.406861, 140, 7585.4513043152965)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21997, 3, 34.8417035, -82.4067203, 141, 7598.4101164972235)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21998, 3, 34.8417213, -82.406557, 142, 7613.4609402131882)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (21999, 3, 34.8417222, -82.4065174, 143, 7617.0787690224033)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22000, 3, 34.8417225, -82.4064188, 144, 7626.0871903822808)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22001, 3, 34.8401632, -82.4038722, 145, 7916.3713644807476)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22002, 3, 34.8402413, -82.4042443, 146, 7951.46244931694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22003, 3, 34.8402874, -82.4046957, 147, 7993.022704527878)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22004, 3, 34.8539543, -82.3975115, 148, 9649.94877195349)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22005, 3, 34.8540729, -82.39748, 149, 9663.4614039933076)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22006, 3, 34.854146, -82.397464, 150, 9671.72947850342)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22007, 3, 34.854588, -82.397282, 151, 9723.6656138268136)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22008, 3, 34.854858, -82.397156, 152, 9755.850359973063)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22009, 3, 34.854858, -82.397156, 153, 9755.850359973063)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22010, 3, 34.85514, -82.39782, 154, 9824.1479304283966)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22011, 3, 34.855416, -82.398457, 155, 9889.9502331633212)
SET IDENTITY_INSERT [dbo].[Shapes] OFF
SET IDENTITY_INSERT [dbo].[Stops] ON 

INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (24, N'N Main @ Bohemian Cafe', N'N Main @ Bohemian Cafe', 34.8619016, -82.3942142)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (25, N'N Main @ Thomas McAfee', N'N Main @ Thomas McAfee', 34.8602415, -82.3950161)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (26, N'619 N Main', N'619 N Main', 34.8595832, -82.3952439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (27, N'Towers East Apts', N'Towers East Apts', 34.8558375, -82.3968439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (28, N'N Main @ NOMA Square', N'N Main @ NOMA Square', 34.8531554, -82.3979107)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (29, N'N Main @ Mast General Store', N'N Main @ Mast General Store', 34.8520171, -82.3984516)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (30, N'N Main @ Certus Bank', N'N Main @ Certus Bank', 34.8512226, -82.3988049)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (31, N'S Main @ Wells Fargo Plaza', N'S Main @ Wells Fargo Plaza', 34.8503157, -82.3992308)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (32, N'S Main @ Poinsett Plaza', N'S Main @ Poinsett Plaza', 34.8491211, -82.3997923)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (33, N'S Main @ City Hall', N'S Main @ City Hall', 34.8482581, -82.4002633)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (34, N'S Main @ Village Green', N'S Main @ Village Green', 34.8477894, -82.4003879)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (35, N'S Main @ Peace Center', N'S Main @ Peace Center', 34.8466131, -82.400934)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (36, N'S Main @ Falls Park', N'S Main @ Falls Park', 34.8453763, -82.4019207)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (37, N'S Main @ Pomegranate', N'S Main @ Pomegranate', 34.8447334, -82.402793)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (38, N'S Main @ Rick Erwin', N'S Main @ Rick Erwin', 34.844639, -82.4036105)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (39, N'Fluor Field', N'Fluor Field', 34.8416466, -82.407466)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (40, N'Greenville Drive Ticket Office', N'Greenville Drive Ticket Office', 34.8428768, -82.4092208)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (41, N'S Main @ Compadres', N'S Main @ Compadres', 34.8433129, -82.4082198)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (42, N'S Main @ American Grocery', N'S Main @ American Grocery', 34.8442468, -82.4050237)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (43, N'River St @ West Court St', N'River St @ West Court St', 34.8493456, -82.4019878)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (44, N'S Richardson St @ Transit Center', N'S Richardson St @ Transit Center', 34.850448, -82.4010785)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (45, N'Richardson St @ W North St', N'Richardson St @ W North St', 34.8528676, -82.3998933)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (46, N'Heritage Green', N'Heritage Green', 34.8554933, -82.4010898)
SET IDENTITY_INSERT [dbo].[Stops] OFF
SET IDENTITY_INSERT [dbo].[Trolley] ON 

INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (1, N'Trolley', 1, 0, 0)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (2, N'Trolley', 2, 34.8506231, -82.4003675)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (4, N'Trolley', 3, 34.850725, -82.4006867)
SET IDENTITY_INSERT [dbo].[Trolley] OFF
ALTER TABLE [dbo].[RouteSchedule]  WITH CHECK ADD  CONSTRAINT [FK_RouteSchedule_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteSchedule] CHECK CONSTRAINT [FK_RouteSchedule_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Stops] FOREIGN KEY([StopID])
REFERENCES [dbo].[Stops] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Stops]
GO
ALTER TABLE [dbo].[Shapes]  WITH CHECK ADD  CONSTRAINT [FK_Shapes_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Shapes] CHECK CONSTRAINT [FK_Shapes_Routes]
GO
USE [master]
GO
ALTER DATABASE [TrolleyTracker] SET  READ_WRITE 
GO
