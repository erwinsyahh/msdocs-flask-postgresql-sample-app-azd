--- Insert restaurant data to table
INSERT INTO restaurant (name, street_address, description) VALUES
('Sate Khas Senayan', 'Jl. Pakubuwono VI No.2', 'Classic Indonesian restaurant known for its satay and traditional flavors in a cozy, family-friendly setting.'),
('Bunga Rampai', 'Jl. Teuku Cik Ditiro No.35', 'Elegant colonial-style restaurant offering refined Indonesian cuisine with a romantic, vintage ambiance.'),
('Social House', 'Jl. M.H. Thamrin No.1', 'Modern casual dining with international and Asian dishes, overlooking city views at Grand Indonesia Mall.'),
('Teras Dharmawangsa', 'Jl. Dharmawangsa VI No.20', 'Laid-back garden-style restaurant serving hearty Indonesian meals in a serene and green outdoor setting.'),
('Plataran Menteng', 'Jl. HOS Cokroaminoto No.42', 'Upscale heritage restaurant featuring beautifully plated Indonesian dishes in a colonial-era house setting.');

--- Create menu table
CREATE TABLE menu (
    -- This table stores the menu items for each restaurant
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    PRIMARY KEY (restaurant_id, item_name),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

--- Create review table
CREATE TABLE review_new (
    id SERIAL PRIMARY KEY,
    restaurant_id INT NOT NULL,
    review_date DATE NOT NULL,
    username VARCHAR(50) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

--- Insert data into review table
-- Reviews for Namaaz Dining (ID 1)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(1, '2025-06-10', 'foodie_jkt', 5, 'Mind-blowing presentation and flavor. Worth the price.'),
(1, '2025-06-11', 'moleculover', 4, 'Unique experience, though some dishes were too experimental.'),
(1, '2025-06-12', 'tastetraveler', 5, 'Feels like eating art! Top-notch service.'),
(1, '2025-06-14', 'culinaryqueen', 4, 'Ambience and creativity are unmatched.'),
(1, '2025-06-15', 'gastrogeek', 5, 'Unforgettable dishes that play with texture and flavor.');

-- Reviews for Sate Khas Senayan (ID 2)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(2, '2025-06-10', 'localtaste', 5, 'The sate ayam is absolutely delicious.'),
(2, '2025-06-11', 'samballover', 4, 'Great food, fast service, but a bit crowded.'),
(2, '2025-06-12', 'heritageeats', 5, 'Always reliable for authentic Indonesian meals.'),
(2, '2025-06-13', 'budgetbites', 4, 'Tasty and affordable, perfect for family dinner.'),
(2, '2025-06-14', 'kulinerindo', 5, 'Feels like home food, the sambal is addictive!');

-- Reviews for Bunga Rampai (ID 3)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(3, '2025-06-09', 'romanticdate', 5, 'Perfect for special occasions, elegant atmosphere.'),
(3, '2025-06-11', 'culinaryclassics', 4, 'Beautiful interior and tasty Indonesian dishes.'),
(3, '2025-06-13', 'foodenthusiast', 5, 'The dendeng batokok is a must-try.'),
(3, '2025-06-14', 'vintagevibes', 4, 'Service was excellent, food presentation elegant.'),
(3, '2025-06-15', 'traditiontaster', 5, 'Luxury Indonesian dining done right.');

-- Reviews for Social House (ID 4)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(4, '2025-06-10', 'viewhunter', 5, 'Amazing view and atmosphere! Loved the poke bowl.'),
(4, '2025-06-11', 'casualbites', 4, 'Good vibes and international menu variety.'),
(4, '2025-06-12', 'citydiner', 4, 'Stylish place, food quality consistent.'),
(4, '2025-06-13', 'nightout', 3, 'Great place to hang out, food could be better.'),
(4, '2025-06-14', 'cheeselover', 5, 'Truffle fries are to die for! Will be back.');

-- Reviews for Teras Dharmawangsa (ID 5)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(5, '2025-06-09', 'peacefulpalate', 5, 'Quiet garden ambiance, food is fresh and hearty.'),
(5, '2025-06-10', 'familyfeast', 4, 'Great spot for family meals, love the ayam penyet.'),
(5, '2025-06-11', 'localsfavor', 4, 'Comforting and consistent traditional food.'),
(5, '2025-06-12', 'souplover', 5, 'Sop buntut was flavorful and warming.'),
(5, '2025-06-13', 'tahutempefan', 4, 'Simple food done well, excellent value.');

-- Reviews for Plataran Menteng (ID 6)
INSERT INTO review_new (restaurant_id, review_date, username, rating, review) VALUES
(6, '2025-06-10', 'finefoodie', 5, 'Elegant decor, rendang was rich and flavorful.'),
(6, '2025-06-11', 'balibites', 5, 'Ayam Betutu brought back Bali memories!'),
(6, '2025-06-12', 'luxurytaste', 4, 'High-end pricing but premium quality experience.'),
(6, '2025-06-13', 'dessertdream', 5, 'Es Campur was the perfect finish!'),
(6, '2025-06-14', 'authentictaste', 5, 'Truly authentic dishes with classy presentation.');




--- Insert more data into menu table
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

--- CRUD operations
-- CREATE (Insert)


SELECT
* 
FROM review_new;