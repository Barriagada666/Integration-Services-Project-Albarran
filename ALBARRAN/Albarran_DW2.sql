/****** Objeto: Tabla [dbo].[dim_cargos]    Fecha del script: 25-09-2024 14:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Crear tabla para almacenar información de cargos
CREATE TABLE [dbo].[dim_cargos] (
    [cargo_id] INT NOT NULL PRIMARY KEY,  -- Clave primaria para el identificador del cargo
    [nombre] NVARCHAR(255) NOT NULL        -- Nombre del cargo
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_categorias]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar categorías de productos
CREATE TABLE [dbo].[dim_categorias] (
    [categoria_id] INT NOT NULL PRIMARY KEY,  -- Clave primaria para el identificador de la categoría
    [categoria] NVARCHAR(255) NOT NULL        -- Nombre de la categoría
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_clientes]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de clientes
CREATE TABLE [dbo].[dim_clientes] (
    [cliente_id] INT NOT NULL PRIMARY KEY,  -- Clave primaria para el identificador del cliente
    [nombre] NVARCHAR(255) NOT NULL,         -- Nombre del cliente
    [appaterno] NVARCHAR(255) NOT NULL,     -- Apellido paterno
    [apmaterno] NVARCHAR(255) NOT NULL,     -- Apellido materno
    [sexo] CHAR(1) NOT NULL,                 -- Sexo del cliente (M/F)
    [fecha_nacimiento] DATETIME NULL,        -- Fecha de nacimiento
    [estado_civil] NVARCHAR(255) NULL        -- Estado civil
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_comunas]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de comunas
CREATE TABLE [dbo].[dim_comunas] (
    [comuna_id] INT NOT NULL PRIMARY KEY,    -- Clave primaria para el identificador de la comuna
    [comuna] NVARCHAR(255) NOT NULL           -- Nombre de la comuna
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_empleados]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de empleados
CREATE TABLE [dbo].[dim_empleados] (
    [empleado_id] INT NOT NULL PRIMARY KEY,   -- Clave primaria para el identificador del empleado
    [nombre] NVARCHAR(255) NOT NULL,          -- Nombre del empleado
    [appaterno] NVARCHAR(255) NOT NULL,      -- Apellido paterno
    [apmaterno] NVARCHAR(255) NOT NULL,      -- Apellido materno
    [fecha_contrato] DATETIME NOT NULL,      -- Fecha del contrato
    [sueldo_base] INT NOT NULL,               -- Sueldo base del empleado
    [cargo_id] INT NOT NULL,                  -- Identificador del cargo
    CONSTRAINT FK_dim_empleados_cargos FOREIGN KEY (cargo_id) REFERENCES [dbo].[dim_cargos] (cargo_id)  -- Clave foránea referenciando a dim_cargos
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_productos]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de productos
CREATE TABLE [dbo].[dim_productos] (
    [producto_id] INT NOT NULL PRIMARY KEY,    -- Clave primaria para el identificador del producto
    [nombre] NVARCHAR(255) NOT NULL,           -- Nombre del producto
    [precio] INT NOT NULL,                      -- Precio del producto
    [descripcion] NVARCHAR(255) NULL,          -- Descripción del producto
    [categoria_id] INT NOT NULL,               -- Identificador de la categoría
    CONSTRAINT FK_dim_productos_categorias FOREIGN KEY (categoria_id) REFERENCES [dbo].[dim_categorias] (categoria_id)  -- Clave foránea referenciando a dim_categorias
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_sucursales]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de sucursales
CREATE TABLE [dbo].[dim_sucursales] (
    [sucursal_id] INT NOT NULL PRIMARY KEY,    -- Clave primaria para el identificador de la sucursal
    [sucursal] NVARCHAR(255) NOT NULL,         -- Nombre de la sucursal
    [comuna_id] INT NOT NULL,                  -- Identificador de la comuna
    CONSTRAINT FK_dim_sucursales_comunas FOREIGN KEY (comuna_id) REFERENCES [dbo].[dim_comunas] (comuna_id)  -- Clave foránea referenciando a dim_comunas
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[dim_tiempo]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información temporal
CREATE TABLE [dbo].[dim_tiempo] (
    [fecha] DATE NOT NULL PRIMARY KEY,          -- Clave primaria para la fecha
    [año] INT NULL,                             -- Año
    [mes] INT NULL,                             -- Mes
    [dia] INT NULL,                             -- Día
    [dia_semana] VARCHAR(20) NULL,             -- Día de la semana
    [trimestre] INT NULL                        -- Trimestre
) ON [PRIMARY]
GO

/****** Objeto: Tabla [dbo].[ventas_hechos]    Fecha del script: 25-09-2024 14:53:16 ******/
-- Crear tabla para almacenar información de ventas
CREATE TABLE [dbo].[ventas_hechos] (
    [venta_id] INT NOT NULL PRIMARY KEY,       -- Clave primaria para el identificador de la venta
    [producto_id] INT NULL,                    -- Identificador del producto
    [cliente_id] INT NULL,                     -- Identificador del cliente
    [vendedor_id] INT NULL,                    -- Identificador del vendedor
    [sucursal_id] INT NULL,                    -- Identificador de la sucursal
    [fecha] DATE NULL,                         -- Fecha de la venta
    [tipo_documento] NVARCHAR(255) NOT NULL,  -- Tipo de documento
    [numero_documento] INT NOT NULL,          -- Número del documento
    [cantidad] INT NULL,                       -- Cantidad vendida
    [precio_unitario] DECIMAL(10, 2) NULL,    -- Precio unitario
    [descuento] DECIMAL(5, 2) NULL,            -- Descuento aplicado
    [monto_total] AS (([cantidad] * [precio_unitario]) * (1 - [descuento] / 100)),  -- Cálculo del monto total
    -- Claves foráneas referenciando las tablas correspondientes
    CONSTRAINT FK_ventas_hechos_clientes FOREIGN KEY (cliente_id) REFERENCES [dbo].[dim_clientes] (cliente_id),
    CONSTRAINT FK_ventas_hechos_empleados FOREIGN KEY (vendedor_id) REFERENCES [dbo].[dim_empleados] (empleado_id),
    CONSTRAINT FK_ventas_hechos_tiempo FOREIGN KEY (fecha) REFERENCES [dbo].[dim_tiempo] (fecha),
    CONSTRAINT FK_ventas_hechos_productos FOREIGN KEY (producto_id) REFERENCES [dbo].[dim_productos] (producto_id),
    CONSTRAINT FK_ventas_hechos_sucursales FOREIGN KEY (sucursal_id) REFERENCES [dbo].[dim_sucursales] (sucursal_id)
) ON [PRIMARY]
GO

-- Configuración de la base de datos
USE [master]
GO
ALTER DATABASE [Albarran_DW2] SET READ_WRITE  -- Establecer la base de datos como legible y escribible
GO
