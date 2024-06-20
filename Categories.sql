use Medical_Store_Management_System;
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
