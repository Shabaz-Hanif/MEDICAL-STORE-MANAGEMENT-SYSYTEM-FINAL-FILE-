use Medical_Store_Management_System;
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
