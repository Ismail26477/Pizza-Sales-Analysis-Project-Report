--------PIZZA SALES SQL QUERIES---------
-------A. KPI’s---------
-------1.Total Revenue------
SELECT * FROM pizza_sales;
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-------2.Average Order Value
SELECT * FROM pizza_sales;
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

------3.Total Pizzas Sold
SELECT * FROM pizza_sales; 
SELECT SUM(quantity) AS Total_Quantity_Sold FROM pizza_sales;

------4. Total Orders
SELECT * FROM pizza_sales;
SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales;

------5.Average Pizzas Per Order
 SELECT * FROM pizza_sales;
SELECT 
CAST(CAST(SUM(quantity)  AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Average_Pizzas_Per_Order FROM pizza_sales;  
---------------------------------------------------------------------
------B.Daily Trend for Total Orders 
SELECT * FROM pizza_sales;
SELECT dayofweek( order_date) AS order_day, COUNT(DISTINCT order_id) AS total_order 
FROM pizza_sales
GROUP BY dayofweek( order_date);
---------------------------------------------------------------------
------C. Monthly Trend for Orders
SELECT * FROM pizza_sales;
SELECT monthname( order_date) AS order_month, COUNT(DISTINCT order_id) AS total_order 
FROM pizza_sales
GROUP BY monthname( order_date)
ORDER BY total_order DESC ;
---------------------------------------------------------------------
------D. % of Sales by Pizza Category
SELECT * FROM pizza_sales;
SELECT pizza_category,CAST(SUM( total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM( total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)) AS PTC
FROM pizza_sales
GROUP BY pizza_category;
-------MONTH--------
SELECT pizza_category,CAST(SUM( total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM( total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 12 ) AS DECIMAL(10,2)) AS PTC
FROM pizza_sales
WHERE MONTH(order_date) = 12
GROUP BY pizza_category;
--------WEEK--------
SELECT pizza_category,CAST(SUM( total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM( total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)) AS PTC
FROM pizza_sales
WHERE weekday(order_date) = 1
GROUP BY pizza_category;
----------------------------------------------------------------------
------E.% of Sales by Pizza Size
SELECT * FROM pizza_sales;
SELECT pizza_size,CAST(SUM( total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM( total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)) AS PTC
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PTC DESC; 
------------------------------------------------------------------
------F. Total Pizzas Sold by Pizza Category
SELECT * FROM pizza_sales;
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold 
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
-----------------------------------------------------------
------G. Top 5 Pizzas by Revenue
------Top 5 Pizzas by Revenue
SELECT * FROM pizza_sales;
SELECT pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;
------Bottom 5 Pizzas by Revenue
SELECT pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;
------Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC LIMIT 5;
-------- Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC LIMIT 5;
------ Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC LIMIT 5;
------. Borrom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC LIMIT 5;

