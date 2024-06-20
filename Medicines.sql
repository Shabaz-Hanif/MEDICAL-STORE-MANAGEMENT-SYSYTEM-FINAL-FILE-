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