USE [master]
GO
/****** Object:  Database [Albarran]    Script Date: 14-10-2024 17:23:35 ******/
CREATE DATABASE [Albarran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Albarran1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Albarran1.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Albarran1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Albarran1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Albarran] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Albarran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Albarran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Albarran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Albarran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Albarran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Albarran] SET ARITHABORT OFF 
GO
ALTER DATABASE [Albarran] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Albarran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Albarran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Albarran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Albarran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Albarran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Albarran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Albarran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Albarran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Albarran] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Albarran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Albarran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Albarran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Albarran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Albarran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Albarran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Albarran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Albarran] SET RECOVERY FULL 
GO
ALTER DATABASE [Albarran] SET  MULTI_USER 
GO
ALTER DATABASE [Albarran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Albarran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Albarran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Albarran] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Albarran] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Albarran] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Albarran', N'ON'
GO
ALTER DATABASE [Albarran] SET QUERY_STORE = OFF
GO
USE [Albarran]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[cargo_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cargos] PRIMARY KEY CLUSTERED 
(
	[cargo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[categoria_id] [int] NOT NULL,
	[categoria] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[cliente_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[appaterno] [nvarchar](255) NOT NULL,
	[apmaterno] [nvarchar](255) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
	[estado_civil] [nvarchar](255) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comunas]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comunas](
	[comuna_id] [int] NOT NULL,
	[comuna] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_comunas] PRIMARY KEY CLUSTERED 
(
	[comuna_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ventas]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ventas](
	[venta_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [int] NOT NULL,
	[descuento] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_detalle_ventas] PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC,
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[empleado_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[appaterno] [nvarchar](255) NOT NULL,
	[apmaterno] [nvarchar](255) NOT NULL,
	[fecha_contrato] [datetime] NOT NULL,
	[sueldo_base] [int] NOT NULL,
	[cargo_id] [int] NOT NULL,
 CONSTRAINT [PK_empleados] PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[producto_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[precio] [int] NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[categoria_id] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[sucursal_id] [int] NOT NULL,
	[sucursal] [nvarchar](255) NOT NULL,
	[comuna_id] [int] NOT NULL,
 CONSTRAINT [PK_sucursales] PRIMARY KEY CLUSTERED 
(
	[sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[venta_id] [int] NOT NULL,
	[vendedor_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[sucursal_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipo_documento] [nvarchar](255) NOT NULL,
	[numero_documento] [int] NOT NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalle_ventas]  WITH CHECK ADD  CONSTRAINT [FK_detalle_ventas_productos] FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([producto_id])
GO
ALTER TABLE [dbo].[detalle_ventas] CHECK CONSTRAINT [FK_detalle_ventas_productos]
GO
ALTER TABLE [dbo].[detalle_ventas]  WITH CHECK ADD  CONSTRAINT [FK_detalle_ventas_ventas] FOREIGN KEY([venta_id])
REFERENCES [dbo].[ventas] ([venta_id])
GO
ALTER TABLE [dbo].[detalle_ventas] CHECK CONSTRAINT [FK_detalle_ventas_ventas]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_cargos] FOREIGN KEY([cargo_id])
REFERENCES [dbo].[cargos] ([cargo_id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_empleados_cargos]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_categorias] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([categoria_id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_categorias]
GO
ALTER TABLE [dbo].[sucursales]  WITH CHECK ADD  CONSTRAINT [FK_sucursales_comunas] FOREIGN KEY([comuna_id])
REFERENCES [dbo].[comunas] ([comuna_id])
GO
ALTER TABLE [dbo].[sucursales] CHECK CONSTRAINT [FK_sucursales_comunas]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_clientes] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([cliente_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_clientes]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_empleados] FOREIGN KEY([vendedor_id])
REFERENCES [dbo].[empleados] ([empleado_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_empleados]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_sucursales] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([sucursal_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_sucursales]
GO
/****** Object:  StoredProcedure [dbo].[GenerateTimeData]    Script Date: 14-10-2024 17:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GenerateTimeData]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDate DATE = @StartDate;

    WHILE @CurrentDate <= @EndDate
    BEGIN
        INSERT INTO Albarran_DW2.dbo.dim_tiempo (
            fecha,
            año,
            mes,
            dia_semana, 
            trimestre
        )
        VALUES (
            @CurrentDate,                       -- fecha
            YEAR(@CurrentDate),                 -- anio
            MONTH(@CurrentDate),                -- mes
            DATENAME(WEEKDAY, @CurrentDate),    -- dia_semana
            DATEPART(QUARTER, @CurrentDate)     -- trimestre
        );

        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END
END
GO
USE [master]
GO
ALTER DATABASE [Albarran] SET  READ_WRITE 
GO
