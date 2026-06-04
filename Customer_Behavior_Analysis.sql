create database dap1;
use dap1;
select * from mytable;
#1.List all unique product categories in the dataset.

SELECT  distinct category FROM mytable;

#2.Find all customers from Kentucky who made a purchase above $80.
SELECT customer_id, age, gender, item_purchased,
       purchase_amount
FROM mytable
WHERE location = 'Kentucky'
  AND purchase_amount > 80
ORDER BY purchase_amount DESC;

#3.Count the total number of male vs female customers.
SELECT gender,
       COUNT(*) AS total_customers
FROM mytable
GROUP BY gender
ORDER BY total_customers DESC;

#4.Retrieve all purchases made during Winter, sorted by purchase amount descending.
select customer_id,item_purchased, category, purchase_amount,location from mytable
where season='winter'
order by purchase_amount desc;

#5.Find customers who used a promo code AND had a discount applied.
select customer_id, item_purchased,
       purchase_amount, discount_applied from mytable 
where discount_applied='yes';

#6.What is the average purchase amount by category?
SELECT category,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase
FROM mytable
GROUP BY category
ORDER BY avg_purchase DESC;

#7.Find the top 5 states (locations) by total revenue generated.
SELECT location,
       SUM(purchase_amount) AS total_revenue
FROM mytable
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 5;
#8.Which payment method is most commonly used by subscribed customers?
SELECT payment_method,
       COUNT(*) AS usage_count
FROM mytable
WHERE subscription_status = 'Yes'
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 5;
#9.Calculate the average review rating per season. Which season gets the best ratings?
SELECT season,
       ROUND(AVG(review_rating), 3) AS avg_rating
FROM mytable
GROUP BY season
ORDER BY avg_rating DESC;
#10.Find customers whose review rating is below 3.0 but made more than 10 previous purchases.
SELECT customer_id, review_rating,
       previous_purchases, item_purchased, category
FROM mytable
WHERE review_rating < 3.0
  AND previous_purchases > 10
ORDER BY previous_purchases DESC;

#11.List the top 3 most purchased items in the Footwear category.
SELECT item_purchased,
       COUNT(*) AS purchase_count
FROM mytable
WHERE category = 'Footwear'
GROUP BY item_purchased
ORDER BY purchase_count DESC
LIMIT 3;

# what is the revenue contribution of each age group
select aged_group,sum(purchase_amount) as total_revenue from mytable
group by aged_group 
order by total_revenue desc;


