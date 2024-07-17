--1. Preview the Data --
SELECT TOP (1000) [Order Number]
      ,[Quantity Ordered]
      ,[Unit Price]
      ,[Total Amount]
      ,[Transaction Date]
      ,[Shipping Status]
      ,[Transaction Year]
      ,[Product Name]
      ,[MSRP]
      ,[Product Code]
      ,[Customer Name]
  FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']



  SELECT TOP (10) 
    [Order Number],
    [Quantity Ordered],
    [Unit Price],
    [Total Amount],
    [Transaction Date],
    [Shipping Status],
    [Transaction Year],
    [Product Name],
    [MSRP],
    [Product Code],
    [Customer Name]
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$'];
SELECT 
    COUNT(*) AS TotalOrders,
    MIN([Quantity Ordered]) AS MinQuantityOrdered,
    MAX([Quantity Ordered]) AS MaxQuantityOrdered,
    AVG([Quantity Ordered]) AS AvgQuantityOrdered,
    STDEV([Quantity Ordered]) AS StdDevQuantityOrdered,
    MIN([Unit Price]) AS MinUnitPrice,
    MAX([Unit Price]) AS MaxUnitPrice,
    AVG([Unit Price]) AS AvgUnitPrice,
    STDEV([Unit Price]) AS StdDevUnitPrice,
    MIN([Total Amount]) AS MinTotalAmount,
    MAX([Total Amount]) AS MaxTotalAmount,
    AVG([Total Amount]) AS AvgTotalAmount,
    STDEV([Total Amount]) AS StdDevTotalAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$'];

SELECT 
    [Transaction Year],
    COUNT(*) AS OrdersCount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Transaction Year]
ORDER BY [Transaction Year];

SELECT 
    [Transaction Year],
    SUM([Total Amount]) AS TotalSalesAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Transaction Year]
ORDER BY [Transaction Year];

SELECT 
    [Product Name],
    AVG([Unit Price]) AS AvgUnitPrice
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Product Name]
ORDER BY AvgUnitPrice DESC;



SELECT 
    [Shipping Status],
    COUNT(*) AS StatusCount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Shipping Status]
ORDER BY StatusCount DESC;



SELECT TOP (10)
    [Customer Name],
    SUM([Total Amount]) AS TotalPurchaseAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Customer Name]
ORDER BY TotalPurchaseAmount DESC;



SELECT 
    [Product Name],
    SUM([Quantity Ordered]) AS TotalQuantitySold,
    SUM([Total Amount]) AS TotalSalesAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Product Name]
ORDER BY TotalSalesAmount DESC;



SELECT 
    YEAR([Transaction Date]) AS Year,
    MONTH([Transaction Date]) AS Month,
    SUM([Total Amount]) AS TotalSalesAmount
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY YEAR([Transaction Date]), MONTH([Transaction Date])
ORDER BY Year, Month;
