USE [master]
GO
/****** Object:  Database [ComPropertyAnalysisDW]    Script Date: 19/9/2022 6:51:09 am ******/
CREATE DATABASE [ComPropertyAnalysisDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComPropertyAnalysisDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ComPropertyAnalysisDW.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComPropertyAnalysisDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ComPropertyAnalysisDW_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComPropertyAnalysisDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET RECOVERY FULL 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET  MULTI_USER 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ComPropertyAnalysisDW', N'ON'
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET QUERY_STORE = OFF
GO
USE [ComPropertyAnalysisDW]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 19/9/2022 6:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DimDateKey] [int] NOT NULL,
	[FullDate] [date] NULL,
	[DateName] [nchar](11) NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nchar](10) NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekdayWeekend] [nchar](10) NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[MonthName] [nchar](10) NOT NULL,
	[MonthOfYear] [tinyint] NOT NULL,
	[IsLastDayOfMonth] [nchar](1) NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarYearMonth] [nchar](10) NOT NULL,
	[CalendarYearQtr] [nchar](10) NOT NULL,
 CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
(
	[DimDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSchool]    Script Date: 19/9/2022 6:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSchool](
	[DimSchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [smallint] NOT NULL,
	[SchoolName] [text] NOT NULL,
	[SchoolAddress] [text] NOT NULL,
	[NUmberOfStudents] [smallint] NOT NULL,
	[ICSEAValue] [smallint] NOT NULL,
	[LevelOfSchool] [text] NOT NULL,
	[SelectiveSchool] [text] NOT NULL,
	[SchoolSpecialityType] [text] NOT NULL,
	[SchoolSubtype] [text] NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Phone] [text] NOT NULL,
	[Email] [text] NOT NULL,
	[LGA] [text] NOT NULL,
	[FacsDistrict] [text] NOT NULL,
	[LocalHealthDistrict] [text] NOT NULL,
	[ASGSRemotness] [text] NOT NULL,
	[DateExtracted] [date] NOT NULL,
 CONSTRAINT [PK_DimSchool] PRIMARY KEY CLUSTERED 
(
	[DimSchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStation]    Script Date: 19/9/2022 6:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStation](
	[DimStationKey] [int] IDENTITY(1,1) NOT NULL,
	[StationID] [smallint] NOT NULL,
	[EntranceType] [nchar](10) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimStation] PRIMARY KEY CLUSTERED 
(
	[DimStationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSuburb]    Script Date: 19/9/2022 6:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSuburb](
	[DimSuburbKey] [int] IDENTITY(1,1) NOT NULL,
	[SuburbID] [smallint] NOT NULL,
	[Suburb] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[PostCode] [smallint] NOT NULL,
 CONSTRAINT [PK_DimSuburb] PRIMARY KEY CLUSTERED 
(
	[DimSuburbKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPropertyAnalysis]    Script Date: 19/9/2022 6:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPropertyAnalysis](
	[FactPropertyKey] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [smallint] NOT NULL,
	[PropertyMedianValue] [int] NOT NULL,
	[DimDateKey] [int] NOT NULL,
	[DimStationKey] [int] NULL,
	[DimSchoolKey] [int] NOT NULL,
	[DimSuburbKey] [int] NOT NULL,
 CONSTRAINT [PK_FactPropertyAnalysis] PRIMARY KEY CLUSTERED 
(
	[FactPropertyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactPropertyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_FactPropertyAnalysis_DimDate] FOREIGN KEY([DimDateKey])
REFERENCES [dbo].[DimDate] ([DimDateKey])
GO
ALTER TABLE [dbo].[FactPropertyAnalysis] CHECK CONSTRAINT [FK_FactPropertyAnalysis_DimDate]
GO
ALTER TABLE [dbo].[FactPropertyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_FactPropertyAnalysis_DimSchool] FOREIGN KEY([DimSchoolKey])
REFERENCES [dbo].[DimSchool] ([DimSchoolKey])
GO
ALTER TABLE [dbo].[FactPropertyAnalysis] CHECK CONSTRAINT [FK_FactPropertyAnalysis_DimSchool]
GO
ALTER TABLE [dbo].[FactPropertyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_FactPropertyAnalysis_DimStation] FOREIGN KEY([DimStationKey])
REFERENCES [dbo].[DimStation] ([DimStationKey])
GO
ALTER TABLE [dbo].[FactPropertyAnalysis] CHECK CONSTRAINT [FK_FactPropertyAnalysis_DimStation]
GO
ALTER TABLE [dbo].[FactPropertyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_FactPropertyAnalysis_DimSuburb] FOREIGN KEY([DimSuburbKey])
REFERENCES [dbo].[DimSuburb] ([DimSuburbKey])
GO
ALTER TABLE [dbo].[FactPropertyAnalysis] CHECK CONSTRAINT [FK_FactPropertyAnalysis_DimSuburb]
GO
USE [master]
GO
ALTER DATABASE [ComPropertyAnalysisDW] SET  READ_WRITE 
GO
