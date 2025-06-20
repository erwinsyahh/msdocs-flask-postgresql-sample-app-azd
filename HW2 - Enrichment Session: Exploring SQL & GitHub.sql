--- A. Database Setup
--- 1. Create a new database for the restaurant reviews
-- DROP DATABASE IF EXISTS restaurant_reviews;
CREATE DATABASE restaurant_reviews;
-- Check if database was created successfully
SELECT datname 
FROM pg_database 
WHERE datistemplate = false;
--- 2. Create 2 Tables
-- a. Restaurant Table  
-- DROP TABLE IF EXISTS restaurant;
CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);
--- b. Review Table
-- DROP TABLE IF EXISTS review;
CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    restaurant_id INT NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);

--- B. Inserting Data
--- 1. Insert at least 3 restaurants into the restaurant table
INSERT INTO restaurant (name, street_address, description) VALUES
('Sate Khas Senayan', 'Jl. Pakubuwono VI No.2', 'Classic Indonesian restaurant known for its satay and traditional flavors in a cozy, family-friendly setting.'),
('Bunga Rampai', 'Jl. Teuku Cik Ditiro No.35', 'Elegant colonial-style restaurant offering refined Indonesian cuisine with a romantic, vintage ambiance.'),
('Social House', 'Jl. M.H. Thamrin No.1', 'Modern casual dining with international and Asian dishes, overlooking city views at Grand Indonesia Mall.'),
('Teras Dharmawangsa', 'Jl. Dharmawangsa VI No.20', 'Laid-back garden-style restaurant serving hearty Indonesian meals in a serene and green outdoor setting.'),
('Plataran Menteng', 'Jl. HOS Cokroaminoto No.42', 'Upscale heritage restaurant featuring beautifully plated Indonesian dishes in a colonial-era house setting.');

--- 2. Insert at least 5 reviews into the review table
INSERT INTO review (restaurant_id, review_date, user_name, rating, review_text) VALUES
(1, '2025-06-10', 'localtaste', 5, 'The sate ayam is absolutely delicious.'),
(1, '2025-06-11', 'samballover', 4, 'Great food, fast service, but a bit crowded.'),
(1, '2025-06-12', 'heritageeats', 5, 'Always reliable for authentic Indonesian meals.'),
(1, '2025-06-13', 'budgetbites', 4, 'Tasty and affordable, perfect for family dinner.'),
(1, '2025-06-14', 'kulinerindo', 5, 'Feels like home food, the sambal is addictive!'),
(2, '2025-06-09', 'romanticdate', 5, 'Perfect for special occasions, elegant atmosphere.'),
(2, '2025-06-11', 'culinaryclassics', 4, 'Beautiful interior and tasty Indonesian dishes.'),
(2, '2025-06-13', 'foodenthusiast', 5, 'The dendeng batokok is a must-try.'),
(2, '2025-06-14', 'vintagevibes', 4, 'Service was excellent, food presentation elegant.'),
(2, '2025-06-15', 'traditiontaster', 5, 'Luxury Indonesian dining done right.'),
(3, '2025-06-10', 'viewhunter', 5, 'Amazing view and atmosphere! Loved the poke bowl.'),
(3, '2025-06-11', 'casualbites', 4, 'Good vibes and international menu variety.'),
(3, '2025-06-12', 'citydiner', 4, 'Stylish place, food quality consistent.'),
(3, '2025-06-13', 'nightout', 3, 'Great place to hang out, food could be better.'),
(3, '2025-06-14', 'cheeselover', 5, 'Truffle fries are to die for! Will be back.'),
(4, '2025-06-09', 'peacefulpalate', 5, 'Quiet garden ambiance, food is fresh and hearty.'),
(4, '2025-06-10', 'familyfeast', 4, 'Great spot for family meals, love the ayam penyet.'),
(4, '2025-06-11', 'localsfavor', 4, 'Comforting and consistent traditional food.'),
(4, '2025-06-12', 'souplover', 5, 'Sop buntut was flavorful and warming.'),
(4, '2025-06-13', 'tahutempefan', 4, 'Simple food done well, excellent value.'),
(5, '2025-06-10', 'finefoodie', 5, 'Elegant decor, rendang was rich and flavorful.'),
(5, '2025-06-11', 'balibites', 5, 'Ayam Betutu brought back Bali memories!'),
(5, '2025-06-12', 'luxurytaste', 4, 'High-end pricing but premium quality experience.'),
(5, '2025-06-13', 'dessertdream', 5, 'Es Campur was the perfect finish!'),
(5, '2025-06-14', 'authentictaste', 5, 'Truly authentic dishes with classy presentation.');

--- C. Perform CRUD Operations 
--- 1. Create (Insert)
-- Insert a new restaurant to restaurant table
INSERT INTO restaurant (name, street_address, description) VALUES
('Warung Kopi Kita', 'Jl. Kebon Sirih No.10', 'Cozy coffee shop and restaurant serving traditional Indonesian snacks and beverages in a relaxed setting.');
-- Insert a new review for an existing restaurant
INSERT INTO review (restaurant_id, review_date, user_name, rating, review_text) VALUES
(6, '2025-06-15', 'kopipisang', 5, 'Great coffee and the pisang goreng is a must-try!');

--- 2. Read (Select)
-- a. Retrieve all reviews for a specific restaurant using restaurant_id
SELECT r.name AS restaurant_name, rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM review rv
JOIN restaurant r ON rv.restaurant_id = r.id
WHERE r.id = 5
ORDER BY rv.review_date;
-- b. Retrieve all reviews with ratings 4 or higher
SELECT r.name AS restaurant_name, rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM review rv
JOIN restaurant r ON rv.restaurant_id = r.id
WHERE rv.rating >= 4
ORDER BY rv.rating DESC, rv.review_date;
-- c. Use JOIN to display a list of all restaurants along with their reviews
SELECT r.name AS restaurant_name, r.street_address, rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM restaurant r
LEFT JOIN review rv ON r.id = rv.restaurant_id
ORDER BY r.name, rv.review_date; 

--- 3. Update
-- a. Update the description of a restaurant
UPDATE restaurant
SET description = 'Brand new hype yet cozy coffee shop serving traditional Indonesian snacks and beverages with relaxing interior.'
WHERE name = 'Warung Kopi Kita';
-- b. Update the rating of a review
UPDATE review
SET rating = 2, review_text = 'Great coffee and the pisang goreng is a must-try! But the service was slow.'
WHERE user_name = 'kopipisang' AND restaurant_id = 6;

--- 4. Delete
-- a. Delete a review based on id
DELETE FROM review WHERE id = 26;  -- Deleting bad review for 'Warung Kopi Kita'
-- b. Delete a restaurant and ensure all its reviews are also deleted using CASCADE
DELETE FROM restaurant WHERE id = 1;  -- Deleting 'Sate Khas Senayan' and all its reviews

--- D. Additional Queries
-- 1. Find highest rated restaurant based on average rating of its reviews
SELECT r.name AS restaurant_name, AVG(rv.rating) AS average_rating
FROM restaurant r
JOIN review rv ON r.id = rv.restaurant_id
GROUP BY r.id
ORDER BY average_rating DESC
LIMIT 1;
-- 2. Find the number of reviews each restaurant has received
SELECT r.name AS restaurant_name, COUNT(rv.id) AS review_count
FROM restaurant r
LEFT JOIN review rv ON r.id = rv.restaurant_id
GROUP BY r.id
ORDER BY review_count DESC;
-- 3. Display the most recent review for each restaurant
SELECT r.name AS restaurant_name, rv.user_name, rv.rating, rv.review_text, rv.review_date
FROM restaurant r
JOIN review rv ON r.id = rv.restaurant_id
WHERE rv.review_date = (SELECT MAX(review_date)
FROM review
WHERE restaurant_id = r.id)
ORDER BY r.name, rv.review_date DESC;

--- E. Extra Credit (Optional))
-- 1. Create a menu table and insert at least 3 menu items for each restaurant
-- DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY (restaurant_id, item_name),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);

-- Insert data into menu table
INSERT INTO menu (restaurant_id, item_name, price, description) VALUES
(2, 'Nasi Kuning Komplit', 95000.00, 'Yellow rice platter with ayam opor, sambal goreng, and perkedel.'),
(2, 'Dendeng Batokok', 110000.00, 'Minang-style thin beef slices grilled with chili sambal.'),
(2, 'Klepon Cake', 55000.00, 'Modern dessert twist on traditional green rice cake filled with palm sugar.'),
(3, 'Truffle Fries', 75000.00, 'Crispy shoestring fries tossed with truffle oil and parmesan.'),
(3, 'Salmon Poke Bowl', 125000.00, 'Hawaiian-inspired bowl with salmon sashimi, avocado, and sesame dressing.'),
(3, 'Spaghetti Aglio e Olio', 95000.00, 'Simple yet flavorful pasta with garlic, olive oil, and chili flakes.'),
(4, 'Ayam Penyet', 60000.00, 'Smashed fried chicken served with sambal and rice.'),
(4, 'Tahu Tempe', 40000.00, 'Fried tofu and tempeh served with spicy soy sauce.'),
(4, 'Sop Buntut', 80000.00, 'Oxtail soup with vegetables and aromatic spices.'),
(5, 'Beef Rendang', 150000.00, 'Slow-cooked beef in rich coconut milk and spices.'),
(5, 'Ayam Betutu', 120000.00, 'Balinese-style chicken marinated with spices and wrapped in banana leaves.'),
(5, 'Es Campur', 50000.00, 'Refreshing mixed Indonesian dessert with fruits and shaved ice.');

-- 2. Write a query to display each restaurant with its menu and the average rating of its reviews
SELECT r.name AS restaurant_name, m.item_name, m.price, m.description, AVG(rv.rating) AS average_rating
FROM restaurant r
LEFT JOIN menu m ON r.id = m.restaurant_id
LEFT JOIN review rv ON r.id = rv.restaurant_id
GROUP BY r.id, m.item_name, m.price, m.description
ORDER BY r.name, m.item_name;