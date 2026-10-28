🌾 Agriculture Farm Management System
📖 Project Overview
The Agriculture Farm Management System is a database management project developed using MySQL to simplify the management of agricultural activities. The system maintains information about farmers, farms, fields, crops, suppliers, inventory, workers, farming activities, expenses, harvests, and sales.

In traditional farming, maintaining agricultural records manually can be difficult. Farmers may face problems tracking cultivation activities, managing agricultural materials, calculating expenses, recording harvests, and maintaining sales information.

To solve these problems, this project uses a relational database to store and organize agricultural information. SQL queries help retrieve records, analyze farming expenses, track crop production, and manage agricultural activities efficiently.
🎯 Project Objectives
- Maintain farmer and farm information.
- Manage agricultural land and field details.
- Store crop information and cultivation records.
- Track sowing dates and harvesting schedules.
- Maintain supplier and inventory information.
- Manage agricultural workers and farming activities.
- Record farming expenses and operational costs.
- Maintain harvest and crop sales records.
- Retrieve information efficiently using SQL queries.
- Generate useful reports using database queries.
- Demonstrate basic, intermediate, and advanced SQL concepts.
✨ Features
- Relational database design.
- Farmer and farm management.
- Field and crop management.
- Crop cultivation tracking.
- Supplier information management.
- Inventory management for agricultural materials.
- Worker information management.
- Farm activity tracking.
- Expense management.
- Harvest and sales record management.
- Primary keys and foreign keys.
- Data integrity using database constraints.
- Insertion, updating, deletion, and retrieval of records.
- Filtering, sorting, and aggregate functions.
- Joins and subqueries for retrieving related information.
- Reports on agricultural expenses, harvests, and sales.
- Views, indexes, triggers, and stored procedures, where implemented.
🛠️ Technologies Used
- Database: MySQL
- Query Language: SQL
- Database Tool: MySQL Workbench
- Database Version: MySQL 8.0 or later
🗄️ Database Name
agriculture_farm_management

📂 Project Files
The project contains the following files:
File Name	Description
README.md	Explains the project, features, and implementation steps.
final project.sql	Contains the SQL script for creating and working with the database.
ER diagram..jpeg	Represents the database entities, attributes, and relationships.


Project folder structure:
MySQL Project/
│
├── README.md
├── final project.sql
└── ER diagram..jpeg

📋 Main Modules
1. Farmer Management: Stores farmer details, including farmer ID, name, phone number, and address.
2. Farm Management: Maintains farm information, including farm ID, farm name, location, and farmer details.
3. Field Management: Stores field information, including field ID, farm ID, field name, and area in acres.
4. Crop Management: Maintains crop details, including crop ID, crop name, growing season, and expected yield.
5. Crop Cycle Management: Tracks crop cultivation information, including field details, crop details, sowing dates, and harvest dates.
6. Supplier Management: Stores supplier information, including supplier ID, supplier name, and contact details.
7. Inventory Management: Maintains information about seeds, fertilizers, and other agricultural materials, including quantities and prices.
8. Worker Management: Stores agricultural worker information, including worker ID, worker name, farm details, and daily wages.
9. Farm Activity Management: Records farming activities, activity dates, activity types, and associated costs.
10. Expense Management: Tracks farm expenses, including operational costs and other agricultural expenses.
11. Harvest Management: Maintains harvested crop quantities and harvest dates.
12. Sales Management: Records crop sales, quantities sold, sale dates, and prices per unit.
🔗 Database Relationships
The database uses primary keys and foreign keys to establish relationships between tables.
- One farmer can manage multiple farms.
- One farm can contain multiple fields.
- One field can have multiple crop cycles over time.
- One crop can be associated with multiple crop cycles.
- One supplier can supply multiple inventory items.
- One farm can have multiple workers.
- One crop cycle can have multiple farming activity records.
- One farm can have multiple expense records.
- One crop cycle can have multiple harvest records.
- Harvest records can be associated with sales records.
These relationships help reduce unnecessary data duplication and maintain data consistency.

The exact relationships depend on the tables and foreign keys defined in final project.sql.
🖼️ ER Diagram
The Entity Relationship (ER) diagram illustrates the database structure and the relationships between different entities.

The diagram is available in the file ER diagram..jpeg.

To display the ER diagram directly on your GitHub repository page, upload the image to the repository and add the following Markdown:
![Agriculture Farm Management System ER Diagram](ER%20diagram..jpeg)

Alternatively, rename the image to ER-diagram.jpeg and use:
![Agriculture Farm Management System ER Diagram](ER-diagram.jpeg)

⚙️ SQL Concepts Implemented
🟢 Basic SQL Concepts
- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- Comparison and logical operators
- BETWEEN, IN, LIKE, and IS NULL
🟡 Intermediate SQL Concepts
- Aggregate functions: COUNT(), SUM(), AVG(), MIN(), and MAX()
- GROUP BY and HAVING
- Primary keys and foreign keys
- ALTER TABLE
- NOT NULL, UNIQUE, DEFAULT, and CHECK constraints
- Date and string functions
- Data integrity
- Database normalization
🔴 Advanced SQL Concepts
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Multiple-table joins
- Subqueries and nested queries
- Views
- Indexes
- Triggers
- Stored procedures
- Functions
- Transaction handling using COMMIT and ROLLBACK
Note: The list above describes SQL concepts relevant to this project. Only claim a concept as implemented if its corresponding SQL statements or database objects are present in your project script.
▶️ How to Run the Project
Follow these steps to execute the project using MySQL Workbench.
Step 1: Open MySQL Workbench
Open MySQL Workbench on your laptop and connect to your MySQL server.
Step 2: Open the SQL File
Open the file:

final project.sql

You can open it through File → Open SQL Script in MySQL Workbench.
Step 3: Create the Database
If the database has not already been created, execute:
CREATE DATABASE IF NOT EXISTS agriculture_farm_management;

Step 4: Select the Database
Execute the following statement:
USE agriculture_farm_management;

Step 5: Create the Tables
Execute the table creation statements from your SQL file in the correct order.

Create the parent tables before creating tables that depend on them through foreign keys.
Step 6: Insert Sample Data
Execute the INSERT INTO statements to add sample farmer, farm, crop, supplier, worker, and other records.
Step 7: Execute SQL Queries
Run the queries provided in your SQL file to retrieve and analyze agricultural information.
Step 8: Verify the Results
Use SELECT statements to verify the records and check the output grid in MySQL Workbench.
Step 9: Test Advanced Features
If your SQL file includes views, indexes, triggers, stored procedures, or transactions, execute the relevant statements and verify their behavior.
📊 Sample SQL Queries
The following examples demonstrate common operations for an Agriculture Farm Management System.

Note: These examples assume that the database uses the table and column names shown below. Modify the names if your actual SQL script uses a different schema.
1. Display All Farmers
SELECT *
FROM Farmer;

Purpose: Displays the farmer records stored in the database.
2. Display All Farms
SELECT *
FROM Farm;

Purpose: Retrieves all farm information.
3. Display All Crops
SELECT *
FROM Crop;

Purpose: Displays the registered crop details.
4. Count the Total Number of Farmers
SELECT COUNT(*) AS total_farmers
FROM Farmer;

Purpose: Counts the number of farmer records.
5. Calculate Total Farming Expenses
SELECT SUM(amount) AS total_farming_expenses
FROM Expense;

Purpose: Calculates the sum of recorded farming expenses.
6. Display Farm Details with Farmer Names
SELECT
    f.farm_id,
    f.farm_name,
    f.location,
    fr.name AS farmer_name
FROM Farm f
INNER JOIN Farmer fr
    ON f.farmer_id = fr.farmer_id;

Purpose: Displays farm information together with the name of the farmer who owns or manages each farm.
7. Display Crops with Their Cultivation Details
SELECT
    c.crop_name,
    cc.sowing_date,
    cc.harvest_date
FROM Crop c
INNER JOIN CropCycle cc
    ON c.crop_id = cc.crop_id;

Purpose: Displays crop names and their corresponding cultivation dates.

Important: These are illustrative queries. Confirm that the table and column names match your final project.sql file before executing them.
🎓 Learning Outcomes
Through this project, the following concepts can be practised and demonstrated:
- Designing and implementing a relational database.
- Creating tables with suitable data types.
- Understanding primary keys and foreign keys.
- Applying constraints to maintain data integrity.
- Inserting, updating, deleting, and retrieving records.
- Managing farmer, farm, field, and crop information.
- Writing basic and advanced SQL queries.
- Using joins and subqueries to retrieve related records.
- Applying aggregate functions to analyze farming expenses.
- Managing crop cultivation and harvest records.
- Understanding database normalization.
- Using views, indexes, triggers, and stored procedures when implemented.
- Generating meaningful reports from agricultural data.
- Executing SQL scripts using MySQL Workbench.
🔮 Future Scope
- Develop a web or mobile application for farmers.
- Integrate weather information for cultivation planning.
- Add crop recommendations based on soil and seasonal conditions.
- Improve inventory management for seeds and fertilizers.
- Integrate smart irrigation monitoring.
- Send reminders for sowing and harvesting schedules.
- Introduce crop yield prediction using machine learning.
- Develop dashboards for farm expenses, revenue, and profit analysis.
- Add equipment maintenance and worker attendance tracking.
- Integrate agricultural market prices.
- Generate automated reports for farm performance.
👩‍💻 Author
Mamathasri
Python Fullstack Trainee

MySQL Project
📝 Conclusion
The Agriculture Farm Management System provides a structured way to manage agricultural information using MySQL. It organizes farmer details, farms, fields, crops, suppliers, inventory, workers, activities, expenses, harvests, and sales in a relational database.

By applying SQL concepts, the project demonstrates how database technology can improve record management, maintain data consistency, simplify information retrieval, and support agricultural planning and decision-making.

---

## 📌 Final Step: Upload Your Files to GitHub

Your local project folder is:

`C:\Users\mamat\OneDrive\Desktop\MySQL Project`

Make sure it contains these three files:

1. `README.md`
2. `final project.sql`
3. `ER diagram..jpeg`