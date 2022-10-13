CREATE TABLE order_ (
   id integer PRIMARY KEY,
   customer_id integer,
   date_ string,
   status_id integer,
   FOREIGN KEY (customer_id) REFERENCES customer (id),
   FOREIGN KEY (status_id) REFERENCES status (id)
);

INSERT INTO order_ (customer_id, date_, status_id) VALUES ("1", "2025-02-19", "1");
INSERT INTO order_ (customer_id, date_, status_id) VALUES ("3", "2017-12-05", "4");
INSERT INTO order_ (customer_id, date_, status_id) VALUES ("2", "2019-04-13", "1");
INSERT INTO order_ (customer_id, date_, status_id) VALUES ("2", "2023-05-25", "3");
INSERT INTO order_ (customer_id, date_, status_id) VALUES ("3", "2014-03-14", "2");
INSERT INTO order_ (customer_id, date_, status_id) VALUES ("2", "2026-05-19", "4");
--------------------------------------------------------------------------------------
CREATE TABLE customer (
	id INTEGER PRIMARY KEY NOT NULL, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(255) NOT NULL, 
	email VARCHAR(255) UNIQUE
);

INSERT INTO customer (first_name, last_name, email) VALUES ("Juozas", "Juozaitis", "juzis@gmail.com");
INSERT INTO customer (first_name, last_name, email) VALUES ("Pranis", "Pranauskas", "prans@gmail.com");
INSERT INTO customer (first_name, last_name, email) VALUES ("Edmis", "Edmundauskas", "edis@gmail.com");
-------------------------------------------------------------------------------------------------------
CREATE TABLE status (
	id INTEGER PRIMARY KEY NOT NULL, 
	name VARCHAR(255)
);

INSERT INTO status (name) VALUES ("Vykdomas");
INSERT INTO status (name) VALUES ("Atsaukatas");
INSERT INTO status (name) VALUES ("Uzlaikytas");
INSERT INTO status (name) VALUES ("Ivykdytas");
-----------------------------------------------------------------------------------------------------------
CREATE TABLE product_order (
	order_id INTEGER, 
	product_id INTEGER, 
	quantity INTEGER, 
	FOREIGN KEY (order_id) REFERENCES order_ (id), 
	FOREIGN KEY (product_id) REFERENCES product (id)
);

INSERT INTO product_order (order_id, product_id, quantity) VALUES ("6", "1", "50");
INSERT INTO product_order (order_id, product_id, quantity) VALUES ("3", "4", "100");
INSERT INTO product_order (order_id, product_id, quantity) VALUES ("2", "3", "70");
INSERT INTO product_order (order_id, product_id, quantity) VALUES ("1", "1", "20");
INSERT INTO product_order (order_id, product_id, quantity) VALUES ("5", "2", "200");
INSERT INTO product_order (order_id, product_id, quantity) VALUES ("4", "3", "50");
----------------------------------------------------------------------------------------
CREATE TABLE product (
	id INTEGER PRIMARY KEY NOT NULL, 
	name VARCHAR(255), 
	price float
);

INSERT INTO product (name, price) VALUES ("Zvyras", 200);
INSERT INTO product (name, price) VALUES ("Shudas", 50);
INSERT INTO product (name, price) VALUES ("Oras", 150);
INSERT INTO product (name, price) VALUES ("Patarimas", 500);
--------------------------------------------------------------------------------------

SELECT order_.id as "order_id", order_.date_ as "date", customer.last_name as "customer", 
sum(product_order.quantity * product.price) as price 
FROM product_order 
JOIN order_ ON order_.id=product_order.order_id 
JOIN product ON product.id=product_order.product_id 
JOIN customer ON customer.id=order_.customer_id 
GROUP BY order_id;
-------------------------------------------------------------------------------------------------
SELECT order_.id, product.name, product_order.quantity, product.price, product_order.quantity * product.price AS "total" 
FROM order_ 
JOIN product_order ON order_.id=product_order.order_id 
JOIN product ON product.id=product_order.product_id;
-------------------------------------------------------------------------------------------------------
SELECT product.name, product_order.quantity, product.price, product_order.quantity * product.price AS "total" 
FROM order_ 
JOIN product_order ON order_.id=product_order.order_id 
JOIN product ON product.id=product_order.product_id;