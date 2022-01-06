-- 1) From the items_ordered table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.

SELECT customerid, item, price FROM items_ordered
WHERE customerid = 10449;

-- 2) Select all columns from the items_ordered table for whoever purchased a Tent.

SELECT * FROM items_ordered
WHERE item = 'tent';   

  -- 3) Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter “S”.

SELECT customerid, order_date, item
FROM items_ordered
WHERE item LIKE 'S%';

--    4) Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.

SELECT distinct item
FROM items_ordered;             

-- 5) Make up your own select statements and submit them.
select * from items_ordered;

-- 6) Select the maximum price of any item ordered in the items_ordered table. Hint:
--      Select the maximum price only.
select max(price) from items_ordered;

-- 7) Select the average price of all of the items ordered that were purchased in the month of Dec.
select avg(price) from items_ordered where order_date='24-dec-1999' and '30-dec-1999';

-- 8) What are the total number of rows in the items_ordered table?
select count(rownum)
from items_ordered;

 9. For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? 
# Hint: Your query should return the price only.
select min(price) from items_ordered where item = 'Tent';

# 10. How many people are in each unique state in the customers table? Select the state and display the number of people in each. 
# Hint: count is used to count rows in a column, sum works on numeric data only.
select state, count(*) number_of_people from customers group by state;

# 11. From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. 
# Hint: The items will need to be broken up into separate groups. 
select item, max(price), min(price) from items_ordered group by item;

# 12. How many orders did each customer make? Use the items_ordered table.
# Select the customerid, number of orders they made, and the sum of their orders. Click the Group By answers link below if you have any problems.
select customerid, count(*) number_of_orders, sum(price) from items_ordered group by customerid;

# 13. How many people are in each unique state in the customers table that have more than one person in the state? 
# Select the state and display the number of how many people are in each if it's greater than 1.
select state, number_of_people from ( 
	select state, count(*) number_of_people from customers group by state
) as customers_grouped_by_state where number_of_people > 1;

# 14. From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. 
# Only display the results if the maximum price for one of the items is greater than 190.00.
select item, max_price, min_price from ( 
	select item, max(price) max_price, min(price) min_price from items_ordered group by item
) as orders_grouped_by_item where max_price > 190;

# 15. How many orders did each customer make? Use the items_ordered table.
# Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item.
select customerid, number_of_orders, sum_of_orders from ( 
	select customerid, count(*) number_of_orders, sum(price) sum_of_orders from items_ordered group by customerid
) as orders_grouped_by_customer where number_of_orders > 1;

# 16. Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.
select lastname, firstname, city from customers order by lastname;

# 17. Same thing as exercise #1, but display the results in Descending order.
select customerid, item, price from items_ordered where customerid = 10449 order by item desc;

# 18. Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. 
# Display the results in Ascending order based on the price.
select item, price from items_ordered where price > 10 order by price;

# 19. Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. 
# Display the rows as long as they are not either of these two items.
select customerid, order_date, item from items_ordered where item not in ('Snow Shoes', 'Ear Muffs');

# 20. Select the item and price of all items that start with the letters 'S', 'P', or 'F'.
select item, price from items_ordered where item like 'S%' or 
    item like 'P%' or item like 'F%';
# 21. Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.
select order_date, item, price from items_ordered where price between 10 and 80;

# 22. Select the firstname, city, and state from the customers table for all of the rows where the state value is either: 
# Arizona, Washington, Oklahoma, Colorado, or Hawaii.
select firstname, city, state from customers where state in ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');

# 23. Select the item and per unit price for each item in the items_ordered table. Hint: Divide the price by the quantity.
select item, (price / quantity) unit_price from items_ordered;

# 24. Write a query using a join to determine which items were ordered by each of the customers in the customers table. 
# Select the customerid, firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table.
select customers.customerid, customers.firstname, customers.lastname, 
	items_ordered.order_date, items_ordered.item, items_ordered.price 
from customers join items_ordered where customers.customerid = items_ordered.customerid;

# 25. Repeat exercise #1, however display the results sorted by item in descending order.
select customerid, item, price from items_ordered where customerid = 10449 order by item desc;