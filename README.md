# Skincare-Analysis-And-Recommended-System-SQL-
A MySQL-based skincare analysis and recommendation system that stores user skin profiles, skin concerns, products, ingredients, and improvement results to suggest suitable skincare products using SQL queries.

# Skincare Analysis and Recommendation System (MySQL)

This project is a database-driven skincare analysis and recommendation system developed using MySQL.  
It helps users choose suitable skincare products based on their skin type, skin concerns, and past improvement results.

## 📌 Project Objective
- To store skincare-related data in an organized database
- To analyze skin types and skin concerns
- To recommend suitable skincare products
- To track skin improvement results over time
- To generate insights using SQL queries

## 🛠️ Technologies Used
- MySQL
- MySQL Workbench

## 📂 Database Contents
The database includes the following tables:
- Users
- Skin_Profiles
- Skin_Concerns
- User_Skin_Concerns
- Products
- Ingredients
- Product_Ingredients
- Recommendations
- Product_Usage_Logs
- Skin_Analysis_Results

## 📊 Features
- Stores complete user skincare information
- Connects users, concerns, and products using relationships
- Tracks product usage and improvement scores
- Uses advanced SQL queries (JOIN, GROUP BY, HAVING, AVG, COUNT, ORDER BY)
- Helps analyze product effectiveness and user improvement

## 📈 SQL Analysis
The project includes advanced SQL queries such as:
- Top-performing products based on improvement score
- Brand effectiveness by skin type
- Most common skin concerns by age group
- Ingredient safety and usage analysis
- Users with highest improvement
- Inactive users detection

## 📁 Files Included
- `skincare_entire_database.sql` – Complete database dump including tables, data, and relationships

## ▶️ How to Use
1. Open MySQL Workbench
2. Create a new connection
3. Go to **Server → Data Import**
4. Import the `skincare_entire_database.sql` file
5. Execute the script to restore the database

## 🎓 Academic Use
This project is suitable for:
- MCA / BCA / Computer Science students
- Database Management Systems (DBMS) projects
- SQL and data analysis learning

## 👩‍💻 Author
**Keerthi Amballa**
