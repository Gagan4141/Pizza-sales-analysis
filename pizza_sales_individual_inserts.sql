/* kpi*/
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_sales;
SELECT SUM(quantity) AS total_pizza_orders FROM pizza_sales;
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizza_per_order FROM pizza_sales;
/* Daily trend for total order bar chart */
SELECT  dayname(order_date) Day , COUNT(DISTINCT order_id) Total_orders
FROM pizza_sales
GROUP BY dayname(order_date);
/* Hourly Trend for Total Orders*/
SELECT HOUR(order_time) AS order_hour, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;
/* Percentage of Sales by Category*/
SELECT pizza_category, 
	
       (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_category
ORDER BY sales_percentage DESC;
/*Percentage of Sales by Pizza Size*/
SELECT pizza_size, 
   
       (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY sales_percentage DESC;
/* Total Pizzas Sold by Pizza Category*/
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;
/* Top 5 Best Sellers by Total Pizzas Sold*/
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC
LIMIT 5;
/* Bottom 5 Worst Sellers by Total Pizzas Sold*/
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold ASC
LIMIT 5;





