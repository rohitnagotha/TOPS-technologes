create database pizza;
use pizza;

select * from pizza_sales;

--Total Revenue: The sum of the total price of all pizza orders ?--
select round(sum(total_price),2) as total_revenue from pizza_sales

--Average Order Value: The average amount spent per order, calculated by dividing--select round (sum(total_price)/count(order_id),2) as average_order_value from pizza_sales; --Total Pizzas Sold: The sum of the quantities of all pizza sold.-- select sum(quantity)as total_pizza_sold from pizza_sales; -- Total Orders: The total number of orders placed.-- select count(order_id) as total_order from pizza_sales; --Average Pizza Per Order: The average number of pizzas sold per order, calculated by
dividing the total number of pizzas sold by the total number of orders--select round(sum(quantity)/count(distinct order_id),2) as average_pizza_order from pizza_sales;--Daily trend for total Orders--select order_date,sum(total_price) from pizza_salesgroup by order_date;--Monthly Trend for Total Orders--select extract(month from order_date)sum(total_price),month from pizza_salesgroup by month-- peak hours or periods of high order activity--select extract(hour from order_time) as hour_of_day count(order_id) as total_orderfrom pizza_salesgroup by extract(hour from order_time)--Percentage of Sales by Pizza Category--SELECT pizza_category, SUM(total_price) AS category_sales
FROM pizza_sales
GROUP BY pizza_category; --Percentage of Sales by Pizza Size--
select pizza_size, sum(total_price) as pizza_size from pizza_sales
group by pizza_size;

--Total Pizza Sold by Pizza Category--
SELECT pizza_category, SUM(quantity) AS pizzas_sold
FROM pizza_sales
GROUP BY pizza_category

# size wise
SELECT pizza_size, SUM(quantity) AS pizzas_sold
FROM pizza_sales
GROUP BY pizza_size;
--Top 5 Best Sellers by Revenue, Total Quantity and Total Orders--
--Revenue--
select pizza_name as pizza_name,round(sum(total_price),2) as revenue from pizza_sales
group by pizza_name 
order by revenue desc
limit 5;

--Total Quantity--

select pizza_name as pizza_name sum(quantity) as total_qty from pizza_sales
group by pizza_name
order by total_qty desc
limit 5;

--Total Orders--
select pizza_name, count(order_id) as total_order from pizza_sales
group by pizza_name
order by total_order desc
limit 5;

Top 5 Best Sellers by Revenue

SELECT pizza_name AS pizza_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue
LIMIT 5;-- Total Quantity--SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity
LIMIT 5;--Total Orders--
SELECT pizza_name, COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_nameORDER BY total_orders
LIMIT 5
select * from pizza_sales;