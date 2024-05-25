create database pizza;
use pizza;

select * from pizza_sales;

--Total Revenue: The sum of the total price of all pizza orders ?--
select round(sum(total_price),2) as total_revenue from pizza_sales

--Average Order Value: The average amount spent per order, calculated by dividing--
dividing the total number of pizzas sold by the total number of orders--
FROM pizza_sales
GROUP BY pizza_category;
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
LIMIT 5;
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity
LIMIT 5;
SELECT pizza_name, COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
LIMIT 5
select * from pizza_sales;