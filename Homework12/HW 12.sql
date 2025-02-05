DECLARE @todate DATETIME, @fromdate DATETIME  
SET @fromdate = '2025-01-01'  
SET @todate = '2025-12-31'  

;WITH DateSequence([Date]) AS  
(  
    SELECT @fromdate  
    UNION ALL  
    SELECT DATEADD(DAY, 1, [Date])  
    FROM DateSequence  
    WHERE [Date] < @todate  
)  

SELECT  
    CONVERT(VARCHAR(8), [Date], 112) AS ID,  
    [Date],  
    DAY([Date]) AS Day,  
    FORMAT([Date], 'd') +  
        CASE DAY([Date])  
            WHEN 1  THEN 'st' WHEN 21 THEN 'st' WHEN 31 THEN 'st'  
            WHEN 2  THEN 'nd' WHEN 22 THEN 'nd'  
            WHEN 3  THEN 'rd' WHEN 23 THEN 'rd'  
            ELSE 'th'  
        END AS DaySuffix,  
    DATENAME(WEEKDAY, [Date]) AS DayOfWeek,  
    DATEPART(DAYOFYEAR, [Date]) AS DayOfYear,  
    DATEPART(WEEK, [Date]) AS WeekOfYear,  
    DATEPART(WEEK, [Date]) - DATEPART(WEEK, DATEADD(DAY, -DAY([Date]) + 1, [Date])) + 1 AS WeekOfMonth,  
    MONTH([Date]) AS Month,  
    DATENAME(MONTH, [Date]) AS MonthName,  
    DATEPART(QUARTER, [Date]) AS Quarter,  
    DATENAME(QUARTER, [Date]) AS QuarterName,  
    YEAR([Date]) AS Year  
FROM DateSequence  
OPTION (MAXRECURSION 366);  
