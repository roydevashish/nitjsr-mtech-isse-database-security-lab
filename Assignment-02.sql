SELECT * FROM product_master
SELECT * FROM client_master

-- Using the table client master and product master answer the following questionnaires.
-- 1. Change the selling price of 1.44 floppy drive to Rs.1150.00
UPDATE product_master SET Sell_price = 1150.00 WHERE Product_no = 'P00001'

-- 2. Delete the record with client 0001 from the client master table.
DELETE FROM client_master WHERE client_no = 0001

-- 3. Change the city of client_no ’0005’ to Bombay.
UPDATE client_master SET city='Bombay' WHERE client_no=0005

-- 4. Change the bal_due of client_no ‘0001, to 1000.
-- SQL query will not affect the DB as the record with client_no 0001 doesn't exist.
UPDATE client_master SET bal_due=1000 WHERE client_no=0001

-- 5. Find the products whose selling price is more than 1500 and also find the new selling price as original selling price *15.
SELECT *, Sell_price*15 as new_selling_price FROM product_master WHERE Sell_price>1500 

-- 6. Find out the clients who stay in a city whose second letter is a.
SELECT * FROM client_master WHERE city LIKE '_a%'

-- 7. Find out the name of all clients having ‘a’ as the second letter in their names.
SELECT name FROM client_master WHERE name LIKE '_a%'

-- 8. List the products in sorted order of their description.
SELECT * FROM product_master ORDER BY Description ASC

-- 9. Count the total number of orders
-- Table have no attribute with name orders, need more details about the query.

-- 10. Calculate the average price of all the products.
SELECT AVG(Cost_price) as avg_cost_price, AVG(Sell_price) as avg_sell_price FROM product_master

-- 11. Calculate the minimum price of products.
SELECT MIN(Cost_price) as min_cost_price, MIN(Sell_price) as min_sell_price FROM product_master

-- 12. Determine the maximum and minimum prices . Rename the tittle as ‘max_price’ and min_price respectively.
SELECT MAX(Sell_price) as max_price, MIN(Sell_price) as min_price FROM product_master

-- 13. Count the number of products having price greater than or equal to 1500.
SELECT COUNT(*) FROM product_master WHERE Sell_price>=1500