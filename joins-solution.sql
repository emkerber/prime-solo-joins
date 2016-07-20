-- 1. Get all customers and their addresses.
SELECT * FROM customers INNER JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM orders LEFT OUTER JOIN line_items ON orders.id = line_items.order_id;

-- 3. Which warehouses have cheetos?
SELECT products.description, warehouse.warehouse FROM warehouse INNER JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id INNER JOIN products ON warehouse_product.product_id = products.id WHERE products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT products.description, warehouse.warehouse FROM warehouse INNER JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id INNER JOIN products ON warehouse_product.product_id = products.id WHERE products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT concat(customers.first_name, ' ', customers.last_name) AS name, count(orders.id) FROM customers INNER JOIN addresses ON customers.id = addresses.customer_id INNER JOIN orders ON addresses.id = orders.address_id GROUP BY customers.id;

-- 6. How many customers do we have?
SELECT COUNT(*) "total_customers" FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(*) "total_products" FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) "total_diet_pepsi" FROM warehouse_product INNER JOIN products ON warehouse_product.product_id = products.id WHERE products.description = 'diet pepsi';
