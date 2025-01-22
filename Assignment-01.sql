-- Create the following tables:
-- Table: client_master
CREATE TABLE client_master (
    client_no varchar(6),
    name varchar(20),
    address1 varchar(30),
    address2 varchar(30),
    city varchar(15),
    state varchar(15),
    pincode numeric(6),
    bal_due DECIMAL(10,2)
)

-- Table: product_master
CREATE TABLE product_master(
    Product_no varchar(10),
    Description varchar(50),
    Profit_percent decimal(10,2),
    Unit_measure varchar(10),
    Qty_on_hand numeric,
    Reoder_lvl numeric,
    Sell_price numeric,
    Cost_price numeric
)

-- Insert the following data into their respective tables:
-- Table: client_master
INSERT INTO client_master (client_no, name, city, pincode, state, bal_due) 
VALUES
('0001', 'Ivan', 'Bombay', 400054, 'Maharashtra', 15000),
('0002', 'Vandana', 'Madras', 780001, 'Tamilnadu', 0),
('0003', 'Pramada', 'Bombay', 400057, 'Maharashtra', 5000),
('0004', 'Basu', 'Bombay', 400056, 'Maharashtra', 0),
('0005', 'Ravi', 'Delhi', 100001, NULL, 2000),
('0006', 'Rukmini', 'Bombay', 400050, 'Maharashtra', 0)

-- Table: product_master
INSERT INTO product_master(Product_no, Description, Profit_percent, Unit_measure, Qty_on_hand, Reoder_lvl, Sell_price, Cost_price)
VALUES
('P00001', '1.44floppies', 5, 'piece', 100, 20, 525, 500),
('P03453', 'Monitors', 6, 'piece', 10, 3, 12000, 11200),
('P06734', 'Mouse', 5, 'piece', 20, 5, 1050, 500),
('P07865', '1.22 floppies', 5, 'piece', 100, 20, 525, 500),
('P07868', 'Keyboards', 2, 'piece', 10, 3, 3150, 3050),
('P07885', 'CD Drive', 2.5, 'piece', 10, 3, 5250, 5100),
('P
07965', '540 HDD', 4, 'piece', 10, 3, 8400, 8000),
('P07975', '1.44 Drive', 5, 'piece', 10, 3, 1050, 1000),
('P08865', '1.22 Drive', 5, 'piece', 2, 3, 1050, 1000)

-- On the basis of above two tables answer the following questionries:
-- 1. Find out the name of all the clients.
SELECT name FROM client_master

-- 2. Retrieve the list of names and cities of all the clients.
SELECT name, city FROM client_master

-- 3. List the various products available from the product_master table.
SELECT Description as Product_name FROM product_master

-- 4. List all the clients who are located in Bombay.
SELECT name FROM client_master WHERE city='Bombay'

-- 5. Display the information for client no 0001 and 0002.
SELECT * FROM client_master WHERE client_no='0001' OR client_no='0002'

-- 6. Find the products with description as ‘1.44 drive’ and ‘1.22 Drive’.
SELECT * from product_master WHERE Description='1.44 drive' or Description='1.22 drive'

-- 7. Find all the products whose sell price is greater then 5000.
SELECT * FROM product_master WHERE Sell_price>5000

-- 8. Find the list of all clients who stay in in city ‘Bombay’ or city ‘Delhi’ or ‘Madras’.
SELECT * FROM client_master WHERE city='Bombay' OR city='Delhi' OR city='Madras'

-- 9. Find the product whose selling price is greater than 2000 and less than or equal to 5000.
SELECT * FROM product_master WHERE Sell_price > 2000 AND Sell_price <= 5000

-- 10. List the name, city and state of clients not in the state of ‘Maharashtra’.
SELECT name, city, state FROM client_master WHERE state!='Maharashtra'