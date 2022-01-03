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
select avg(price) from items_ordered where order_date='22-dec-1999' and '30-dec-1999';

-- 8) What are the total number of rows in the items_ordered table?
select count(rownum)
from items_ordered;