use Medical_Store_Management_System;
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
