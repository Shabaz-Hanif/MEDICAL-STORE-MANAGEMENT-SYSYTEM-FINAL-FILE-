use Medical_Store_Management_System;
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
