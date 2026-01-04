-- 1) Top 5 products with highest average improvement per concern:

SELECT p.Product_Name, s.Concern_Name, AVG(sar.Improvement_Score) AS Avg_Improvement
FROM Recommendations r
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Analysis_Results sar ON r.User_Id = sar.User_Id AND r.Concern_Id = sar.Concern_Id
JOIN Skin_Concerns s ON r.Concern_Id = s.Concern_Id
GROUP BY p.Product_Name, s.Concern_Name
ORDER BY Avg_Improvement DESC
LIMIT 5;

-- 2) Top 5 brands per skin type by improvement:
SELECT sp.Skin_Type, p.Brand, AVG(sar.Improvement_Score) AS Avg_Improvement
FROM Recommendations r
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Analysis_Results sar ON r.User_Id = sar.User_Id AND r.Concern_Id = sar.Concern_Id
JOIN Skin_Profiles sp ON sar.User_Id = sp.User_Id
GROUP BY sp.Skin_Type, p.Brand
ORDER BY Avg_Improvement DESC, sp.Skin_Type;

-- 3) Ingredient Safety Summary

SELECT i.Purpose, i.Safety_Rating, COUNT(DISTINCT pi.Product_Id) AS Product_Count
FROM Ingredients i
JOIN Product_Ingredients pi ON i.Ingredient_Id = pi.Ingredient_Id
GROUP BY i.Purpose, i.Safety_Rating
ORDER BY Product_Count DESC;

-- 4) Most Recommended Products for Sensitive Skin Users

SELECT p.Product_Name, COUNT(r.Recommendation_Id) AS Recommendation_Count
FROM Recommendations r
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Profiles sp ON r.User_Id = sp.User_Id
WHERE sp.Skin_Type = 'Sensitive'
GROUP BY p.Product_Name
ORDER BY Recommendation_Count DESC
LIMIT 5;

-- 5) Users Who Used Multiple Products for Same Concern
SELECT u.Full_Name, s.Concern_Name, COUNT(DISTINCT r.Product_Id) AS Product_Count
FROM Recommendations r
JOIN Users_Table u ON r.User_Id = u.User_Id
JOIN Skin_Concerns s ON r.Concern_Id = s.Concern_Id
GROUP BY u.Full_Name, s.Concern_Name
HAVING COUNT(DISTINCT r.Product_Id) > 1
ORDER BY Product_Count DESC;


-- 6) Shows ingredients used in the most products.
SELECT 
    i.Ingredient_Name,
    i.Purpose,
    COUNT(DISTINCT pi.Product_Id) AS Products_Used_In
FROM Product_Ingredients pi
JOIN Ingredients i ON pi.Ingredient_Id = i.Ingredient_Id
GROUP BY i.Ingredient_Id
ORDER BY Products_Used_In DESC;



-- 7) Most Common Concerns per Age Group
SELECT CASE 
         WHEN u.Age BETWEEN 15 AND 20 THEN '15-20'
         WHEN u.Age BETWEEN 21 AND 30 THEN '21-30'
         WHEN u.Age BETWEEN 31 AND 40 THEN '31-40'
         ELSE '41-80' END AS Age_Group,
       s.Concern_Name, COUNT(*) AS Concern_Count
FROM User_Skin_Concerns usc
JOIN Users_Table u ON usc.User_Id = u.User_Id
JOIN Skin_Concerns s ON usc.Concern_Id = s.Concern_Id
GROUP BY Age_Group, s.Concern_Name
ORDER BY Age_Group, Concern_Count DESC;

-- 8) Top products improving multiple concerns for users
SELECT p.Product_Name, COUNT(DISTINCT sar.Concern_Id) AS Concern_Coverage
FROM Recommendations r
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Analysis_Results sar ON r.User_Id = sar.User_Id AND r.Concern_Id = sar.Concern_Id
GROUP BY p.Product_Name
ORDER BY Concern_Coverage DESC limit 5;


-- 9) Top products by gender
SELECT u.Gender, p.Product_Name, AVG(sar.Improvement_Score) AS Avg_Improvement
FROM Recommendations r
JOIN Users_Table u ON r.User_Id = u.User_Id
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Analysis_Results sar ON sar.User_Id = r.User_Id AND sar.Concern_Id = r.Concern_Id
GROUP BY u.Gender, p.Product_Name
ORDER BY u.Gender, Avg_Improvement DESC ; 

-- 10) Products by Category and Average Price
SELECT Category, COUNT(Product_Id) AS Total_Products,
    ROUND(AVG(Price),2) AS Avg_Price, MIN(Price) AS Min_Price,
	MAX(Price) AS Max_Price FROM Products
GROUP BY Category
ORDER BY Total_Products DESC;

-- 11) Users with worsening skin (negative improvement)
SELECT u.Full_Name, sc.Concern_Name, sir.Improvement_Score
FROM Skin_Analysis_Results sir
JOIN Users_Table u ON sir.User_Id = u.User_Id
JOIN Skin_Concerns sc ON sir.Concern_Id = sc.Concern_Id
WHERE sir.Improvement_Score < 0
ORDER BY sir.Improvement_Score limit 5;

-- 12) Users and Their Recommended Products
SELECT u.Full_Name,
    GROUP_CONCAT(DISTINCT p.Product_Name ORDER BY p.Product_Name SEPARATOR ', ') AS Products_Recommended,
    COUNT(r.Recommendation_Id) AS Total_Recommendations,
    COUNT(DISTINCT r.Product_Id) AS Unique_Products_Recommended
FROM Recommendations r
JOIN Users_Table u ON r.User_Id = u.User_Id
JOIN Products p ON r.Product_Id = p.Product_Id
GROUP BY u.Full_Name
ORDER BY Total_Recommendations DESC, Unique_Products_Recommended DESC;



-- 15) Top Users by Improvement Score
SELECT  u.Full_Name,
    COUNT(sar.Concern_Id) AS Concerns_Tracked,
    ROUND(AVG(sar.Improvement_Score),2) AS Avg_Improvement
FROM Skin_Analysis_Results sar
JOIN Users_Table u ON sar.User_Id = u.User_Id
GROUP BY u.User_Id
ORDER BY Avg_Improvement DESC, Concerns_Tracked DESC limit 5;

-- 17) Users Who Improved Most for Acne
SELECT u.Full_Name, r.Improvement_Score
FROM Skin_Analysis_Results r
JOIN Users_Table u ON r.User_Id = u.User_Id
JOIN Skin_Concerns s ON r.Concern_Id = s.Concern_Id
WHERE s.Concern_Name LIKE '%Acne%'
ORDER BY r.Improvement_Score DESC LIMIT 5;

-- 16) Users with No Product Usage in Last 3 Months
SELECT u.Full_Name, u.location
FROM Users_Table u
WHERE u.User_Id NOT IN (
    SELECT DISTINCT User_Id
    FROM Product_Usage_Logs
    WHERE Usage_Date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH));

-- 16) Users Using More Than 1 Product with Product Names
SELECT 
    u.Full_Name, 
    COUNT(DISTINCT pul.Product_Id) AS Products_Used,
    GROUP_CONCAT(DISTINCT p.Product_Name ORDER BY p.Product_Name SEPARATOR ', ') AS Product_Names
FROM Product_Usage_Logs pul
JOIN Users_Table u ON pul.User_Id = u.User_Id
JOIN Products p ON pul.Product_Id = p.Product_Id
GROUP BY u.Full_Name
HAVING Products_Used > 1
ORDER BY Products_Used DESC;

-- 13) Products Never Used by Any User
SELECT p.Product_Name FROM Products p
LEFT JOIN Product_Usage_Logs pul ON p.Product_Id = pul.Product_Id
WHERE pul.Product_Id IS NULL;


-- 18) Users Active for More Than 6 Months
SELECT 
    u.Full_Name,
    DATEDIFF(CURDATE(), MIN(pul.Usage_Date)) AS Active_Days
FROM Users_Table u
JOIN Product_Usage_Logs pul ON u.User_Id = pul.User_Id
GROUP BY u.Full_Name
HAVING Active_Days >= 180
ORDER BY Active_Days DESC limit 10;

-- 18) Cities with the Highest Number of Skincare Users
SELECT  u.location,
COUNT(DISTINCT u.User_Id) AS User_Count
FROM Users_Table u GROUP BY u.location
ORDER BY User_Count DESC LIMIT 10;


-- 20) Products with Multiple Active Ingredients
SELECT 
    p.Product_Name,
    COUNT(DISTINCT pi.Ingredient_Id) AS Active_Ingredients_Count,
    GROUP_CONCAT(DISTINCT i.Ingredient_Name SEPARATOR ', ') AS Ingredients
FROM Products p
JOIN Product_Ingredients pi ON p.Product_Id = pi.Product_Id
JOIN Ingredients i ON pi.Ingredient_Id = i.Ingredient_Id
GROUP BY p.Product_Name
HAVING Active_Ingredients_Count > 1
ORDER BY Active_Ingredients_Count DESC;


-- 19) Users Per Month
SELECT DATE_FORMAT(created_at, '%Y-%m') AS Month,
COUNT(User_Id) AS New_Users  FROM Users_Table
GROUP BY Month ORDER by New_Users desc limit 5;

-- 20 Rank Products by Effectiveness
SELECT p.Product_Name,
    ROUND(AVG(sar.Improvement_Score),2) AS Avg_Improvement,
    Dense_RANK() OVER (ORDER BY AVG(sar.Improvement_Score) DESC) AS Product_Rank
FROM Recommendations r
JOIN Products p ON r.Product_Id = p.Product_Id
JOIN Skin_Analysis_Results sar ON r.User_Id = sar.User_Id AND r.Concern_Id = sar.Concern_Id
GROUP BY p.Product_Name
ORDER BY Product_Rank;


-- 23) Users Spending the Most on Skincare
SELECT 
    u.Full_Name,
    SUM(p.Price) AS Total_Spending
FROM Product_Usage_Logs pul
JOIN Users_Table u ON pul.User_Id = u.User_Id
JOIN Products p ON pul.Product_Id = p.Product_Id
GROUP BY u.Full_Name
ORDER BY Total_Spending DESC
LIMIT 10;


-- Users Using Products from Multiple Brands

SELECT u.Full_Name, COUNT(DISTINCT p.Brand) AS Brand_Count
FROM Product_Usage_Logs pul
JOIN Users_Table u ON pul.User_Id = u.User_Id
JOIN Products p ON pul.Product_Id = p.Product_Id
GROUP BY u.User_Id
HAVING COUNT(DISTINCT p.Brand) > 1
ORDER BY Brand_Count DESC;

-- Products That Cover Multiple Age Groups
SELECT p.Product_Name, COUNT(DISTINCT u.Age) AS Age_Coverage
FROM Product_Usage_Logs pul
JOIN Products p ON pul.Product_Id = p.Product_Id
JOIN Users_Table u ON pul.User_Id = u.User_Id
GROUP BY p.Product_Name
ORDER BY Age_Coverage DESC;

