SELECT *
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
LIMIT 10;

SELECT
    COUNT(*) AS Total_Records
FROM `retail-sales-analysis-514009.retail_analysis.superstore`;


SELECT
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    COUNT(DISTINCT `Product ID`) AS Unique_Products
FROM `retail-sales-analysis-514009.retail_analysis.superstore`;


SELECT
    COUNTIF(`Order ID` IS NULL) AS Missing_Order_ID,
    COUNTIF(`Customer ID` IS NULL) AS Missing_Customer_ID,
    COUNTIF(Sales IS NULL) AS Missing_Sales,
    COUNTIF(Profit IS NULL) AS Missing_Profit,
    COUNTIF(`Product Name` IS NULL) AS Missing_Product_Name
FROM `retail-sales-analysis-514009.retail_analysis.superstore`;


SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    ROUND(SAFE_DIVIDE(SUM(Profit), SUM(Sales)) * 100, 2)
        AS Profit_Margin_Percentage
FROM `retail-sales-analysis-514009.retail_analysis.superstore`;

SELECT
    ROUND(
        SUM(Sales) / COUNT(DISTINCT `Order ID`), 2
    ) AS Average_Order_Value
FROM `retail-sales-analysis-514009.retail_analysis.superstore`;


SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;


SELECT
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 15;


SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;


SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 15;


SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Spending,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Customer ID`, `Customer Name`
ORDER BY Total_Spending DESC
LIMIT 10;


SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Segment
ORDER BY Total_Sales DESC;




SELECT
    `Customer ID`,
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS Purchase_Frequency,
    ROUND(SUM(Sales), 2) AS Total_Spending
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Customer ID`, `Customer Name`
ORDER BY Purchase_Frequency DESC
LIMIT 15;


SELECT
    Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Year
ORDER BY Year;



SELECT
    Year_Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Year_Month
ORDER BY Year_Month;


SELECT
    Month_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Month, Month_Name
ORDER BY Total_Sales DESC;


SELECT
    Discount,
    ROUND(AVG(Sales), 2) AS Average_Sales,
    ROUND(AVG(Profit), 2) AS Average_Profit,
    COUNT(*) AS Total_Records
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY Discount
ORDER BY Discount;


SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(AVG(Shipping_Days), 2) AS Average_Shipping_Days,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;


SELECT
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    CASE
        WHEN SUM(Profit) > 0 THEN 'Profitable'
        WHEN SUM(Profit) < 0 THEN 'Loss Making'
        ELSE 'Break Even'
    END AS Profit_Status
FROM `retail-sales-analysis-514009.retail_analysis.superstore`
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


WITH Region_Sales AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM `retail-sales-analysis-514009.retail_analysis.superstore`
    GROUP BY Region
)
SELECT
    Region,
    ROUND(Total_Sales, 2) AS Total_Sales
FROM Region_Sales
ORDER BY Total_Sales DESC
LIMIT 5;


WITH Product_Sales AS (
    SELECT
        Category,
        `Product Name`,
        SUM(Sales) AS Total_Sales
    FROM `retail-sales-analysis-514009.retail_analysis.superstore`
    GROUP BY Category, `Product Name`
)
SELECT
    Category,
    `Product Name`,
    ROUND(Total_Sales, 2) AS Total_Sales,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY Total_Sales DESC
    ) AS Product_Rank
FROM Product_Sales
QUALIFY Product_Rank <= 5
ORDER BY Category, Product_Rank;


WITH Monthly_Sales AS (
    SELECT
        Year_Month,
        SUM(Sales) AS Total_Sales
    FROM `retail-sales-analysis-514009.retail_analysis.superstore`
    GROUP BY Year_Month
)
SELECT
    Year_Month,
    ROUND(Total_Sales, 2) AS Monthly_Sales,
    ROUND(
        SUM(Total_Sales) OVER (
            ORDER BY Year_Month
        ), 2
    ) AS Cumulative_Sales
FROM Monthly_Sales
ORDER BY Year_Month;