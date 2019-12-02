USE [Transportation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/12/2019 9:58:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacity]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capacity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Capacity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CarNumber] [varchar](15) NOT NULL,
	[Note] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
	[CapacityId] [bigint] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Distance] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distance]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Distance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone1] [varchar](10) NOT NULL,
	[Phone2] [varchar](10) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Note] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
	[DriverTypeId] [bigint] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverType]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_DriverType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DistanceId] [bigint] NOT NULL,
	[CapacityId] [bigint] NOT NULL,
	[Money] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation]    Script Date: 2/12/2019 9:58:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CarId] [bigint] NOT NULL,
	[DriverPrimaryId] [bigint] NOT NULL,
	[DriverSecondaryId] [bigint] NULL,
	[CompanyIds] [varchar](50) NOT NULL,
	[DocumentNumber] [varchar](50) NOT NULL,
	[Report] [nvarchar](200) NULL,
	[Note] [nvarchar](200) NULL,
	[Money] [money] NOT NULL,
	[TransportDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Transportation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191115153317_Init', N'2.2.6-servicing-10079')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (N'0a9fb582-7b34-4893-902d-5457509ab022', N'Administrator', N'ADMINISTRATOR', N'61f418ac-59ee-4405-a122-52ac3420f9e4', CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), NULL, N'Tien Tran', NULL, 1)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (N'1313c31c-5d15-4a8f-81b1-3f26b848f7a0', N'Staff', N'STAFF', N'd0ff323a-2210-4002-aad9-1a4554182ac4', CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), NULL, N'Tien Tran', NULL, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ecda3cc7-6b65-4688-8ac0-c1b5d5cd075c', N'0a9fb582-7b34-4893-902d-5457509ab022')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (N'ecda3cc7-6b65-4688-8ac0-c1b5d5cd075c', N'admin', N'ADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAED/+goFaERY3M+JK6XwM+8VdonFOyK2tV8moNegrpqqgpBjjWGLK2W00KG2DbssgmA==', N'IY72I2YURE74ECURBHMLMAQRRE4NX4HX', N'91071444-62b4-4c44-8e56-4832cbeef6bc', NULL, 0, 0, NULL, 1, 0, N'tien', N'tran', CAST(N'2019-11-18T17:33:20.0607084' AS DateTime2), NULL, N'Tien Tran', NULL, 1)
SET IDENTITY_INSERT [dbo].[Capacity] ON 

INSERT [dbo].[Capacity] ([Id], [Type], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'23 (m3)', CAST(N'2019-11-23T15:21:01.417' AS DateTime), CAST(N'2019-11-23T16:46:59.410' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Capacity] ([Id], [Type], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (2, N'30 (m3)', CAST(N'2019-11-23T15:23:48.347' AS DateTime), CAST(N'2019-11-24T07:27:34.777' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Capacity] ([Id], [Type], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (3, N'1000 (m3)', CAST(N'2019-11-23T16:53:05.263' AS DateTime), CAST(N'2019-11-23T17:06:10.030' AS DateTime), N'admin', N'admin', 2)
SET IDENTITY_INSERT [dbo].[Capacity] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name], [Code], [Address], [Distance], [Note], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'Tien', N'Tien', N'Tien', 1, N'Tien', CAST(N'2019-11-21T08:44:10.590' AS DateTime), NULL, N'admin', NULL, 1)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Distance] ON 

INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'0-10', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (2, N'11-20', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (3, N'21-30', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (4, N'31-45', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (5, N'46-60', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (6, N'61-75', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (7, N'76-95', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (8, N'96-120', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (9, N'121-150', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (10, N'151-180', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (11, N'181-210', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[Distance] ([Id], [Description], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (12, N'211-250', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
SET IDENTITY_INSERT [dbo].[Distance] OFF
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([Id], [Name], [Phone1], [Phone2], [Address], [Note], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [DriverTypeId]) VALUES (1, N'Tran Viet Tien', N'0332149965', N'0332149965', N'Ho Chi Minh', N'abc', CAST(N'2019-11-23T17:13:17.537' AS DateTime), NULL, N'admin', NULL, 1, 1)
INSERT [dbo].[Driver] ([Id], [Name], [Phone1], [Phone2], [Address], [Note], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [DriverTypeId]) VALUES (2, N'Linh', N'7783127372', N'7782137173', N'ABC', N'abc', CAST(N'2019-11-26T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Driver] OFF
SET IDENTITY_INSERT [dbo].[DriverType] ON 

INSERT [dbo].[DriverType] ([Id], [Type], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'Tài xế', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
INSERT [dbo].[DriverType] ([Id], [Type], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (2, N'Phụ xe', CAST(N'2019-11-22T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
SET IDENTITY_INSERT [dbo].[DriverType] OFF
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([Id], [DistanceId], [CapacityId], [Money], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, 1, 1, 1000.0000, CAST(N'2019-12-01T00:00:00.000' AS DateTime), NULL, N'admin', NULL, 1)
SET IDENTITY_INSERT [dbo].[Price] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_CompanyCode]    Script Date: 2/12/2019 9:58:30 AM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [UK_CompanyCode] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_DistanceId_CapacityId]    Script Date: 2/12/2019 9:58:30 AM ******/
ALTER TABLE [dbo].[Price] ADD  CONSTRAINT [UK_DistanceId_CapacityId] UNIQUE NONCLUSTERED 
(
	[DistanceId] ASC,
	[CapacityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Capacity] FOREIGN KEY([CapacityId])
REFERENCES [dbo].[Capacity] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Capacity]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_DriverType] FOREIGN KEY([DriverTypeId])
REFERENCES [dbo].[DriverType] ([Id])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_DriverType]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Capacity] FOREIGN KEY([CapacityId])
REFERENCES [dbo].[Capacity] ([Id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Capacity]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Distance] FOREIGN KEY([DistanceId])
REFERENCES [dbo].[Distance] ([Id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Distance]
GO
ALTER TABLE [dbo].[Transportation]  WITH CHECK ADD  CONSTRAINT [FK_Transportation_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[Transportation] CHECK CONSTRAINT [FK_Transportation_Car]
GO
ALTER TABLE [dbo].[Transportation]  WITH CHECK ADD  CONSTRAINT [FK_Transportation_Driver] FOREIGN KEY([DriverPrimaryId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Transportation] CHECK CONSTRAINT [FK_Transportation_Driver]
GO
ALTER TABLE [dbo].[Transportation]  WITH CHECK ADD  CONSTRAINT [FK_Transportation_Driver1] FOREIGN KEY([DriverSecondaryId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Transportation] CHECK CONSTRAINT [FK_Transportation_Driver1]
GO
