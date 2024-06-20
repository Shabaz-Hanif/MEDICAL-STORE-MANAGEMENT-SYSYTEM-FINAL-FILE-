use Medical_Store_Management_System;
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
INSERT INTO Customers (customer_name, phone_number, email, address) VALUES 
('Shabu Baloch', '03101314631', 'shabubaloch30@gmail.com', '123 Main Street, City, Pakistan'),
('Ayesha Khan', '03232678901', 'ayeshakhan300@gmail.com', '456 Oak Avenue, Town, Pakistan'),
('Uzair', '03352752985', 'syedabduluzair60@gmail.com', '789 Elm Street, City, Pakistan'),
('Kamran Alam', '0342928152', 'kamranalam39@gmail.com', '987 Pine Lane, City, Pakistan'),
('Sara Khan', '03356789001', 'SaraKhan123@gmail.com', '654 Cedar Avenue, Town, Pakistan');
select * from Customers;
