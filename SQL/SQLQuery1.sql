SELECT * FROM Sales;


-- Overview
-- Total Revenue
SELECT ROUND(SUM(Profit) , 2) AS Total_Revenue FROM Sales;

-- Total Profit
SELECT ROUND(SUM(Sales) , 2) AS Total_Profit FROM Sales;

-- Total Customers
SELECT COUNT(DISTINCT(Customer_Name)) AS Total_Customers FROM Sales;

-- Total Quantities
SELECT ROUND(SUM(Quantity) , 2) AS Total_Quantities FROM Sales;


-- Revenue by City
SELECT 
	City , 
	ROUND(SUM(Sales) , 2) AS Total_Profit
FROM
	Sales
GROUP BY 
	City
ORDER BY 
	Total_Profit DESC;


-- Sales Over Time
SELECT
    YEAR(Order_Date) AS OrderYear,
    ROUND(SUM(Sales), 2) AS Total_Profit
FROM
    Sales
GROUP BY
    YEAR(Order_Date)
ORDER BY
	Total_Profit DESC;


-- Distribution of Categories
SELECT 
	Category ,
	COUNT(Category) AS Catyegory_Count
FROM
	Sales
GROUP BY
	Category
ORDER BY
	Catyegory_Count DESC;


-- Distribution of Ship Modes
SELECT
	Ship_Mode ,
	COUNT(Ship_Mode) AS ShipMode_Count
FROM
	Sales
GROUP BY
	Ship_Mode
ORDER BY
	ShipMode_Count DESC;


-- Sales & Profit Performance
-- Top Selling Product
SELECT TOP 1
	Product_Name ,
	ROUND(SUM(Sales) , 2) AS Total_Revenue
FROM
	Sales
GROUP BY
	Product_Name
ORDER BY
	Total_Revenue DESC;


-- Most Profitable Product
SELECT TOP 1
	Product_Name ,
	ROUND(SUM(Profit) , 2) AS Total_Profit
FROM
	Sales
GROUP BY
	Product_Name
ORDER BY
	Total_Profit DESC;


-- Most Profitable State
SELECT TOP 1
	[State] ,
	ROUND(SUM(Profit) , 2) AS Total_Profit
FROM
	Sales
GROUP BY
	[State]
ORDER BY
	Total_Profit DESC;


-- Discount AVG
SELECT ROUND(AVG(Discount) , 2) AS Discount_Avg FROM Sales;


-- Sub-Categories by Revenue
SELECT
	Sub_Category ,
	ROUND(SUM(Sales) , 2) AS Total_Revenue
FROM
	Sales
GROUP BY
	Sub_Category
ORDER BY
	Total_Revenue DESC;


-- Top 10 Products by Revenue
SELECT TOP 10
	Product_Name ,
	ROUND(SUM(Sales) , 2) AS Total_Revenue
FROM
	Sales
GROUP BY
	Product_Name
ORDER BY
	Total_Revenue DESC;


-- Top 10 Customers by Profit
SELECT TOP 10
	Customer_Name ,
	ROUND(SUM(Profit) , 2) AS Total_Profit
FROM
	Sales
GROUP BY
	Customer_Name
ORDER BY
	Total_Profit DESC;


-- Categories by Profit
SELECT TOP 10
	Category ,
	ROUND(SUM(Profit) , 2) AS Total_Profit
FROM
	Sales
GROUP BY
	Category
ORDER BY
	Total_Profit DESC;


-- Customer & Market Analysis
-- Most Active Segment
SELECT TOP 1
    Segment ,
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM
    Sales
GROUP BY
    Segment
ORDER BY
    Total_Revenue DESC;


-- AVG Sales Per Customer
SELECT
    ROUND(SUM(Sales) * 1.0 / COUNT(DISTINCT Customer_ID), 2) AS Avg_Sales_Per_Customer
FROM
    Sales;


-- Top Customer by Sales
SELECT TOP 1
	Customer_Name ,
	ROUND(SUM(Sales) , 2) AS Total_Sales
FROM
	Sales
GROUP BY
	Customer_Name
ORDER BY
	Total_Sales DESC;


-- Distribution of Customers by State
SELECT 
	[State] , 
	ROUND(SUM(Sales) , 2) AS Total_Profit
FROM
	Sales
GROUP BY 
	[State]
ORDER BY 
	Total_Profit DESC;



-- Distribution of Segments
SELECT
	Segment ,
	COUNT(Ship_Mode) AS Segment_Count
FROM
	Sales
GROUP BY
	Segment
ORDER BY
	Segment_Count DESC;


-- Orders Over Time
SELECT
    YEAR(Order_Date) AS OrderYear,
    COUNT(Order_ID) AS Orders_Count
FROM
    Sales
GROUP BY
    YEAR(Order_Date)
ORDER BY
	Orders_Count DESC;


-- Best Selling Category Per Each Region
SELECT
    Region,
    ISNULL([Furniture], 0) AS Furniture,
    ISNULL([Office Supplies], 0) AS Office_Supplies,
    ISNULL([Technology], 0) AS Technology
FROM (
    SELECT
        Region,
        Category,
        ROUND(SUM(Sales), 2) AS Total_Sales
    FROM
        Sales
    GROUP BY
        Region, Category
) AS SourceTable
PIVOT (
    SUM(Total_Sales)
    FOR Category IN ([Furniture], [Office Supplies], [Technology])
) AS PivotTable
ORDER BY
    Region;