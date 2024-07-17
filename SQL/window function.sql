-- 1. Cumulative Sales Amount Over Time
--To calculate the cumulative total sales amount over time

SELECT 
    [Transaction Date],
    [Total Amount],
    SUM([Total Amount]) OVER (ORDER BY [Transaction Date]) AS CumulativeSales
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
ORDER BY [Transaction Date];


-- 2. Running Total of Quantity Ordered by Year
-- To calculate the running total of quantity ordered within each year
SELECT 
    [Transaction Year],
    [Transaction Date],
    [Quantity Ordered],
    SUM([Quantity Ordered]) OVER (PARTITION BY [Transaction Year] ORDER BY [Transaction Date]) AS RunningTotalQuantity
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
ORDER BY [Transaction Year], [Transaction Date];


-- 3 Average Unit Price Per Product with Overall Average
-- To calculate the average unit price per product and the overall average unit price:

SELECT 
    [Product Name],
    [Unit Price],
    AVG([Unit Price]) OVER (PARTITION BY [Product Name]) AS AvgUnitPricePerProduct,
    AVG([Unit Price]) OVER () AS OverallAvgUnitPrice
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
ORDER BY [Product Name];

-- 4. Percentage of Total Sales by Customer
-- To calculate each customer's percentage contribution to the total sales:
SELECT 
    [Customer Name],
    [Total Amount],
    SUM([Total Amount]) OVER (PARTITION BY [Customer Name]) AS TotalSalesPerCustomer,
    (SUM([Total Amount]) OVER (PARTITION BY [Customer Name]) * 100.0 / SUM([Total Amount]) OVER ()) AS PercentageOfTotalSales
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
ORDER BY PercentageOfTotalSales DESC;

-- 5. Rank Customers by Total Purchase Amount
-- To rank customers based on the total amount they spent:
SELECT 
    [Customer Name],
    SUM([Total Amount]) AS TotalPurchaseAmount,
    RANK() OVER (ORDER BY SUM([Total Amount]) DESC) AS CustomerRank
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Customer Name]
ORDER BY CustomerRank;


-- 6. Year-over-Year Sales Growth
-- To calculate the year-over-year sales growth:
SELECT 
    [Transaction Year],
    SUM([Total Amount]) AS YearlySales,
    LAG(SUM([Total Amount])) OVER (ORDER BY [Transaction Year]) AS PreviousYearSales,
    (SUM([Total Amount]) - LAG(SUM([Total Amount])) OVER (ORDER BY [Transaction Year])) * 100.0 / LAG(SUM([Total Amount])) OVER (ORDER BY [Transaction Year]) AS YoYGrowth
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Transaction Year]
ORDER BY [Transaction Year];


-- 7. Identify Top 5 Products by Sales Amount
-- To find the top 5 products based on total sales amount:
SELECT 
    [Product Name],
    SUM([Total Amount]) AS TotalSalesAmount,
    RANK() OVER (ORDER BY SUM([Total Amount]) DESC) AS ProductRank
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY [Product Name]
HAVING RANK() OVER (ORDER BY SUM([Total Amount]) DESC) <= 5
ORDER BY ProductRank;


-- 8. Monthly Sales Amount and Moving Average
-- To calculate the monthly sales amount and a 3-month moving average:
SELECT 
    YEAR([Transaction Date]) AS Year,
    MONTH([Transaction Date]) AS Month,
    SUM([Total Amount]) AS MonthlySales,
    AVG(SUM([Total Amount])) OVER (ORDER BY YEAR([Transaction Date]), MONTH([Transaction Date]) ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvgSales
FROM [Kaptagat Springs Sales Data].[dbo].['Kaptagat Springs Sales Insights$']
GROUP BY YEAR([Transaction Date]), MONTH([Transaction Date])
ORDER BY Year, Month;
