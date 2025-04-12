-- Creating table country
CREATE TABLE country(country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(100) NOT NULL);

-- Creating table book_language
CREATE TABLE Book_language (
language_id INT AUTO_INCREMENT PRIMARY KEY,
language_name VARCHAR(100) NOT NULL
);

-- Creating table publisher
CREATE TABLE publisher(publisher_id 
INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
country_id INT,
FOREIGN KEY (country_id) REFERENCES Country(country_id));

-- Creating table author
CREATE TABLE author(author_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
birth_year INT);

-- Creating table Book
CREATE TABLE book(book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
publication_year INT,
publisher_id INT,
language_id INT,
FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
FOREIGN KEY (language_id) REFERENCES Book_language(language_id)
);

-- Creating table Book_author
CREATE TABLE book_author(book_id INT,
author_id INT,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id) REFERENCES Book(book_id),
FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Creating table Customer
CREATE TABLE customer(customer_id 
INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE);

-- Creating table Address_status
CREATE TABLE address_status(status_id 
INT AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR(50) NOT NULL
);

-- Creating table Address
CREATE TABLE address(address_id 
INT AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(255) NOT NULL,
city VARCHAR(100),
postal_code VARCHAR(50),
country_id INT,
FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Creating table Customer_address
CREATE TABLE customer_address(customer_id INT,
address_id INT,
PRIMARY KEY (customer_id, address_id),
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

-- Creating table Shipping_method
CREATE TABLE shipping_method(shipping_method_id 
INT AUTO_INCREMENT PRIMARY KEY,
method_name VARCHAR(100) NOT NULL,
price DECIMAL(10, 2));

-- Creating table Cust_order
CREATE TABLE cust_order(order_id 
INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATETIME NOT NULL,
shipping_method_id INT,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (shipping_method_id) REFERENCES Shipping_method(shipping_method_id)
);

-- Creating table Order_line
CREATE TABLE order_line(order_line_id 
INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
price DECIMAL(10, 2),
FOREIGN KEY (order_id) REFERENCES Cust_order(order_id),
FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Managing databases access and roles
-- Create roles
CREATE ROLE 'book_admin';
CREATE ROLE 'customer_support';
CREATE ROLE 'read_only';

-- Full access to book and author-related tables
GRANT SELECT, INSERT, UPDATE, DELETE ON Book TO 'book_admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON Author TO 'book_admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON Book_author TO 'book_admin';

-- Giving limited access for 'customer support'
GRANT SELECT ON Customer TO 'customer_support';
GRANT SELECT ON Cust_order TO 'customer_support';

-- Read-only access to all tables
GRANT SELECT ON *.* TO 'read_only';

-- Creating users
CREATE USER 'mellon'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'timothy'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'obadia'@'localhost' IDENTIFIED BY 'readonlypass';

-- Assigning roles to users
GRANT 'book_admin' TO 'mellon'@'localhost';
GRANT 'customer_support' TO 'timothy'@'localhost';
GRANT 'read_only' TO 'obadia'@'localhost';

-- Set a default role
SET DEFAULT ROLE 'book_admin' TO 'melllon'@'localhost';

