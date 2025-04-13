# Bookstore Database

A fully relational MySQL database system that models a real-world online bookstore. This database handles everything from books and authors to customers, orders, and shipping methods, with a strong focus on data relationships and secure user access.

## Features

- 13 well-structured tables with clear foreign key relationships
- Sample data to test common queries and workflows
- Implements role-based access control using MySQL `CREATE ROLE` and `GRANT`
- Demonstrates essential SQL operations: GRANT, JOINs
- Perfect for database design practice, assignments, or personal projects

## Entity Relationship Diagram (ERD)

![Entity Relationship Diagram](groupwork (4).jpg)

## Tables Overview

1. **Country**
2. **Book_language**
3. **Publisher**
4. **Author**
5. **Book**
6. **Book_author**
7. **Customer**
8. **Address_status**
9. **Address**
10. **Customer_address**
11. **Shipping_method**
12. **Cust_order**
13. **Order_line**

## Sample Data Highlights

- Books from various authors and publishers
- Customers with associated addresses and orders
- Support for multiple languages and shipping methods

## Role-Based Access Control

- `book_admin`: Full access to book & author data
- `customer_support`: View access to customer & order data
- `read_only`: Limited to viewing all records

## Usage

1. Run the SQL table creation script
2. Create roles and assign privileges
3. Execute provided queries to explore data relationships

## Tech Stack

- **MySQL**
- ERD created using **draw.io**
- Compatible with **MySQL Workbench**

## Contributors

- **Mellon Pakkies** – Project lead, database architect  
- **Timothy Kiplimo** – Draw.io architect
- **Obadia Kiptanui** - Consultant 

---

Built as a practical learning resource for relational database design and management.

