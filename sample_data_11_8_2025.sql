USE salon_app;

-- The 'roles' table is already populated by your original script,
-- but this ensures it, in case it was run separately.
INSERT IGNORE INTO roles (rid, name)
VALUES
	(1, "customer"),
	(2, "business"),
	(3, "employee");

-- 1. Populate independent tables first
-- --------------------------------------------------

INSERT INTO users (first_name, last_name, phone)
VALUES
	('Alice', 'Smith', '5550001111'), -- uid 1 (Business Owner 1)
	('Bob', 'Johnson', '5550002222'), -- uid 2 (Business Owner 2)
	('Carol', 'Davis', '5550003333'), -- uid 3 (Employee 1)
	('David', 'Lee', '5550004444'),   -- uid 4 (Employee 2)
	('Eve', 'Brown', '5550005555'),   -- uid 5 (Employee 3)
	('Frank', 'White', '5550006666'), -- uid 6 (Customer 1)
	('Grace', 'Kim', '5550007777');   -- uid 7 (Customer 2)

INSERT INTO addresses (street, city, state, country, zip_code)
VALUES
	('123 Main St', 'Metropolis', 'NY', 'USA', '10001'), -- aid 1
	('456 Oak Ave', 'Gotham', 'NJ', 'USA', '07001');     -- aid 2

INSERT INTO expertise (expertise)
VALUES
	('Hair Cutting'),   -- exp_id 1
	('Hair Coloring'),  -- exp_id 2
	('Barbering'),      -- exp_id 3
	('Esthetics');      -- exp_id 4

-- 2. Populate tables with 1st-level dependencies
-- --------------------------------------------------

INSERT INTO users_roles (uid, rid)
VALUES
	(1, 2), -- Alice (Business)
	(2, 2), -- Bob (Business)
	(3, 3), -- Carol (Employee)
	(4, 3), -- David (Employee)
	(5, 3), -- Eve (Employee)
	(6, 1), -- Frank (Customer)
	(7, 1); -- Grace (Customer)

INSERT INTO customers (uid)
VALUES
	(6), -- cid 1 (Frank)
	(7); -- cid 2 (Grace)

INSERT INTO business (uid, name, aid, status)
VALUES
	(1, 'Shear Elegance', 1, true), -- bid 1 (Owned by Alice)
	(2, 'The Modern Man', 2, true);  -- bid 2 (Owned by Bob)

INSERT INTO authenticate (uid, email, pw_hash, salt)
VALUES
	(1, 'alice@salon.com', 'a_hash_value_64_chars_long_..._a', 'a_salt_value_32_chars_long_..._a'),
	(2, 'bob@salon.com', 'b_hash_value_64_chars_long_..._b', 'b_salt_value_32_chars_long_..._b'),
	(3, 'carol@salon.com', 'c_hash_value_64_chars_long_..._c', 'c_salt_value_32_chars_long_..._c'),
	(4, 'david@salon.com', 'd_hash_value_64_chars_long_..._d', 'd_salt_value_32_chars_long_..._d'),
	(5, 'eve@salon.com', 'e_hash_value_64_chars_long_..._e', 'e_salt_value_32_chars_long_..._e'),
	(6, 'frank@client.com', 'f_hash_value_64_chars_long_..._f', 'f_salt_value_32_chars_long_..._f'),
	(7, 'grace@client.com', 'g_hash_value_64_chars_long_..._g', 'g_salt_value_32_chars_long_..._g');

INSERT INTO payment_information (uid, payment_type, card_number)
VALUES
	(6, 'Credit', '4111111111111111'), -- Frank's card
	(7, 'Debit', '5222222222222222');  -- Grace's card

-- 3. Populate tables with 2nd-level dependencies
-- --------------------------------------------------

INSERT INTO employee (uid, bid, approved)
VALUES
	(3, 1, true), -- eid 1 (Carol at Shear Elegance)
	(4, 2, true), -- eid 2 (David at The Modern Man)
	(5, 1, true); -- eid 3 (Eve at Shear Elegance)

INSERT INTO services (name, price, bid)
VALUES
	('Womens Cut', 65.00, 1),  -- sid 1 (Shear Elegance)
	('Color & Highlights', 120.00, 1), -- sid 2 (Shear Elegance)
	('Mens Cut', 40.00, 2),    -- sid 3 (The Modern Man)
	('Beard Trim', 25.00, 2);  -- sid 4 (The Modern Man)

INSERT INTO products (name, bid, price, stock, description)
VALUES
	('Volumizing Shampoo', 1, 28.50, 50, 'Adds body and shine.'), -- pid 1
	('Beard Oil', 2, 22.00, 75, 'Premium sandalwood scent.');      -- pid 2

INSERT INTO loyalty_programs (bid, appts_thresh, threshold)
VALUES
	(1, true, 10); -- lprog_id 1 (Shear Elegance: 10 appts for reward)

INSERT INTO loyalty_programs (bid, points_thresh, threshold)
VALUES
	(2, true, 1000); -- lprog_id 2 (The Modern Man: 1000 points for reward)

INSERT INTO loyalty_points (bid, pts_value)
VALUES
	(2, 1.00); -- The Modern Man gives 1 point per $1 spent

INSERT INTO email_subscription (uid, cid, promotion, appointment)
VALUES
	(6, 1, true, true), -- Frank
	(7, 2, true, false); -- Grace (no appointment emails)

-- 4. Populate tables with 3rd-level dependencies
-- --------------------------------------------------

INSERT INTO employee_expertise (eid, exp_id)
VALUES
	(1, 1), -- Carol (eid 1) -> Cutting (exp_id 1)
	(1, 2), -- Carol (eid 1) -> Coloring (exp_id 2)
	(2, 1), -- David (eid 2) -> Cutting (exp_id 1)
	(2, 3), -- David (eid 2) -> Barbering (exp_id 3)
	(3, 2), -- Eve (eid 3) -> Coloring (exp_id 2)
	(3, 4); -- Eve (eid 3) -> Esthetics (exp_id 4)

INSERT INTO schedule (eid, start_time, finish_time)
VALUES
	(1, '2025-11-10 09:00:00', '2025-11-10 17:00:00'), -- Carol's shift
	(2, '2025-11-10 10:00:00', '2025-11-10 18:00:00'); -- David's shift

INSERT INTO appointments (cid, eid, sid, start_time, expected_end_time, notes)
VALUES
	-- Grace (cid 2) books with Carol (eid 1) for Color (sid 2)
	(2, 1, 2, '2025-11-10 11:00:00', '2025-11-10 13:00:00', 'Looking for balayage.'), -- aid 1
	-- Frank (cid 1) books with David (eid 2) for Mens Cut (sid 3)
	(1, 2, 3, '2025-11-10 14:00:00', '2025-11-10 14:30:00', 'Just a trim.');         -- aid 2

INSERT INTO reviews (cid, bid, eid, rating, comment)
VALUES
	-- Frank (cid 1) reviews The Modern Man (bid 2)
	(1, 2, null, 5, 'Great atmosphere and a perfect cut. David is a master.'),
	-- Grace (cid 2) reviews Carol (eid 1) specifically
	(2, null, 1, 5, 'Carol is an artist! My color has never looked better.');

INSERT INTO cart (pid, amount, cid, bid)
VALUES
	(2, 1, 1, 2); -- Frank (cid 1) has 1 Beard Oil (pid 2) from The Modern Man (bid 2) in his cart

INSERT INTO rewards (bid, lprog_id, is_appt, rwd_value)
VALUES
	(1, 1, true, 1.00); -- Reward for lprog 1 is 1 free appointment

INSERT INTO promotions (lprog_id, start_date, end_date, start_time, end_time, title, description)
VALUES
	(1, '2025-12-01 00:00:00', '2025-12-24 23:59:59', '09:00:00', '17:00:00', 'Holiday Special', 'Get 10% off all color services in December.');

INSERT INTO loyalty_transactions (cid, lprog_id)
VALUES
	(1, 2), -- Frank is part of The Modern Man's program
	(2, 1); -- Grace is part of Shear Elegance's program

-- 5. Populate tables with 4th-level dependencies
-- --------------------------------------------------

INSERT INTO review_replies (rvw_id, uid, comment)
VALUES
	-- Bob (uid 2, owner of bid 2) replies to Frank's review (rvw_id 1)
	(1, 2, 'Thanks, Frank! Glad you enjoyed it. See you next time!');

INSERT INTO services_booked (aid, sid)
VALUES
	(1, 2), -- Appt 1 booked Service 2
	(2, 3); -- Appt 2 booked Service 3

INSERT INTO services_provided (aid, sid)
VALUES
	(2, 3); -- Let's say Frank's appointment (aid 2) is completed