USE [LabDB]
GO
/****** Object:  Table [dbo].[Insurance_companes]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance_companes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[INN] [bigint] NOT NULL,
	[KPP] [int] NOT NULL,
	[BIK] [int] NOT NULL,
 CONSTRAINT [PK_Insurance_companes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [date] NOT NULL,
	[code_services1] [int] NOT NULL,
	[code_services2] [int] NULL,
	[code_services3] [int] NULL,
	[code_services4] [int] NULL,
	[code_services5] [int] NULL,
	[order_status] [bit] NOT NULL,
	[service_status] [bit] NOT NULL,
	[due_time] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[barcode] [bigint] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[birthday] [date] NULL,
	[passport_data] [bigint] NOT NULL,
	[email] [nvarchar](50) NULL,
	[insurance_number] [bigint] NOT NULL,
	[insurance_type] [nvarchar](50) NOT NULL,
	[insurance_company_ID] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[code] [int] NOT NULL,
	[service] [nvarchar](50) NOT NULL,
	[price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.02.2024 17:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[ip] [nvarchar](50) NULL,
	[lastenter] [date] NULL,
	[services1] [int] NULL,
	[services2] [int] NULL,
	[services3] [int] NULL,
	[services4] [int] NULL,
	[services5] [int] NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patients] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Patients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_services] FOREIGN KEY([code_services1])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_services]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_services1] FOREIGN KEY([code_services2])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_services1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_services2] FOREIGN KEY([code_services3])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_services2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_services3] FOREIGN KEY([code_services4])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_services3]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_services4] FOREIGN KEY([code_services5])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_services4]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_users]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Insurance_companes] FOREIGN KEY([insurance_company_ID])
REFERENCES [dbo].[Insurance_companes] ([id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Insurance_companes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_services] FOREIGN KEY([services1])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_services]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_services1] FOREIGN KEY([services2])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_services1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_services2] FOREIGN KEY([services3])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_services2]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_services3] FOREIGN KEY([services4])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_services3]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_services4] FOREIGN KEY([services5])
REFERENCES [dbo].[Services] ([code])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_services4]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_Type] FOREIGN KEY([type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_Type]
GO
