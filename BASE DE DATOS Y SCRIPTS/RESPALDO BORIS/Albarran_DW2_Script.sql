USE [master]
GO
/****** Object:  Database [Albarran_DW2]    Script Date: 14-10-2024 17:24:14 ******/
CREATE DATABASE [Albarran_DW2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Albarran_DW2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Albarran_DW2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Albarran_DW2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Albarran_DW2_log.ldf' , SIZE = 794624KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Albarran_DW2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Albarran_DW2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Albarran_DW2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Albarran_DW2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Albarran_DW2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Albarran_DW2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Albarran_DW2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Albarran_DW2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Albarran_DW2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Albarran_DW2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Albarran_DW2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Albarran_DW2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Albarran_DW2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Albarran_DW2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Albarran_DW2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Albarran_DW2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Albarran_DW2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Albarran_DW2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Albarran_DW2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Albarran_DW2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Albarran_DW2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Albarran_DW2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Albarran_DW2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Albarran_DW2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Albarran_DW2] SET RECOVERY FULL 
GO
ALTER DATABASE [Albarran_DW2] SET  MULTI_USER 
GO
ALTER DATABASE [Albarran_DW2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Albarran_DW2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Albarran_DW2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Albarran_DW2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Albarran_DW2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Albarran_DW2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Albarran_DW2', N'ON'
GO
ALTER DATABASE [Albarran_DW2] SET QUERY_STORE = OFF
GO
USE [Albarran_DW2]
GO
/****** Object:  Table [dbo].[dim_cargos]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_cargos](
	[cargo_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cargo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_categorias]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_categorias](
	[categoria_id] [int] NOT NULL,
	[categoria] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_clientes]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_clientes](
	[cliente_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[appaterno] [nvarchar](255) NOT NULL,
	[apmaterno] [nvarchar](255) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
	[estado_civil] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_comunas]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_comunas](
	[comuna_id] [int] NOT NULL,
	[comuna] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comuna_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_empleados]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_empleados](
	[empleado_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[appaterno] [nvarchar](255) NOT NULL,
	[apmaterno] [nvarchar](255) NOT NULL,
	[fecha_contrato] [datetime] NOT NULL,
	[sueldo_base] [int] NOT NULL,
	[cargo_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_productos]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_productos](
	[producto_id] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[precio] [int] NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[categoria_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_sucursales]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_sucursales](
	[sucursal_id] [int] NOT NULL,
	[sucursal] [nvarchar](255) NOT NULL,
	[comuna_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiempo]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiempo](
	[fecha] [date] NOT NULL,
	[año] [int] NULL,
	[mes] [int] NULL,
	[dia] [int] NULL,
	[dia_semana] [varchar](20) NULL,
	[trimestre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas_hechos]    Script Date: 14-10-2024 17:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_hechos](
	[venta_id] [int] NOT NULL,
	[producto_id] [int] NULL,
	[cliente_id] [int] NULL,
	[vendedor_id] [int] NULL,
	[sucursal_id] [int] NULL,
	[fecha] [date] NULL,
	[tipo_documento] [nvarchar](255) NOT NULL,
	[numero_documento] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio_unitario] [decimal](10, 2) NULL,
	[descuento] [decimal](5, 2) NULL,
	[monto_total]  AS (([cantidad]*[precio_unitario])*((1)-[descuento]/(100))),
PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_venta_compuesta] UNIQUE NONCLUSTERED 
(
	[producto_id] ASC,
	[cliente_id] ASC,
	[vendedor_id] ASC,
	[sucursal_id] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_empleados]  WITH CHECK ADD  CONSTRAINT [FK_dim_empleados_cargos] FOREIGN KEY([cargo_id])
REFERENCES [dbo].[dim_cargos] ([cargo_id])
GO
ALTER TABLE [dbo].[dim_empleados] CHECK CONSTRAINT [FK_dim_empleados_cargos]
GO
ALTER TABLE [dbo].[dim_productos]  WITH CHECK ADD  CONSTRAINT [FK_dim_productos_categorias] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[dim_categorias] ([categoria_id])
GO
ALTER TABLE [dbo].[dim_productos] CHECK CONSTRAINT [FK_dim_productos_categorias]
GO
ALTER TABLE [dbo].[dim_sucursales]  WITH CHECK ADD  CONSTRAINT [FK_dim_sucursales_comunas] FOREIGN KEY([comuna_id])
REFERENCES [dbo].[dim_comunas] ([comuna_id])
GO
ALTER TABLE [dbo].[dim_sucursales] CHECK CONSTRAINT [FK_dim_sucursales_comunas]
GO
ALTER TABLE [dbo].[ventas_hechos]  WITH CHECK ADD  CONSTRAINT [FK_ventas_hechos_clientes] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[dim_clientes] ([cliente_id])
GO
ALTER TABLE [dbo].[ventas_hechos] CHECK CONSTRAINT [FK_ventas_hechos_clientes]
GO
ALTER TABLE [dbo].[ventas_hechos]  WITH CHECK ADD  CONSTRAINT [FK_ventas_hechos_empleados] FOREIGN KEY([vendedor_id])
REFERENCES [dbo].[dim_empleados] ([empleado_id])
GO
ALTER TABLE [dbo].[ventas_hechos] CHECK CONSTRAINT [FK_ventas_hechos_empleados]
GO
ALTER TABLE [dbo].[ventas_hechos]  WITH CHECK ADD  CONSTRAINT [FK_ventas_hechos_productos] FOREIGN KEY([producto_id])
REFERENCES [dbo].[dim_productos] ([producto_id])
GO
ALTER TABLE [dbo].[ventas_hechos] CHECK CONSTRAINT [FK_ventas_hechos_productos]
GO
ALTER TABLE [dbo].[ventas_hechos]  WITH CHECK ADD  CONSTRAINT [FK_ventas_hechos_sucursales] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[dim_sucursales] ([sucursal_id])
GO
ALTER TABLE [dbo].[ventas_hechos] CHECK CONSTRAINT [FK_ventas_hechos_sucursales]
GO
ALTER TABLE [dbo].[ventas_hechos]  WITH CHECK ADD  CONSTRAINT [FK_ventas_hechos_tiempo] FOREIGN KEY([fecha])
REFERENCES [dbo].[dim_tiempo] ([fecha])
GO
ALTER TABLE [dbo].[ventas_hechos] CHECK CONSTRAINT [FK_ventas_hechos_tiempo]
GO
/****** Object:  StoredProcedure [dbo].[GenerateTimeData]    Script Date: 14-10-2024 17:24:14 ******/
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
ALTER DATABASE [Albarran_DW2] SET  READ_WRITE 
GO
