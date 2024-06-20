use Medical_Store_Management_System;
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
select * from Medicine_Categories;
