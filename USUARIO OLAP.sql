USE [master]
GO

/****** Object:  Login [NT SERVICE\MSSQLServerOLAPService]    Script Date: 14/11/2024 19:59:42 ******/
DROP LOGIN [NT SERVICE\MSSQLServerOLAPService]
GO

/****** Object:  Login [NT SERVICE\MSSQLServerOLAPService]    Script Date: 14/11/2024 19:59:42 ******/
CREATE LOGIN [NT SERVICE\MSSQLServerOLAPService] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Espa�ol]
GO

