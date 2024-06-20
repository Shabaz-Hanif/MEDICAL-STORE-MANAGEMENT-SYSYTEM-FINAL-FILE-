use Medical_Store_Management_System;
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
