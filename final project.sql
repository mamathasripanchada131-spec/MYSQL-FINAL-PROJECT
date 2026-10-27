USE AgricultureFarmDB;
-- PART 1: DATABASE & TABLE CREATION

CREATE TABLE farmers (
    farmer_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(150)
);

CREATE TABLE farms (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT NOT NULL,
    farm_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);
CREATE TABLE fields (
    field_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    field_name VARCHAR(100) NOT NULL,
    area_acres DECIMAL(8,2) NOT NULL,
    soil_type VARCHAR(50),
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

CREATE TABLE crops (
    crop_id INT AUTO_INCREMENT PRIMARY KEY,
    crop_name VARCHAR(80) NOT NULL,
    season VARCHAR(40),
    expected_yield_kg DECIMAL(10,2)
);

CREATE TABLE crop_cycles (
    cycle_id INT AUTO_INCREMENT PRIMARY KEY,
    field_id INT NOT NULL,
    crop_id INT NOT NULL,
    sowing_date DATE,
    planned_harvest_date DATE,
    cycle_status ENUM('Planned','Growing','Harvested') DEFAULT 'Planned',
    FOREIGN KEY (field_id) REFERENCES fields(field_id),
    FOREIGN KEY (crop_id) REFERENCES crops(crop_id)
);
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    location VARCHAR(100)
);

CREATE TABLE inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    item_name VARCHAR(100) NOT NULL,
    item_type ENUM('Seed','Fertilizer','Pesticide','Equipment','Other') NOT NULL,
    quantity DECIMAL(10,2) NOT NULL DEFAULT 0,
    unit VARCHAR(20) DEFAULT 'kg',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE workers (
    worker_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    worker_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    daily_wage DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

CREATE TABLE farm_activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    cycle_id INT NOT NULL,
    item_id INT NULL,
    activity_type VARCHAR(80) NOT NULL,
    activity_date DATE NOT NULL,
    quantity_used DECIMAL(10,2) DEFAULT 0,
    cost DECIMAL(10,2) NOT NULL DEFAULT 0,
    notes VARCHAR(255),
    FOREIGN KEY (cycle_id) REFERENCES crop_cycles(cycle_id),
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
);

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    expense_date DATE NOT NULL,
    category VARCHAR(80) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

CREATE TABLE harvests (
    harvest_id INT AUTO_INCREMENT PRIMARY KEY,
    cycle_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_kg DECIMAL(10,2) NOT NULL,
    quality_grade VARCHAR(30),
    FOREIGN KEY (cycle_id) REFERENCES crop_cycles(cycle_id)
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    harvest_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity_sold_kg DECIMAL(10,2) NOT NULL,
    price_per_kg DECIMAL(10,2) NOT NULL,
    buyer_name VARCHAR(100),
    payment_mode ENUM('Cash','UPI','Bank Transfer','Other') DEFAULT 'Cash',
    FOREIGN KEY (harvest_id) REFERENCES harvests(harvest_id)
);
-- PART 2: SAMPLE DATA
INSERT INTO farmers (farmer_name, phone, address) VALUES
('Ravi Kumar','9876500001','Visakhapatnam'),
('Lakshmi Devi','9876500002','Anakapalli'),
('Suresh Rao','9876500003','Vizianagaram'),
('Anitha Kumari','9876500004','Nathavaram');

INSERT INTO farms (farmer_id, farm_name, location) VALUES
(1,'Green Valley Farm','Visakhapatnam'),
(2,'Lakshmi Fields','Anakapalli'),
(3,'Sunrise Farm','Vizianagaram'),
(1,'River Side Farm','Nathavaram');

INSERT INTO fields (farm_id, field_name, area_acres, soil_type) VALUES
(1,'North Field',3.50,'Red Soil'),
(1,'South Field',2.00,'Clay'),
(2,'East Field',4.00,'Black Soil'),
(3,'Main Field',5.00,'Red Soil'),
(4,'West Field',1.50,'Loamy');

INSERT INTO crops (crop_name, season, expected_yield_kg) VALUES
('Rice','Kharif',3000),
('Maize','Rabi',2500),
('Groundnut','Kharif',1800),
('Tomato','Winter',2200),
('Chilli','Rabi',1500);

INSERT INTO crop_cycles (field_id, crop_id, sowing_date, planned_harvest_date, cycle_status) VALUES
(1,1,'2026-06-10','2026-10-20','Growing'),
(2,2,'2026-07-01','2026-11-01','Growing'),
(3,3,'2026-06-15','2026-10-25','Growing'),
(4,4,'2026-08-01','2026-12-01','Growing'),
(5,1,'2026-06-20','2026-10-30','Growing');

INSERT INTO suppliers (supplier_name, phone, location) VALUES
('Agri Seeds Centre','9000000001','Visakhapatnam'),
('Farm Care Suppliers','9000000002','Anakapalli'),
('Green Grow Traders','9000000003','Vizianagaram');

INSERT INTO inventory (supplier_id, item_name, item_type, quantity, unit, unit_price) VALUES
(1,'Rice Seeds','Seed',120,'kg',65.00),
(1,'Maize Seeds','Seed',80,'kg',55.00),
(2,'Organic Fertilizer','Fertilizer',200,'kg',25.00),
(2,'Pest Control Spray','Pesticide',15,'litre',180.00),
(3,'Groundnut Seeds','Seed',0,'kg',90.00),
(3,'Hand Sprayer','Equipment',8,'piece',750.00);

INSERT INTO workers (farm_id, worker_name, phone, daily_wage) VALUES
(1,'Ramesh','9111100001',600.00),
(1,'Kiran','9111100002',550.00),
(2,'Mohan','9111100003',500.00),
(3,'Geetha','9111100004',650.00),
(4,'Prasad','9111100005',500.00);

INSERT INTO farm_activities (cycle_id, item_id, activity_type, activity_date, quantity_used, cost, notes) VALUES
(1,1,'Seed Sowing','2026-06-10',20,1300,'Rice seed sowing'),
(1,3,'Fertilizing','2026-07-15',30,750,'Organic fertilizer'),
(2,2,'Seed Sowing','2026-07-01',15,825,'Maize seed sowing'),
(3,3,'Fertilizing','2026-07-20',25,625,'Groundnut field'),
(4,4,'Pest Control','2026-09-01',2,360,'Tomato crop spray');

INSERT INTO expenses (farm_id, expense_date, category, amount, description) VALUES
(1,'2026-06-10','Seeds',1300,'Rice seeds'),
(1,'2026-07-15','Fertilizer',750,'Organic fertilizer'),
(2,'2026-07-01','Seeds',825,'Maize seeds'),
(3,'2026-07-20','Fertilizer',625,'Groundnut fertilizer'),
(3,'2026-08-10','Labour',2000,'Field work'),
(4,'2026-09-01','Pesticide',360,'Crop protection');

INSERT INTO harvests (cycle_id, harvest_date, quantity_kg, quality_grade) VALUES
(1,'2025-10-20',2800,'A'),
(2,'2025-11-01',2100,'A'),
(3,'2025-10-25',1600,'B'),
(4,'2025-12-01',1900,'A'),
(5,'2025-10-30',2500,'B');

INSERT INTO sales (harvest_id, sale_date, quantity_sold_kg, price_per_kg, buyer_name, payment_mode) VALUES
(1,'2025-10-22',1000,32.00,'City Grain Market','Bank Transfer'),
(1,'2025-10-25',800,31.00,'Local Wholesale','UPI'),
(2,'2025-11-03',1200,28.00,'Sunrise Traders','Cash'),
(3,'2025-10-27',1000,70.00,'Groundnut Buyers','Bank Transfer'),
(4,'2025-12-03',1500,25.00,'Fresh Vegetable Market','UPI'),
(5,'2025-11-02',1000,32.00,'City Grain Market','Cash');

-- PART 3: INDEXES
CREATE INDEX idx_farms_farmer ON farms(farmer_id);
CREATE INDEX idx_fields_farm ON fields(farm_id);
CREATE INDEX idx_cycles_field ON crop_cycles(field_id);
CREATE INDEX idx_cycles_crop ON crop_cycles(crop_id);
CREATE INDEX idx_inventory_supplier ON inventory(supplier_id);
CREATE INDEX idx_inventory_type ON inventory(item_type);
CREATE INDEX idx_activities_cycle ON farm_activities(cycle_id);
CREATE INDEX idx_expenses_farm_date ON expenses(farm_id, expense_date);
CREATE INDEX idx_harvests_cycle ON harvests(cycle_id);
CREATE INDEX idx_sales_harvest_date ON sales(harvest_id, sale_date);
-- Verify: SHOW INDEX FROM inventory;

PART 4: VIEWS
CREATE OR REPLACE VIEW view_farm_field_details AS
SELECT f.farm_id, f.farm_name, f.location, fd.field_id, fd.field_name,
       fd.area_acres, fd.soil_type, fr.farmer_name
FROM farms f
JOIN farmers fr ON fr.farmer_id = f.farmer_id
JOIN fields fd ON fd.farm_id = f.farm_id;

CREATE OR REPLACE VIEW view_low_inventory AS
SELECT item_id, item_name, item_type, quantity, unit, unit_price
FROM inventory
WHERE quantity < 20;

CREATE OR REPLACE VIEW view_farm_expenses AS
SELECT f.farm_id, f.farm_name, COALESCE(SUM(e.amount),0) AS total_expenses
FROM farms f
LEFT JOIN expenses e ON e.farm_id = f.farm_id
GROUP BY f.farm_id, f.farm_name;

CREATE OR REPLACE VIEW view_crop_sales AS
SELECT c.crop_name, COALESCE(SUM(s.quantity_sold_kg),0) AS total_sold_kg,
       COALESCE(SUM(s.quantity_sold_kg * s.price_per_kg),0) AS sales_revenue
FROM crops c
LEFT JOIN crop_cycles cc ON cc.crop_id = c.crop_id
LEFT JOIN harvests h ON h.cycle_id = cc.cycle_id
LEFT JOIN sales s ON s.harvest_id = h.harvest_id
GROUP BY c.crop_id, c.crop_name;

PART 5: STORED PROCEDURES
DROP PROCEDURE IF EXISTS sp_get_farm_expenses;
DELIMITER $$
CREATE PROCEDURE sp_get_farm_expenses(IN p_farm_id INT)
BEGIN
    SELECT f.farm_name, e.expense_date, e.category, e.amount, e.description
    FROM expenses e
    JOIN farms f ON f.farm_id = e.farm_id
    WHERE e.farm_id = p_farm_id
    ORDER BY e.expense_date;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_record_activity;
DELIMITER $$
CREATE PROCEDURE sp_record_activity(
    IN p_cycle_id INT,
    IN p_item_id INT,
    IN p_activity_type VARCHAR(80),
    IN p_activity_date DATE,
    IN p_quantity_used DECIMAL(10,2),
    IN p_cost DECIMAL(10,2)
)
BEGIN
    DECLARE v_stock DECIMAL(10,2);
    IF p_item_id IS NOT NULL THEN
        SELECT quantity INTO v_stock FROM inventory WHERE item_id = p_item_id FOR UPDATE;
        IF v_stock < p_quantity_used THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient inventory for this activity';
        END IF;
    END IF;
    INSERT INTO farm_activities
        (cycle_id, item_id, activity_type, activity_date, quantity_used, cost)
    VALUES
        (p_cycle_id, p_item_id, p_activity_type, p_activity_date, p_quantity_used, p_cost);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_revenue_by_payment;
DELIMITER $$
CREATE PROCEDURE sp_revenue_by_payment()
BEGIN
    SELECT payment_mode, SUM(quantity_sold_kg * price_per_kg) AS total_revenue,
           COUNT(*) AS sale_count
    FROM sales
    GROUP BY payment_mode;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_restock_item;
DELIMITER $$
CREATE PROCEDURE sp_restock_item(IN p_item_id INT, IN p_add_quantity DECIMAL(10,2))
BEGIN
    UPDATE inventory
    SET quantity = quantity + p_add_quantity
    WHERE item_id = p_item_id;
END $$
DELIMITER ;

PART 6: TRIGGERS AND INVENTORY LOG
CREATE TABLE inventory_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    change_quantity DECIMAL(10,2) NOT NULL,
    change_type VARCHAR(20) NOT NULL,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
);

DROP TRIGGER IF EXISTS trg_check_inventory_before_activity;
DELIMITER $$
CREATE TRIGGER trg_check_inventory_before_activity
BEFORE INSERT ON farm_activities
FOR EACH ROW
BEGIN
    DECLARE v_stock DECIMAL(10,2);
    IF NEW.item_id IS NOT NULL THEN
        SELECT quantity INTO v_stock
        FROM inventory WHERE item_id = NEW.item_id;
        IF v_stock < NEW.quantity_used THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Cannot record activity: insufficient inventory';
        END IF;
    END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_reduce_inventory_after_activity;
DELIMITER $$
CREATE TRIGGER trg_reduce_inventory_after_activity
AFTER INSERT ON farm_activities
FOR EACH ROW
BEGIN
    IF NEW.item_id IS NOT NULL AND NEW.quantity_used > 0 THEN
        UPDATE inventory
        SET quantity = quantity - NEW.quantity_used
        WHERE item_id = NEW.item_id;
        INSERT INTO inventory_log (item_id, change_quantity, change_type)
        VALUES (NEW.item_id, -NEW.quantity_used, 'USED');
    END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_log_inventory_restock;
DELIMITER $$
CREATE TRIGGER trg_log_inventory_restock
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    IF NEW.quantity > OLD.quantity THEN
        INSERT INTO inventory_log (item_id, change_quantity, change_type)
        VALUES (NEW.item_id, NEW.quantity - OLD.quantity, 'RESTOCK');
    END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_block_delete_supplier;
DELIMITER $$
CREATE TRIGGER trg_block_delete_supplier
BEFORE DELETE ON suppliers
FOR EACH ROW
BEGIN
    DECLARE v_count INT;
    SELECT COUNT(*) INTO v_count FROM inventory WHERE supplier_id = OLD.supplier_id;
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete supplier: inventory items still reference it';
    END IF;
END $$
DELIMITER ;


-- PART 7: QUERY BANK - LEVEL 1 (Q1-Q4)

-- Q1. List all farmers.
SELECT farmer_name, phone, address FROM farmers;
-- Q2. Show all seed inventory items.
SELECT item_name, quantity, unit
FROM inventory
WHERE item_type = 'Seed';

-- Q3. Find expenses above 700.
SELECT expense_id, category, amount
FROM expenses
WHERE amount > 700;

-- Q4. Show farms located in Anakapalli.
SELECT farm_name, location
FROM farms
WHERE location = 'Anakapalli';

-- PART 8: QUERY BANK - LEVEL 2 (Q5-Q8)

-- Q5. Count the number of crop cycles for each status.
SELECT cycle_status, COUNT(*) AS cycle_count
FROM crop_cycles
GROUP BY cycle_status;

-- Q6. Count inventory items supplied by each supplier.
SELECT s.supplier_name, COUNT(i.item_id) AS item_count
FROM suppliers s
LEFT JOIN inventory i ON i.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY item_count DESC;

-- Q7. Show farm, field, and farmer details.
SELECT fr.farmer_name, f.farm_name, fd.field_name, fd.area_acres
FROM farmers fr
JOIN farms f ON f.farmer_id = fr.farmer_id
JOIN fields fd ON fd.farm_id = f.farm_id
ORDER BY f.farm_id, fd.field_id;

-- Q8. Calculate total sales revenue for each payment mode.
SELECT payment_mode, SUM(quantity_sold_kg * price_per_kg) AS revenue
FROM sales
GROUP BY payment_mode
ORDER BY revenue DESC;

-- PART 9: QUERY BANK - LEVEL 3 (Q9-Q11)

-- Q9. Find the crop with the greatest quantity sold.
SELECT c.crop_name, SUM(s.quantity_sold_kg) AS total_sold_kg
FROM crops c
JOIN crop_cycles cc ON cc.crop_id = c.crop_id
JOIN harvests h ON h.cycle_id = cc.cycle_id
JOIN sales s ON s.harvest_id = h.harvest_id
GROUP BY c.crop_name
ORDER BY total_sold_kg DESC
LIMIT 1;

-- Q10. Find farms with total recorded expenses above 1500.
SELECT f.farm_name, SUM(e.amount) AS total_expenses
FROM farms f
JOIN expenses e ON e.farm_id = f.farm_id
GROUP BY f.farm_id, f.farm_name
HAVING SUM(e.amount) > 1500
ORDER BY total_expenses DESC;

-- Q11. List inventory items with fewer than 20 units and their suppliers.
SELECT i.item_name, i.quantity, i.unit, s.supplier_name
FROM inventory i
LEFT JOIN suppliers s ON s.supplier_id = i.supplier_id
WHERE i.quantity < 20;

-- PART 10: NEW QUERIES (Q12-Q21)

-- Q12. Find crop cycles sown after 1 July 2026.
SELECT cycle_id, sowing_date, cycle_status
FROM crop_cycles
WHERE sowing_date > '2026-07-01'
ORDER BY sowing_date;

-- Q13. Find the supplier of Organic Fertilizer.
SELECT i.item_name, s.supplier_name, s.phone
FROM inventory i
JOIN suppliers s ON s.supplier_id = i.supplier_id
WHERE i.item_name = 'Organic Fertilizer';

-- Q14. Calculate average sale price per kilogram.
SELECT ROUND(AVG(price_per_kg), 2) AS average_price_per_kg
FROM sales;

-- Q15. Find farmers who have no farms.
SELECT fr.farmer_name
FROM farmers fr
LEFT JOIN farms f ON f.farmer_id = fr.farmer_id
WHERE f.farm_id IS NULL;

-- Q16. Calculate total quantity harvested per crop, including crops with no harvest.
SELECT c.crop_name, COALESCE(SUM(h.quantity_kg),0) AS total_harvest_kg
FROM crops c
LEFT JOIN crop_cycles cc ON cc.crop_id = c.crop_id
LEFT JOIN harvests h ON h.cycle_id = cc.cycle_id
GROUP BY c.crop_id, c.crop_name
ORDER BY total_harvest_kg DESC;

-- Q17. Find the second-highest distinct sale price per kg.
SELECT DISTINCT price_per_kg
FROM sales
ORDER BY price_per_kg DESC
LIMIT 1 OFFSET 1;

-- Q18. Count farm activities for each crop cycle.
SELECT cycle_id, COUNT(*) AS activity_count
FROM farm_activities
GROUP BY cycle_id
ORDER BY cycle_id;

-- Q19. Find crops that have never been sold.
SELECT c.crop_name
FROM crops c
LEFT JOIN crop_cycles cc ON cc.crop_id = c.crop_id
LEFT JOIN harvests h ON h.cycle_id = cc.cycle_id
LEFT JOIN sales s ON s.harvest_id = h.harvest_id
WHERE s.sale_id IS NULL
GROUP BY c.crop_id, c.crop_name;

Q20. Calculate sales revenue by buyer.
SELECT buyer_name, SUM(quantity_sold_kg * price_per_kg) AS revenue
FROM sales
GROUP BY buyer_name
ORDER BY revenue DESC;

-- Q21. Count fields and total cultivated area per farm.
SELECT f.farm_name, COUNT(fd.field_id) AS field_count,
       COALESCE(SUM(fd.area_acres),0) AS total_area_acres
FROM farms f
LEFT JOIN fields fd ON fd.farm_id = f.farm_id
GROUP BY f.farm_id, f.farm_name
ORDER BY total_area_acres DESC;

PART 11: DEMO CALLS - VIEWS / PROCEDURES / TRIGGERS
-- Run each demo separately after the setup script.

 Views:
 SELECT * FROM view_farm_field_details;
 SELECT * FROM view_low_inventory;
 SELECT * FROM view_farm_expenses ORDER BY total_expenses DESC;
 SELECT * FROM view_crop_sales ORDER BY sales_revenue DESC;

-- Stored procedures:
CALL sp_get_farm_expenses(1);
CALL sp_record_activity(1, 1, 'Additional Seed Sowing', CURDATE(), 5, 325);
CALL sp_revenue_by_payment();
CALL sp_restock_item(5, 50);

-- Trigger audit:
SELECT * FROM inventory_log ORDER BY log_id;
The activity trigger checks stock, reduces inventory, and logs the usage.
Restocking inventory automatically creates a RESTOCK log entry.

-- Helpful verification;
 SHOW TABLES;
 SELECT * FROM farmers;
 SELECT * FROM inventory;
 SELECT * FROM sales;









