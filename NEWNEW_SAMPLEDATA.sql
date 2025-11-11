-- Make sure we're using the correct database
USE salon_app;

-- The 'roles' table is already populated by your script, so we start with 'users'.
-- We'll create a mix of users: admins, business owners, employees, and customers.

## Users
-- Create the base user profiles
INSERT INTO users (first_name, last_name, phone)
VALUES
('Sarah', 'Jenkins', '5550001111'),  -- uid: 1 (Admin)
('Mike', 'Lawson', '5551112222'),   -- uid: 2 (Business Owner)
('David', 'Chen', '5552223333'),    -- uid: 3 (Employee)
('Emily', 'Rodriguez', '5553334444'),-- uid: 4 (Customer)
('James', 'Smith', '5554445555'),    -- uid: 5 (Customer)
('Chloe', 'Kim', '5555556666'),      -- uid: 6 (Employee)
('Laura', 'Belmonte', '5556667777'), -- uid: 7 (Business Owner)
('Tom', 'Brier', '5557778888');        -- uid: 8 (Employee)


## Independent Tables
-- These tables don't depend on others (except 'users')

-- Addresses for the businesses
INSERT INTO addresses (street, city, state, country, zip_code)
VALUES
('123 Main St', 'Hometown', 'NY', 'USA', '10001'), -- aid: 1 (for Mike's Cuts)
('456 Oak Ave', 'Springfield', 'IL', 'USA', '62704'); -- aid: 2 (for The Glam Room)

-- Available skills/expertise for employees
INSERT INTO expertise (expertise)
VALUES
('Fades'),         -- exp_id: 1
('Coloring'),      -- exp_id: 2
('Styling'),       -- exp_id: 3
('Beard Trim'),    -- exp_id: 4
('Manicure'),      -- exp_id: 5
('Pedicure');      -- exp_id: 6

-- Example promotions
INSERT INTO promotions (start_date, end_date, is_recurring, recurr_day, start_time, end_time, title, description)
VALUES
('2025-11-10 00:00:00', '2025-11-17 23:59:59', false, null, '09:00:00', '17:00:00', 'Grand Opening Sale', '20% off all services for one week!'),
('2025-01-01 00:00:00', '2025-12-31 23:59:59', true, 'Tuesday', '10:00:00', '14:00:00', 'Two-for-Tuesday', 'Bring a friend and get 50% off the second service.');

-- Simple entry for service_time
INSERT INTO service_time (start_time) VALUES (NOW());


## Linking Tables (Group 1)
-- These tables link users to roles, businesses, and auth information.
-- NOTE: Role IDs from your script are (1: customer, 2: business, 3: employee, 4: admin)

-- Link users to their roles
INSERT INTO users_roles (uid, rid)
VALUES
(1, 4), -- Sarah (uid:1) is Admin (rid:4)
(2, 2), -- Mike (uid:2) is Business (rid:2)
(3, 3), -- David (uid:3) is Employee (rid:3)
(4, 1), -- Emily (uid:4) is Customer (rid:1)
(5, 1), -- James (uid:5) is Customer (rid:1)
(6, 3), -- Chloe (uid:6) is Employee (rid:3)
(7, 2), -- Laura (uid:7) is Business (rid:2)
(8, 3); -- Tom (uid:8) is Employee (rid:3)

-- Create customer-specific profiles
INSERT INTO customers (uid)
VALUES
(4), -- cid: 1 (Emily Rodriguez)
(5); -- cid: 2 (James Smith)

-- Create business profiles
INSERT INTO business (uid, name, aid, status)
VALUES
(2, "Mike's Cuts", 1, true),   -- bid: 1 (Owner: Mike, Address: 1)
(7, "The Glam Room", 2, true); -- bid: 2 (Owner: Laura, Address: 2)

-- Authentication info (hashes and salts are placeholders)
INSERT INTO authenticate (uid, email, pw_hash, salt)
VALUES
(1, 'sarah@admin.com', 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2', 's1a1s1a1s1a1s1a1s1a1s1a1s1a1s1a1'),
(2, 'mike@mikescuts.com', 'd4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5', 's2a2s2a2s2a2s2a2s2a2s2a2s2a2s2a2'),
(3, 'david@mikescuts.com', 'g7h8i9j0k1l2g7h8i9j0k1l2g7h8i9j0k1l2g7h8i9j0k1l2g7h8i9j0k1l2g7h8', 's3a3s3a3s3a3s3a3s3a3s3a3s3a3s3a3'),
(4, 'emily@gmail.com', 'j0k1l2m3n4o5j0k1l2m3n4o5j0k1l2m3n4o5j0k1l2m3n4o5j0k1l2m3n4o5j0k1', 's4a4s4a4s4a4s4a4s4a4s4a4s4a4s4a4'),
(5, 'james@yahoo.com', 'm3n4o5p6q7r8m3n4o5p6q7r8m3n4o5p6q7r8m3n4o5p6q7r8m3n4o5p6q7r8m3n4', 's5a5s5a5s5a5s5a5s5a5s5a5s5a5s5a5'),
(6, 'chloe@mikescuts.com', 'p6q7r8s9t0u1p6q7r8s9t0u1p6q7r8s9t0u1p6q7r8s9t0u1p6q7r8s9t0u1p6q7', 's6a6s6a6s6a6s6a6s6a6s6a6s6a6s6a6'),
(7, 'laura@glamroom.com', 's9t0u1v2w3x4s9t0u1v2w3x4s9t0u1v2w3x4s9t0u1v2w3x4s9t0u1v2w3x4s9t0', 's7a7s7a7s7a7s7a7s7a7s7a7s7a7s7a7'),
(8, 'tom@glamroom.com', 'v2w3x4y5z6a7v2w3x4y5z6a7v2w3x4y5z6a7v2w3x4y5z6a7v2w3x4y5z6a7v2w3', 's8a8s8a8s8a8s8a8s8a8s8a8s8a8s8a8');

-- Payment info for customers
INSERT INTO payment_information (uid, payment_type, card_number)
VALUES
(4, 'VISA', '4111111111111111'), -- id: 1 (Emily's card, uid:4)
(5, 'MASTERCARD', '5222222222222222'); -- id: 2 (James's card, uid:5)


## Business-Specific Data (Group 2)
-- These tables define the "contents" of each business.

-- Employee profiles, linking user profiles to businesses
INSERT INTO employee (uid, bid, approved)
VALUES
(3, 1, true), -- eid: 1 (David Chen -> Mike's Cuts)
(6, 1, true), -- eid: 2 (Chloe Kim -> Mike's Cuts)
(8, 2, true); -- eid: 3 (Tom Brier -> The Glam Room)

-- Services offered by businesses
INSERT INTO services (name, price, bid, durationMin)
VALUES
("Men's Haircut", 30.00, 1, 30),  -- sid: 1 (Mike's Cuts)
("Beard Trim", 15.00, 1, 15),     -- sid: 2 (Mike's Cuts)
("Women's Haircut", 60.00, 2, 60), -- sid: 3 (The Glam Room)
("Full Color", 120.00, 2, 180),  -- sid: 4 (The Glam Room)
("Manicure", 25.00, 2, 45);      -- sid: 5 (The Glam Room)

-- Products sold by businesses
INSERT INTO products (name, bid, price, stock, description)
VALUES
('High-Hold Pomade', 1, 18.00, 50, 'High-hold, matte finish styling pomade.'), -- pid: 1 (Mike's)
('Cedar Beard Oil', 1, 22.00, 30, 'Natural cedarwood beard oil.'),        -- pid: 2 (Mike's)
('Color-Safe Shampoo', 2, 25.00, 40, 'Sulfate-free shampoo for colored hair.'), -- pid: 3 (Glam Room)
('Classic Red Polish', 2, 10.00, 100, 'Bright red, long-lasting nail polish.'); -- pid: 4 (Glam Room)

-- Loyalty programs
INSERT INTO loyalty_programs (bid, appts_thresh, points_thresh, threshold)
VALUES
(1, true, false, 10), -- lprog_id: 1 (Mike's Cuts: 10 appts for a reward)
(2, false, true, 200); -- lprog_id: 2 (Glam Room: 200 points for a reward)

-- Define the value of points (if used)
INSERT INTO loyalty_points (bid, pts_value)
VALUES
(2, 1.00); -- For The Glam Room (bid:2), 1 point = $1 spent (assumption)

-- Customer email preferences
INSERT INTO email_subscription (cid, promotion, appointment)
VALUES
(1, true, true), -- Emily (cid: 1) wants all emails
(2, true, false); -- James (cid: 2) only wants promos


## Complex Relational Data (Group 3)
-- Linking employees to skills, schedules, carts, etc.

-- Link employees to their expertise
INSERT INTO employee_expertise (eid, exp_id)
VALUES
(1, 1), -- David (eid: 1) -> Fades (exp: 1)
(1, 4), -- David (eid: 1) -> Beard Trim (exp: 4)
(2, 2), -- Chloe (eid: 2) -> Coloring (exp: 2)
(2, 3), -- Chloe (eid: 2) -> Styling (exp: 3)
(3, 3), -- Tom (eid: 3) -> Styling (exp: 3)
(3, 5), -- Tom (eid: 3) -> Manicure (exp: 5)
(3, 6); -- Tom (eid: 3) -> Pedicure (exp: 6)

-- Employee schedules
INSERT INTO schedule (eid, day, start_time, finish_time)
VALUES
(1, 'Monday', '2025-11-17 09:00:00', '2025-11-17 17:00:00'), -- David (eid: 1)
(1, 'Tuesday', '2025-11-18 09:00:00', '2025-11-18 17:00:00'), -- David (eid: 1)
(2, 'Monday', '2025-11-17 10:00:00', '2025-11-17 18:00:00'), -- Chloe (eid: 2)
(3, 'Wednesday', '2025-11-19 10:00:00', '2025-11-19 19:00:00'); -- Tom (eid: 3)

-- Customer shopping carts
INSERT INTO cart (pid, amount, cid, bid)
VALUES
(3, 1, 1, 2); -- Emily (cid: 1) has 1 'Color-Safe Shampoo' (pid: 3) from Glam Room (bid: 2) in her cart.

-- Customer loyalty balances
INSERT INTO customer_loyalty_points (cid, bid, pts_balance)
VALUES
(1, 2, 120.00), -- Emily (cid: 1) has 120 points at The Glam Room (bid: 2)
(2, 1, 3.00);   -- James (cid: 2) has 3 appointments towards his reward at Mike's (bid: 1)

-- Define the rewards for the loyalty programs
INSERT INTO rewards (bid, lprog_id, is_appt, rwd_value)
VALUES
(1, 1, true, 1.00); -- Reward for Mike's (bid:1) prog (lprog:1) is 1 free appointment

INSERT INTO rewards (bid, lprog_id, is_price, is_discount, rwd_value)
VALUES
(2, 2, true, true, 10.00); -- Reward for Glam Room (bid:2) prog (lprog:2) is $10.00 off


## Transactional Data (Group 4)
-- Appointments, reviews, and transactions.

-- Customer appointments
INSERT INTO appointments (cid, eid, sid, start_time, expected_end_time, notes)
VALUES
(1, 3, 5, '2025-11-20 14:00:00', '2025-11-20 14:45:00', 'Wanting a french tip design.'), -- aid: 1 | Emily (cid:1) with Tom (eid:3) for Manicure (sid:5)
(2, 1, 1, '2025-11-21 10:00:00', '2025-11-21 10:30:00', 'Just a standard cut, short on sides.'); -- aid: 2 | James (cid:2) with David (eid:1) for Men's Haircut (sid:1)

-- Customer reviews
INSERT INTO reviews (cid, bid, eid, rating, comment)
VALUES
(1, 2, null, 5, "The Glam Room is beautiful! Love the atmosphere."), -- rvw_id: 1 | Emily (cid:1) reviews Glam Room (bid:2)
(2, 1, 1, 4, "David gave me a great fade. Very precise."), -- rvw_id: 2 | James (cid:2) reviews David (eid:1) at Mike's (bid:1)
(1, null, 3, 5, "Tom is the best for manicures!"); -- rvw_id: 3 | Emily (cid:1) reviews Tom (eid:3)

-- Log of loyalty transactions
INSERT INTO loyalty_transactions (cid, lprog_id)
VALUES
(1, 2), -- Emily (cid: 1) participated in the Glam Room program (lprog_id: 2)
(2, 1); -- James (cid: 2) participated in the Mike's Cuts program (lprog_id: 1)

-- Log of purchase transactions (for appointments)
INSERT INTO transactions (cid, bid, aid, amount, payment_method_id)
VALUES
(1, 2, 1, 25.00, 1), -- Emily (cid:1) pays $25.00 for appt 1 at Glam Room (bid:2) with her card (pay_id:1)
(2, 1, 2, 30.00, 2); -- James (cid:2) pays $30.00 for appt 2 at Mike's (bid:1) with his card (pay_id:2)


## Contextual Data (Group 5)
-- Replies, notes, and audit logs.

-- Replies to reviews
INSERT INTO review_replies (rvw_id, uid, comment)
VALUES
(2, 2, "Thanks James! Glad you enjoyed the cut. David is a pro."); -- Mike (uid: 2) replies to review 2

-- Notes on appointments
INSERT INTO appointment_notes (aid, author_uid, author_role, note_text)
VALUES
(1, 8, 'Employee', 'Customer loves french tips. Allergic to almond oil.'); -- Tom (uid: 8) leaves note on Emily's appt (aid: 1)

-- Example audit log entry
INSERT INTO audit (table_name, record_id, action, new_data, changed_by)
VALUES
('users', 1, 'insert', '{"uid": 1, "first_name": "Sarah", "last_name": "Jenkins"}', 'system');