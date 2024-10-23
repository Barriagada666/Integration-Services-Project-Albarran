
![Logo](https://i.imgur.com/ntON9y1.png)
# Integration Services Project Albarran

Este repositorio contiene la solución SSIS, la base de datos relacional, la base de datos dimensional, scripts de creación de procedimientos almacenados y otros elementos utilizados en el proyecto de Inteligencia de Negocios para la Mueblería Albarrán.

## Descripción del Proyecto

Este proyecto tiene como objetivo diseñar e implementar un sistema de inteligencia de negocios (BI) para la Mueblería Albarrán, utilizando un modelo dimensional. El objetivo es transformar los datos de la empresa en información útil para la toma de decisiones.

## Componentes del Repositorio

* **Solución SSIS:** Contiene los paquetes SSIS desarrollados para la extracción, transformación y carga (ETL) de datos desde la base de datos relacional a la base de datos dimensional.
* **Base de Datos Relacional:** Contiene la estructura de la base de datos relacional con datos sobre clientes, empleados, ventas y productos de la Mueblería Albarrán.
* **Base de Datos Dimensional:** Contiene la estructura de la base de datos dimensional, incluyendo las dimensiones y la tabla de hechos, diseñada según la metodología de Kimball.
* **Scripts de Procedimientos Almacenados:** Incluye scripts para la creación de procedimientos almacenados utilizados en el proceso de ETL.
* **Otros Scrpt´s de Elementos a ocupar:** Puede contener otros archivos relevantes para el proyecto, como documentación, diagramas, etc.

## Metodología

Se siguió la metodología de Kimball para el diseño del modelo dimensional, que consiste en los siguientes pasos:

1. **Elegir el proceso de negocio:** Se seleccionó el proceso de seguimiento de ventas.
2. **Establecer el nivel de granularidad:** Se definió el nivel de transacción individual.
3. **Elegir las dimensiones:** Se establecieron las dimensiones Cliente, Producto, Sucursal y Tiempo.
4. **Identificar medidas o métricas y la tabla de hechos:** Se creó la tabla de hechos "Ventas".

## Modelo Dimensional

El modelo dimensional incluye las siguientes dimensiones:

* Cargos
* Categorías
* Cliente
* Comunas
* Empleados
* Productos
* Sucursales
* Tiempo

Y la tabla de hechos:

* Venta

## Herramientas Utilizadas

* SQL Server
* SQL Server Integration Services (SSIS)

## Instrucciones de Uso

1. Clonar el repositorio.
2. Restaurar las bases de datos relacional y dimensional en SQL Server.
3. Ejecutar los paquetes SSIS para cargar los datos en la base de datos dimensional.
4. Utilizar herramientas de BI para analizar los datos en la base de datos dimensional.


## - Autores

- [@Franco_Reyes](https://github.com/frankiwi6x6)
- [@Ivan_Diaz](https://github.com/)
- [@Boris_Arriagada](https://www.github.com/barriagada666)

