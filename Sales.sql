use Medical_Store_Management_System;
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
