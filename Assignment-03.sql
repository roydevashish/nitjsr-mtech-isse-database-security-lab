-- Create the following tables:
-- Table: Sales_master
CREATE TABLE Sales_master(
    Salesman_no varchar(6) PRIMARY KEY, CHECK(Salesman_no LIKE 'S%'),
    Sal_name varchar(20) NOT NULL,
    Address varchar(50) NOT NULL,
    City varchar(20),
    State varchar(20),
    Pincode NUMERIC(6),
    Sal_amt NUMERIC(8,2) NOT NULL, CHECK(Sal_amt > 0),
    Tgt_to_get NUMERIC(6,2) NOT NULL, CHECK(Tgt_to_get > 0),
    Ytd_sales NUMERIC(6,2) NOT NULL, CHECK(Ytd_sales > 0),
    Remarks Varchar(30)
)

-- Table: Sales_order
-- Alter the table client_master to set the column client_no to primary key
-- ALTER TABLE client_master ALTER COLUMN client_no VARCHAR(6) NOT NULL
-- ALTER TABLE client_master ADD PRIMARY KEY(client_no)

CREATE TABLE Sales_order(
    S_order_no varchar(6) PRIMARY KEY, CHECK(S_order_no LIKE '0%'),
    S_order_date Date, 
    Client_no Varchar(6), FOREIGN KEY(Client_no) REFERENCES client_master(client_no),
    Dely_add Varchar(6),
    Salesman_no Varchar(6), FOREIGN KEY(Salesman_no) REFERENCES Sales_master(salesman_no),
    Dely_type Char(1) DEFAULT 'f', CHECK(Dely_type LIKE 'p' OR Dely_type LIKE 'f'),
    Billed_yn Char(1),
    Dely_date Date, CHECK(Dely_date > S_order_date),
    Order_status Varchar(10), CHECK(Order_status LIKE 'in process' OR Order_status LIKE 'fulfilled' OR Order_status LIKE 'back order' OR Order_status LIKE 'canceled')
)

-- Table: Sales_order_details
-- Alter the table product_master to set the column product_no to primary key
-- ALTER TABLE product_master ALTER COLUMN Product_no VARCHAR(6) NOT NULL
-- ALTER TABLE product_master ADD PRIMARY KEY(Product_no)

CREATE TABLE Sales_order_details(
    S_order_no Varchar(6),
    Product_no Varchar(6),
    Qty_order NUMERIC(8),
    Qty_disp NUMERIC(8),
    Product_rate NUMERIC(10,2)
    FOREIGN KEY(S_order_no) REFERENCES Sales_order(S_order_no),
    FOREIGN KEY(Product_no) REFERENCES product_master(Product_no)
)

-- Insert the following data into their respective tables using insert statement:
-- Insert data for Sales_master table.
INSERT INTO Sales_master(Salesman_no, Sal_name, Address, City, Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks)
VALUES
('500001', 'Kiran', 'A/14 worli', 'Bombay', 400002, 'Mah', 3000, 100, 50, 'Good'),
('500002', 'Manish', '65, nariman', 'Bombay', 400001, 'Mah', 3000, 200, 100, 'Good'),
('500003', 'Ravi', 'P-7 Bandra', 'Bombay', 400032, 'Mah', 3000, 200, 100, 'Good'),
('500004', 'Ashish', 'A/5 Juhu', 'Bombay', 400044, 'Mah', 3500, 200, 150, 'Good')

-- Insert data for Sales_order table.
-- Commented two records as client_no 0001 doesn't exists.
INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date, Order_status)
VALUES
-- ('019001', '12-01-96', '0001', 'F', 'N', '500001', '20-01-1996', 'in process'),
('019002', '25-01-96', '0002', 'P', 'N', '500002', '27-01-96', 'canceled'),
('016865', '18-02-96', '0003', 'F', 'Y', '500003', '20-02-96', 'fulfilled'),
-- ('019003', '03-04-96', '0001', 'F', 'Y', '500001', '07-04-96', 'fulfilled'),
('046866', '20-05-96', '0004', 'P', 'N', '500002', '22-05-96', 'canceled'),
('010008', '24-05-96', '0005', 'F', 'N', '500004', '26-05-96', 'in process')

-- Insert data for Sales_order_details table.
-- Edited S_order_no for 046865 to 016865 and commented 5 records as S_order_no 0190001 and 019003 doesn't exists.
INSERT INTO Sales_order_details(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES
-- ('019001', 'P00001', 4, 4, 525),
-- ('019001', 'P07965', 2, 1, 8400),
-- ('019001', 'P07885', 2, 1, 5250),
('019002', 'P00001', 10, 0, 525),
('016865', 'P07868', 3, 3, 3150),
('016865', 'P07885', 10, 10, 5250),
-- ('019003', 'P00001', 4, 4, 1050),
-- ('019003', 'P03453', 2, 2, 1050),
('046866', 'P06734', 1, 1, 12000),
('046866', 'P07965', 1, 0, 8400),
('010008', 'P07975', 1, 0, 1050),
('010008', 'P00001', 10, 5, 525)