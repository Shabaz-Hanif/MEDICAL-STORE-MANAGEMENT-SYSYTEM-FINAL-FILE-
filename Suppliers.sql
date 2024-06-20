use Medical_Store_Management_System;
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
