Create Database Medical_Store_Management_System;
use Medical_Store_Management_System;
CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100),
    manufacturer VARCHAR(100),
    expiry_date DATE,
    unit_price DECIMAL(10, 2),
    quantity_in_stock INT
);
INSERT INTO Medicines (medicine_name, manufacturer, expiry_date, unit_price, quantity_in_stock) VALUES 
('Aspirin', 'Bayer', '2024-06-30', 50.00, 20),
('pandol', 'Bayer', '2026-04-25', 50.00, 20),
('Ibuprofen', 'Pfizer', '2024-05-25', 80.00, 15),
('Amoxicillin', 'GSK', '2025-03-31', 120.00, 8),
('Paracetamol', 'Johnson & Johnson', '2025-12-31', 70.00, 25);
select * from medicines;


CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email, address) VALUES 
(1, 'XYZ Pharmaceuticals', 'subhan', '03134543675', 'subhan034@gmail.com', '456 Oak Avenue, Town, Country'),
(2, 'MediCorp', 'haris', '0332432543', 'haris567@gmail.com', '789 Elm Street, City, Country'),
(3, 'HealthCare Suppliers', 'haseeb', '03342353257', 'haseeb353@gmail.com', '321 Maple Road, Town, Country'),
(4, 'Pharma Solutions Ltd', 'hamza', '03443322110', 'hamza532@gmail.com', '987 Pine Lane, City, Country'),
(5, 'Global Generics', 'haseeb', '03777888999', 'haseeb334@gmail.com', '654 Cedar Avenue, Town, Country');
select * from Suppliers; 


CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
INSERT INTO Customers (customer_name, phone_number, email, address) VALUES 
('Shabu Baloch', '03101314631', 'shabubaloch30@gmail.com', '123 Main Street, BALOCHISTAN, Pakistan'),
('Ayesha Khan', '03232678901', 'ayeshakhan300@gmail.com', '456 Oak Avenue, LAHORE, Pakistan'),
('Uzair', '03352752985', 'syedabduluzair60@gmail.com', '789 Elm Street, KARACHI, Pakistan'),
('Kamran Alam', '0342928152', 'kamranalam39@gmail.com', '987 Pine Lane, KPK, Pakistan'),
('Sara Khan', '03356789001', 'SaraKhan123@gmail.com', '654 Cedar Avenue, KARACHI, Pakistan');
select * from Customers;

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
); 
INSERT INTO Sales (customer_id, sale_date, total_amount) VALUES 
(1, '2024-05-26 10:00:00', 120.00),
(2, '2024-05-27 11:00:00', 150.00),
(3, '2024-05-28 12:00:00', 180.00),
(4, '2024-05-23 13:00:00', 200.00),
(5, '2024-05-26 14:00:00', 220.00);
select * from sales;

CREATE TABLE Sale_Items (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    medicine_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Sale_Items (sale_id, medicine_id, quantity_sold, unit_price) VALUES 
(1, 1, 2, 25.00),
(1, 2, 1, 40.00),
(2, 3, 3, 30.00),
(2, 4, 2, 50.00),
(3, 5, 4, 35.00);
select * from Sale_Items;

CREATE TABLE Purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
INSERT INTO Purchase (supplier_id, purchase_date, total_amount) VALUES 
(1, '2024-05-26', 500.00),
(2, '2024-05-26', 600.00),
(3, '2024-05-26', 700.00),
(4, '2024-05-26', 800.00),
(5, '2024-05-26', 900.00);
select * from Purchase;


CREATE TABLE Purchase_Items (
    purchase_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    medicine_id INT,
    quantity_purchased INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Purchase_Items (purchase_id, medicine_id, quantity_purchased, unit_price) VALUES 
(1, 1, 10, 20.00),
(2, 2, 5, 30.00),
(3, 3, 8, 25.00),
(4, 4, 3, 35.00),
(5, 5, 12, 15.00);
select * from Purchase_Items;
CREATE TABLE Stock_Adjustment (
    adjustment_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    adjustment_date DATETIME,
    adjustment_type ENUM('Addition', 'Subtraction'),
    quantity_adjusted INT,
    reason VARCHAR(200),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
INSERT INTO Stock_Adjustment (medicine_id, adjustment_date, adjustment_type, quantity_adjusted, reason) VALUES 
(1, '2024-05-26 10:00:00', 'Addition', 20, 'Received new shipment'),
(2, '2024-05-27 09:00:00', 'Subtraction', 5, 'Damaged during handling'),
(3, '2024-05-28 11:30:00', 'Addition', 10, 'Correcting inventory count');
select * from Stock_Adjustment;

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO Categories (category_name) VALUES 
('Pain Relief'),
('Antibiotics'),
('Digestive Health'),
('Cardiovascular'),
('Respiratory');
select * from Categories;

CREATE TABLE Medicine_Categories (
    medicine_category_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    category_id INT,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
select * from Medicine_Categories;
INSERT INTO Medicine_Categories (medicine_id, category_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
-- syed abdul uzair
SELECT c.customer_name, SUM(s.total_amount) AS total_spent
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name;

SELECT COUNT(DISTINCT supplier_id) AS num_distinct_suppliers FROM Purchase;

SELECT medicine_id, COUNT(*) AS num_adjustments FROM Stock_Adjustment
GROUP BY medicine_id HAVING COUNT(*) > 1;

SELECT m.medicine_name, SUM(pi.quantity_purchased) AS total_quantity_purchased
FROM Medicines m
JOIN Purchase_Items pi ON m.medicine_id = pi.medicine_id
GROUP BY m.medicine_name;

SELECT s.sale_id, c.customer_name, m.medicine_name, si.quantity_sold, si.unit_price
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Sale_Items si ON s.sale_id = si.sale_id
JOIN Medicines m ON si.medicine_id = m.medicine_id;

SELECT pi.purchase_item_id, pi.purchase_id, pi.medicine_id, pi.quantity_purchased, pi.unit_price,
       m.medicine_name, m.manufacturer, m.expiry_date, m.unit_price AS medicine_unit_price,
       s.supplier_name, s.contact_person, s.phone_number, s.email
FROM Purchase_Items pi
RIGHT JOIN Medicines m ON pi.medicine_id = m.medicine_id
RIGHT JOIN Purchase p ON pi.purchase_id = p.purchase_id
RIGHT JOIN Suppliers s ON p.supplier_id = s.supplier_id;

SELECT m.medicine_name, m.manufacturer, m.expiry_date, m.unit_price,
pi.quantity_purchased, pi.unit_price AS purchase_unit_price
FROM Medicines m
LEFT JOIN Purchase_Items pi ON m.medicine_id = pi.medicine_id;

SELECT s.supplier_name, SUM(p.total_amount) AS total_purchased
FROM Suppliers s
JOIN Purchase p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY total_purchased DESC
LIMIT 3;

SELECT c.customer_name, COUNT(s.sale_id) AS num_purchases, SUM(s.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name;

SELECT AVG(num_purchases) AS avg_sales_per_customer
FROM (
    SELECT c.customer_name, COUNT(s.sale_id) AS num_purchases
    FROM Customers c
    LEFT JOIN Sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_name
) AS customer_sales;

SELECT c.category_name, COUNT(mc.medicine_id) AS num_medicines
FROM Categories c
LEFT JOIN Medicine_Categories mc ON c.category_id = mc.category_id
GROUP BY c.category_name;

SELECT sa.medicine_id, m.medicine_name, COUNT(sa.adjustment_id) AS num_adjustments
FROM Stock_Adjustment sa
JOIN Medicines m ON sa.medicine_id = m.medicine_id
GROUP BY sa.medicine_id, m.medicine_name;

SELECT COUNT(DISTINCT category_id) AS num_distinct_categories FROM Categories;


-- kamran Alam
SELECT COUNT(*) FROM Medicines;
SELECT SUM(quantity_in_stock) AS total_quantity FROM Medicines;
SELECT AVG(unit_price) AS average_price FROM Medicines;
SELECT MAX(unit_price) AS max_price FROM Medicines;
SELECT * FROM Customers WHERE customer_name LIKE 'A%';
SELECT MIN(unit_price) AS min_price FROM Medicines;
SELECT * FROM Medicines WHERE manufacturer = 'Bayer';
SELECT * FROM Sales WHERE sale_date BETWEEN '2024-05-01' AND '2024-05-31';
SELECT customer_id, SUM(total_amount) AS total_sales FROM Sales GROUP BY customer_id;
SELECT customer_id, COUNT(*) AS num_sales FROM Sales GROUP BY customer_id;
SELECT medicine_id, SUM(quantity_sold) AS total_quantity_sold FROM Sale_Items GROUP BY medicine_id;

SELECT m.medicine_id, m.medicine_name FROM Medicines m
LEFT JOIN Sale_Items si ON m.medicine_id = si.medicine_id
WHERE si.sale_item_id IS NULL;

SELECT p.supplier_id FROM Purchase_Items pi
JOIN Purchase p ON pi.purchase_id = p.purchase_id
GROUP BY p.supplier_id
HAVING SUM(pi.quantity_purchased) > 10;

SELECT * FROM Medicines ORDER BY unit_price DESC LIMIT 1;
SELECT * FROM Medicines ORDER BY unit_price ASC LIMIT 1;
SELECT DISTINCT SUBSTRING_INDEX(address, ',', -2) AS city FROM Customers;
-- Shabaz Hanif
SELECT SUBSTRING_INDEX(address, ',', -2) AS city, COUNT(*) AS num_suppliers
FROM Suppliers
GROUP BY city;

SELECT s.supplier_name, m.medicine_name FROM Suppliers s
JOIN Purchase p ON s.supplier_id = p.supplier_id
JOIN Purchase_Items pi ON p.purchase_id = pi.purchase_id
JOIN Medicines m ON pi.medicine_id = m.medicine_id;

SELECT medicine_id, COUNT(*) AS num_adjustments FROM Stock_Adjustment GROUP BY medicine_id;

SELECT medicine_id, reason FROM Stock_Adjustment ORDER BY adjustment_date DESC LIMIT 1;

SELECT m.medicine_name, c.category_name FROM Medicines m
JOIN Medicine_Categories mc ON m.medicine_id = mc.medicine_id
JOIN Categories c ON mc.category_id = c.category_id;

SELECT medicine_id, SUM(CASE WHEN adjustment_type = 'Addition' THEN quantity_adjusted ELSE 0 END) AS total_added,
SUM(CASE WHEN adjustment_type = 'Subtraction' THEN quantity_adjusted ELSE 0 END) AS total_subtracted
FROM Stock_Adjustment GROUP BY medicine_id;

SELECT DISTINCT c.customer_name FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Sale_Items si ON s.sale_id = si.sale_id
JOIN Medicines m ON si.medicine_id = m.medicine_id
WHERE m.medicine_name = 'Aspirin';

SELECT s.sale_id, c.customer_name, s.sale_date, s.total_amount
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id;

SELECT AVG(quantity_purchased) AS avg_quantity FROM Purchase_Items;

SELECT DISTINCT s.supplier_name FROM Suppliers s
JOIN Purchase p ON s.supplier_id = p.supplier_id
JOIN Purchase_Items pi ON p.purchase_id = pi.purchase_id
JOIN Medicines m ON pi.medicine_id = m.medicine_id
WHERE m.medicine_name = 'Ibuprofen';

SELECT p.purchase_id, s.supplier_name, p.purchase_date, p.total_amount
FROM Purchase p
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

SELECT COUNT(DISTINCT medicine_id) AS num_distinct_medicines_sold FROM Sale_Items;

SELECT s.sale_id, SUM(si.quantity_sold * si.unit_price) AS total_sale_amount
FROM Sales s
JOIN Sale_Items si ON s.sale_id = si.sale_id
GROUP BY s.sale_id;

SELECT m.medicine_name, SUM(si.quantity_sold) AS total_quantity_sold
FROM Medicines m
JOIN Sale_Items si ON m.medicine_id = si.medicine_id
GROUP BY m.medicine_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT COUNT(DISTINCT customer_id) AS num_distinct_customers FROM Sales;

SELECT m.medicine_name FROM Medicines m
JOIN Medicine_Categories mc ON m.medicine_id = mc.medicine_id
JOIN Categories c ON mc.category_id = c.category_id
WHERE c.category_name = 'Pain Relief';