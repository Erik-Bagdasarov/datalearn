-- Total sales, total_profit, profit_ratio, profit_per_order, sales_per_customer:
select
    sum(sales) as total_sales
,   sum(profit) as total_profit
,   sum(sales) - sum(profit) as profit_ratio
,   sum(profit) / count(distinct order_id) as profit_per_order
,   sum(sales) / count(distinct customer_id) as sale_per_customer
from orders;

-- Avg. Discount
select
    avg(discount)
from orders;

-- Monthly Sales by Segment
select
    extract(month from order_date) as month
,   segment
,   sum(sales)
from orders
group by 1,2;

-- Monthly Sales by Product Category
select
    extract(month from order_date) as month
,   category
,   sum(sales)
from orders
group by 1,2;

--

-- Sales and Profit by Customer
select
    customer_id
,   customer_name
,   sum(sales)
,   sum(profit)
from orders
group by 1,2;

-- Customer Ranking
select
    customer_id
,   rank() over(order by sales desc)
,   sales
from orders;

-- Sales per region
select
    region
,   sum(sales)
from orders
group by 1;