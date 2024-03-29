USE [master]
GO
/****** Object:  Database [ActivityCodesV2]    Script Date: 4/21/2014 8:55:30 AM ******/
CREATE DATABASE [ActivityCodesV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ActivityCodesV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ActivityCodesV2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ActivityCodesV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ActivityCodesV2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ActivityCodesV2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ActivityCodesV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ActivityCodesV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ActivityCodesV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ActivityCodesV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ActivityCodesV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ActivityCodesV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ActivityCodesV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET RECOVERY FULL 
GO
ALTER DATABASE [ActivityCodesV2] SET  MULTI_USER 
GO
ALTER DATABASE [ActivityCodesV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ActivityCodesV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ActivityCodesV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ActivityCodesV2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ActivityCodesV2', N'ON'
GO
USE [ActivityCodesV2]
GO
/****** Object:  Table [dbo].[ActivityCodes]    Script Date: 4/21/2014 8:55:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ActivityCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Calls]    Script Date: 4/21/2014 8:55:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Agent] [nvarchar](max) NOT NULL,
	[ActivityCodes] [smallint] NOT NULL,
 CONSTRAINT [PK_Calls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/21/2014 8:55:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 4/21/2014 8:55:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[IsInProduct] [nvarchar](max) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (1, N'Tarjetas de Crédito', N'01')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (2, N'Préstamos', N'02')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (3, N'Cuentas de Ahorro', N'03')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (4, N'Cuentas Corrientes', N'04')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (5, N'Certificados de Depositos', N'05')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (6, N'Millas', N'06')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (7, N'Canales Alternos (IVR, IB, Tpago, Móvil Banking, m-pesos, otros)', N'07')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (8, N'Cartas de Crédito', N'08')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (9, N'Banca Seguros', N'09')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (10, N'Cajas de Seguridad', N'10')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (11, N'Mercado Cambiario', N'11')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (12, N'Garantías Bancarias', N'12')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (13, N'Dptos Internos, Oficinas, Autobancos y/o Cajeros Automaticos', N'13')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (14, N'Empleados del banco', N'14')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (15, N'Cheques', N'15')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (16, N'Cartas Consulares y/o Referencia', N'16')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (17, N'Citas consulares', N'17')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (18, N'Remesas', N'18')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (19, N'Filiales', N'19')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (20, N'Aliados Popular', N'20')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (21, N'Atención Clientes', N'21')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (22, N'Subagente Bancario', N'22')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (23, N'Paquetes de Productos', N'23')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (24, N'Transferencia Domestica', N'24')
INSERT [dbo].[Products] ([Id], [Description], [Code]) VALUES (25, N'Tarjeta Visa Débito', N'25')
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (39, N'Consulta Balance/Conciliaciones', N'01', N'01,02,03,04,05,06,20')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (40, N'Activación', N'02', N'01,07,09')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (41, N'Bloqueo por pérdida, robo, retención en cajero', N'03', N'01,07')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (42, N'Estatus de Producto', N'04', N'01,02,03,04,05,07,09')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (43, N'Desembolso Extracrédito', N'05', N'02')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (44, N'Transferencias Vía Operador', N'06', N'03,04,21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (45, N'Pagos Vía Operador', N'07', N'01,02,21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (46, N'Reclamaciones - Solicitudes de Servicios', N'08', N'01,02,03,04,05,06,07,09,20,22')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (47, N'Quejas y/o sugerencias', N'09', N'01,02,03,04,05,06,07,08,09,10,12,13,14,20,21,22,23')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (48, N'Requisitos Producto y/o Servicio', N'10', N'01,02,03,04,05,06,07,08,09,10,12,16,17,18,22,23,24')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (49, N'Beneficios Producto y/o Servicio', N'11', N'01,02,03,04,05,06,07,08,09,10,12,16,17,18,22,23,24')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (50, N'Tarifas Producto y/o Servicio', N'12', N'01,02,03,04,05,06,07,08,09,10,12,16,17,18,22,23,24')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (51, N'Descripción Producto y/o Servicio', N'13', N'01,02,03,04,05,06,07,08,09,10,12,16,17,18,19,22,23,24')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (52, N'Solicitud o información de Chequera', N'14', N'15')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (53, N'Transferencias Internacionales', N'15', N'03,04,21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (54, N'Tasas de Monedas', N'16', N'03,04,11')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (55, N'Afiliados para pagos y/o transferencias vía Internet Banking', N'17', N'07')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (56, N'Horario, Dirección y/o Telefóno, otros', N'18', N'13,14,19,20')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (57, N'Estatus de Solicitud de Producto', N'19', N'01,02,03,04,09')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (58, N'Estatus de Reclamación - Solicitude Servicio', N'20', N'01,02,03,04,05,06,07,09,20')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (59, N'Envoltura de Monedas', N'21', N'21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (60, N'Promociones - Ferias', N'22', N'01,02,03,04,05,07,21,22,23')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (61, N'Cartas de Saldo', N'23', N'01,02')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (62, N'Cierre y/o cancelación de producto', N'24', N'01,02,03,04,05,23,06,07,09,22')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (63, N'Oficial / Oficina asignado', N'25', N'01,02,03,04,05,23,06,07,09')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (64, N'Tasa de Interés', N'26', N'01,02,03,04,05,23,06,12')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (65, N'Localización de Plástico', N'27', N'01,02')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (66, N'Credito Diferido TC US$', N'28', N'01')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (67, N'Acuerdos de Pago', N'29', N'01')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (68, N'Reclamaciones Cicla - DataCrédito', N'30', N'01,02,03,04')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (69, N'Recepción de Pagos a producto', N'31', N'01,02')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (70, N'Creación Canjes Millas', N'32', N'06')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (71, N'Transferencia hacia Oficina - Departamento', N'33', N'21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (72, N'Transferencia Interna entre Colas', N'34', N'21')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (73, N'Suspención cuenta, cheque o certificado por robo o  pérdida', N'35', N'03,04,05')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (74, N'Estatus de Canje de Millas', N'36', N'06')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (75, N'Desembolso - Estatus Renesas', N'37', N'18')
INSERT [dbo].[Transactions] ([Id], [Description], [Code], [IsInProduct]) VALUES (76, N'Estatus de Canje Aliados Popular', N'38', N'20')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
USE [master]
GO
ALTER DATABASE [ActivityCodesV2] SET  READ_WRITE 
GO
