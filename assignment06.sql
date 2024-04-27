CREATE DATABASE ecommerce;
USE ecommerce;


-- Headquarter Database

-- Customer Table
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    City_id INT,
    First_order_date DATE
);

-- Walk-in_customers Table
CREATE TABLE Walk_in_customers (
    Customer_id INT,
    tourism_guide VARCHAR(255),
    Time DATETIME,
    PRIMARY KEY (Customer_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

-- Mail_order_customers Table
CREATE TABLE Mail_order_customers (
    Customer_id INT,
    post_address VARCHAR(255),
    Time DATETIME,
    PRIMARY KEY (Customer_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);


-- Sales Databases

-- Headquarters Table
CREATE TABLE Headquarters (
    City_id INT PRIMARY KEY,
    City_name VARCHAR(255),
    Headquarter_addr VARCHAR(255),
    State VARCHAR(50),
    Time DATE
);

-- Stores Table
CREATE TABLE Stores (
    Store_id INT PRIMARY KEY,
    City_id INT,
    Phone VARCHAR(15),
    Time DATE,
    FOREIGN KEY (City_id) REFERENCES Headquarters(City_id)
);

-- Items Table
CREATE TABLE Items (
    Item_id INT PRIMARY KEY,
    Description VARCHAR(255),
    Size VARCHAR(50),
    Weight DECIMAL(5,2),
    Unit_price DECIMAL(8,2),
    Time DATE
);

-- Stored_items Table
CREATE TABLE Stored_items (
    Store_id INT,
    Item_id INT,
    Quantity_held INT,
    Time DATE,
    PRIMARY KEY (Store_id, Item_id),
    FOREIGN KEY (Store_id) REFERENCES Stores(Store_id),
    FOREIGN KEY (Item_id) REFERENCES Items(Item_id)
);

-- Order Table
CREATE TABLE Order_table (
    Order_no INT PRIMARY KEY,
    Order_date DATE,
    Customer_id INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

-- Ordered_item Table
CREATE TABLE Ordered_item (
    Order_no INT,
    Item_id INT,
    Quantity_ordered INT,
    Ordered_price DECIMAL(10,2),
    Time DATE,
    PRIMARY KEY (Order_no, Item_id),
    FOREIGN KEY (Order_no) REFERENCES Order_table(Order_no),
    FOREIGN KEY (Item_id) REFERENCES Items(Item_id)
);


------------------------------------------------------------------------------------------------------------------------ 

-- Headquarter Database: Customer, Walk-in_customers, Mail_order_customers  
-- Sales Databases:  Headquarters, Stores, Items, Stored_items, Order, Ordered_item 

-- Insert into Customer
INSERT INTO Customer VALUES
(1, 'John Doe', 1, '2023-01-15'),
(2, 'Jane Smith', 2, '2023-02-20'),
(3, 'Alice Johnson', 1, '2023-03-10'),
(4, 'Bob Williams', 3, '2023-04-05'),
(5, 'Eva Davis', 2, '2023-05-15'),
(6, 'Charlie Brown', 3, '2023-06-20'),
(7, 'Grace Miller', 1, '2023-07-01'),
(8, 'David Robinson', 2, '2023-08-12'),
(9, 'Sophia Lee', 3, '2023-09-25'),
(10, 'Michael Garcia', 1, '2023-10-30');


-- Insert into Walk-in_customers
INSERT INTO Walk_in_customers VALUES
(1, 'Tour Guide 1', '2023-01-15 10:00:00'),
(2, 'Tour Guide 2', '2023-02-20 12:30:00'),
(3, 'Tour Guide 3', '2023-03-10 09:45:00'),
(4, 'Tour Guide 4', '2023-04-05 11:20:00'),
(5, 'Tour Guide 5', '2023-05-15 14:00:00'),
(6, 'Tour Guide 6', '2023-06-20 10:30:00'),
(7, 'Tour Guide 7', '2023-07-01 13:45:00'),
(8, 'Tour Guide 8', '2023-08-12 15:10:00'),
(9, 'Tour Guide 9', '2023-09-25 12:20:00'),
(10, 'Tour Guide 10', '2023-10-30 11:45:00');


-- Insert into Mail_order_customers
INSERT INTO Mail_order_customers VALUES
(1, '123 Main St, City1', '2023-01-15 09:30:00'),
(2, '456 Oak St, City2', '2023-02-20 11:45:00'),
(3, '789 Pine St, City1', '2023-03-10 08:15:00'),
(4, '987 Elm St, City3', '2023-04-05 10:30:00'),
(5, '321 Birch St, City2', '2023-05-15 13:00:00'),
(6, '654 Maple St, City3', '2023-06-20 09:00:00'),
(7, '876 Cedar St, City1', '2023-07-01 12:15:00'),
(8, '234 Spruce St, City2', '2023-08-12 14:30:00'),
(9, '567 Pine St, City3', '2023-09-25 11:40:00'),
(10, '890 Oak St, City1', '2023-10-30 10:05:00');


-- Insert into Headquarters
INSERT INTO Headquarters VALUES
(1, 'City1', 'HQ Address 1', 'State1', '2023-01-01'),
(2, 'City2', 'HQ Address 2', 'State2', '2023-02-01'),
(3, 'City3', 'HQ Address 3', 'State3', '2023-03-01');


-- Insert into Stores
INSERT INTO Stores VALUES
(1, 1, '123-456-7890', '2023-01-05'),
(2, 1, '987-654-3210', '2023-01-10'),
(3, 2, '111-222-3333', '2023-02-15'),
(4, 2, '444-555-6666', '2023-03-20'),
(5, 3, '999-888-7777', '2023-04-25'),
(6, 3, '333-222-1111', '2023-05-30'),
(7, 1, '777-888-9999', '2023-06-05'),
(8, 2, '555-444-3333', '2023-07-10'),
(9, 2, '222-111-0000', '2023-08-15'),
(10, 3, '666-777-8888', '2023-09-20');


-- Insert into Items
INSERT INTO Items VALUES
(1, 'Item1', 'Large', 2.5, 10.99, '2023-01-01'),
(2, 'Item2', 'Medium', 1.5, 5.99, '2023-01-05'),
(3, 'Item3', 'Small', 0.8, 2.99, '2023-02-10'),
(4, 'Item4', 'XL', 3.0, 15.99, '2023-03-15'),
(5, 'Item5', 'XXS', 0.5, 3.99, '2023-04-20'),
(6, 'Item6', 'Large', 2.8, 12.99, '2023-05-25'),
(7, 'Item7', 'Medium', 1.2, 7.99, '2023-06-30'),
(8, 'Item8', 'Small', 0.7, 4.99, '2023-07-05'),
(9, 'Item9', 'M', 1.8, 8.99, '2023-08-10'),
(10, 'Item10', 'S', 0.9, 6.99, '2023-09-15');


-- Insert into Stored_items
INSERT INTO Stored_items VALUES
(1, 1, 100, '2023-01-05'),
(1, 2, 50, '2023-01-10'),
(2, 3, 75, '2023-02-15'),
(2, 4, 30, '2023-03-20'),
(3, 5, 60, '2023-04-25'),
(3, 6, 45, '2023-05-30'),
(4, 7, 80, '2023-06-05'),
(4, 8, 40, '2023-07-10'),
(5, 9, 55, '2023-08-15'),
(5, 10, 25, '2023-09-20');


-- Insert into Order_table
INSERT INTO Order_table VALUES
(1, '2023-01-20', 1),
(2, '2023-02-25', 2),
(3, '2023-03-05', 3),
(4, '2023-04-10', 4),
(5, '2023-05-15', 5),
(6, '2023-06-20', 6),
(7, '2023-07-25', 7),
(8, '2023-08-30', 8),
(9, '2023-09-05', 9),
(10, '2023-10-10', 10);

-- Insert into Ordered_item
INSERT INTO Ordered_item VALUES
(1, 1, 5, 54.95, '2023-01-20'),
(1, 3, 3, 17.97, '2023-01-20'),
(2, 2, 8, 47.92, '2023-02-25'),
(2, 5, 2, 7.98, '2023-02-25'),
(3, 4, 4, 63.96, '2023-03-05'),
(3, 7, 6, 47.94, '2023-03-05'),
(4, 6, 2, 25.98, '2023-04-10'),
(4, 9, 5, 44.95, '2023-04-10'),
(5, 8, 7, 34.93, '2023-05-15'),
(5, 10, 1, 6.99, '2023-05-15');


--------------------------------------------------------------------------------------------------------------------------------


-- # 1. Find all the stores along with city, state, phone, description, size, weight, and unit price that hold a particular item of stock. 
SELECT Stores.Store_id, 
	   Headquarters.City_name, 
       Headquarters.State, 
       Stores.Phone, 
       Items.Description, 
       Items.Size, 
       Items.Weight, 
       Items.Unit_price
FROM Stores
JOIN Headquarters ON Stores.City_id = Headquarters.City_id
JOIN Stored_items ON Stores.Store_id = Stored_items.Store_id
JOIN Items ON Stored_items.Item_id = Items.Item_id
WHERE Items.Item_id = 3;


-- # 2. Find all the orders along with customer name and order date that can be fulfilled by a given store. 
SELECT Order_table.Order_no, 
       Order_table.Order_date, 
       Customer.Customer_name
FROM Order_table
JOIN Customer ON Order_table.Customer_id = Customer.Customer_id
JOIN Ordered_item ON Order_table.Order_no = Ordered_item.Order_no
JOIN Stored_items ON Ordered_item.Item_id = Stored_items.Item_id
JOIN Stores ON Stored_items.Store_id = Stores.Store_id
WHERE Stores.Store_id = 2;


-- # 3. Find all stores along with city name and phone that hold items ordered by given customer. 
SELECT Stores.Store_id, Headquarters.City_name, Stores.Phone
FROM Stores
JOIN Headquarters ON Stores.City_id = Headquarters.City_id
JOIN Stored_items ON Stores.Store_id = Stored_items.Store_id
JOIN Ordered_item ON Stored_items.Item_id = Ordered_item.Item_id
JOIN Order_table ON Ordered_item.Order_no = Order_table.Order_no
JOIN Customer ON Order_table.Customer_id = Customer.Customer_id
WHERE Customer.Customer_id = 3;



-- # 4. Find the headquarter address along with city and state of all stores that hold stocks of an item above a particular level. 
SELECT Headquarters.Headquarter_addr, Headquarters.City_name, Headquarters.State
FROM Headquarters
JOIN Stores ON Headquarters.City_id = Stores.City_id
JOIN Stored_items ON Stores.Store_id = Stored_items.Store_id
WHERE Stored_items.Item_id = 5 AND Stored_items.Quantity_held > 40;


-- # 5. For each customer order, show the items ordered along with description, store id, and city name and the stores that hold the items. 
SELECT Ordered_item.Order_no, Items.Description, Stored_items.Store_id, Headquarters.City_name
FROM Ordered_item
JOIN Items ON Ordered_item.Item_id = Items.Item_id
JOIN Stored_items ON Ordered_item.Item_id = Stored_items.Item_id
JOIN Stores ON Stored_items.Store_id = Stores.Store_id
JOIN Headquarters ON Stores.City_id = Headquarters.City_id
ORDER BY Ordered_item.Order_no;


-- # 6. Find the city and the state in which a given customer lives.
SELECT Headquarters.City_name, Headquarters.State
FROM Headquarters
JOIN Customer ON Headquarters.City_id = Customer.City_id
WHERE Customer.Customer_id = 7;


-- # 7. Find the stock level of a particular item in all stores in a particular city.
SELECT Stores.Store_id, Headquarters.City_name, Stored_items.Quantity_held
FROM Stores
JOIN Headquarters ON Stores.City_id = Headquarters.City_id
JOIN Stored_items ON Stores.Store_id = Stored_items.Store_id
WHERE Stored_items.Item_id = 8 AND Headquarters.City_id = 2;


-- # 8. Find the items, quantity ordered, customer, store, and city of an order. 
SELECT Items.Description, Ordered_item.Quantity_ordered, Customer.Customer_name, Stores.Store_id, Headquarters.City_name
FROM Ordered_item
JOIN Items ON Ordered_item.Item_id = Items.Item_id
JOIN Order_table ON Ordered_item.Order_no = Order_table.Order_no
JOIN Customer ON Order_table.Customer_id = Customer.Customer_id
JOIN Stores ON Stores.Store_id = (
    SELECT Store_id
    FROM Stored_items
    WHERE Item_id = Ordered_item.Item_id
    ORDER BY RAND() -- You might want to adjust this based on your requirements
    LIMIT 1
)
JOIN Headquarters ON Stores.City_id = Headquarters.City_id
ORDER BY Ordered_item.Order_no;


-- # 9. Find the walk-in customers, mail order customers, and dual customers (both walk-in and mail order).
SELECT * FROM Walk_in_customers;
SELECT * FROM Mail_order_customers;
SELECT * FROM Walk_in_customers WHERE Customer_id IN (SELECT Customer_id FROM Mail_order_customers);













