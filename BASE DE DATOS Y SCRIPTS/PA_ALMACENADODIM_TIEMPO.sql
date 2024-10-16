USE [Albarran]
GO

/****** Object:  StoredProcedure [dbo].[GenerateTimeData]    Script Date: 26-09-2024 16:30:35 ******/
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


