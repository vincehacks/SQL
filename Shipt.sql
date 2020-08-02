-- Created by: Vince Chang

CREATE DATABASE shiptdb;

CREATE TABLE product
(
  product_id int,
  name varchar(50),
  category varchar(50)
);

SELECT *
FROM products;

SELECT *
FROM orders;

SELECT *
FROM customers;

UPDATE orders
SET customer_id=1
WHERE order_id=1;