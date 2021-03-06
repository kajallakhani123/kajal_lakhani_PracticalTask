USE [master]
GO
/****** Object:  Database [kajal_PracticalTest]    Script Date: 10/8/2018 12:53:32 AM ******/
CREATE DATABASE [kajal_PracticalTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kajal_PracticalTest', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\kajal_PracticalTest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kajal_PracticalTest_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\kajal_PracticalTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kajal_PracticalTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kajal_PracticalTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kajal_PracticalTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kajal_PracticalTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kajal_PracticalTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kajal_PracticalTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kajal_PracticalTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kajal_PracticalTest] SET  MULTI_USER 
GO
ALTER DATABASE [kajal_PracticalTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kajal_PracticalTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kajal_PracticalTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kajal_PracticalTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kajal_PracticalTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [kajal_PracticalTest]
GO
/****** Object:  Table [dbo].[tbl_notes]    Script Date: 10/8/2018 12:53:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_notes](
	[notes_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[title] [varchar](150) NULL,
	[notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_note] PRIMARY KEY CLUSTERED 
(
	[notes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 10/8/2018 12:53:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_notes] ON 

INSERT [dbo].[tbl_notes] ([notes_id], [user_id], [title], [notes]) VALUES (9, 2, N'aa', N'aa')
INSERT [dbo].[tbl_notes] ([notes_id], [user_id], [title], [notes]) VALUES (13, 1, N'sadas', N'asdasd')
INSERT [dbo].[tbl_notes] ([notes_id], [user_id], [title], [notes]) VALUES (14, 1, N'sdfsdf', N'sdfsdfd')
SET IDENTITY_INSERT [dbo].[tbl_notes] OFF
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([user_id], [username], [password]) VALUES (1, N'aa', N'aa')
INSERT [dbo].[tbl_user] ([user_id], [username], [password]) VALUES (2, N'ss', N'ss')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
ALTER TABLE [dbo].[tbl_notes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_notes_tbl_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_user] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_notes] CHECK CONSTRAINT [FK_tbl_notes_tbl_user]
GO
/****** Object:  StoredProcedure [dbo].[create_user_notes]    Script Date: 10/8/2018 12:53:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_user_notes]
	-- Add the parameters for the stored procedure here
	@title varchar(150)=null,
	@notes nvarchar(max)=null,
	@username varchar(50)=null,
	@password varchar(50)=null,
	@userid  int=null,
	@notesid int=null,
	@Action varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		
	SET NOCOUNT ON;

   
	if @Action='Insert'
	
	insert into tbl_notes(title,notes,user_id)values(@title,@notes,@userid)

	
	if @Action='Delete'

	delete from tbl_notes where notes_id=@notesid

	
	if @Action='Select'

	Select notes_id,title,notes from tbl_notes where user_id=@userid

    
END

GO
/****** Object:  StoredProcedure [dbo].[userlogin]    Script Date: 10/8/2018 12:53:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[userlogin]
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select username,user_id from tbl_user where username=@username and password=@password
END

GO
USE [master]
GO
ALTER DATABASE [kajal_PracticalTest] SET  READ_WRITE 
GO
