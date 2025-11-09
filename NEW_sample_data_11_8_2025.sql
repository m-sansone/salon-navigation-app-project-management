/*
 * ===========================================
 * MOCK DATA FOR 'salon_app' (V2)
 * ===========================================
 * Constraint: loyalty_programs allows only one
 * threshold type (bool) to be true at a time.
 */

USE salon_app;

/* * 1. Independent Tables (No FKs)
 */

-- expertise: Available skills
INSERT INTO expertise (expertise) 
VALUES 
    ('Hair Cutting'), 
    ('Hair Coloring'), 
    ('Styling'), 
    ('Manicure'),
    ('Pedicure');

-- addresses: Location for the business
INSERT INTO addresses (street, city, state, country, zip_code) 
VALUES 
    ('123 Glamour Ave', 'Beverly Hills', 'CA', 'USA', '90210'), 
    ('456 Style St', 'New York', 'NY', 'USA', '10001');

/* * 2. Core User & Role Setup
 */

-- users: Create all user accounts
INSERT INTO users (first_name, last_name, phone) 
VALUES
    ('Alice', 'Smith', '5551234567'), -- uid 1 (Customer)
    ('Bob', 'Johnson', '5552345678'), -- uid 2 (Customer)
    ('Carol', 'White', '5553456789'), -- uid 3 (Business Owner)
    ('David', 'Brown', '5554567890'), -- uid 4 (Employee)
    ('Emily', 'Davis', '5555678901'); -- uid 5 (Employee)

-- users_roles: Assign roles to users
-- (Assumes rid 1="customer", 2="business", 3="employee" from your script)
INSERT INTO users_roles (uid, rid) 
VALUES
    (1, 1), -- Alice is a customer
    (2, 1), -- Bob is a customer
    (3, 2), -- Carol is a business owner
    (4, 3), -- David is an employee
    (5, 3); -- Emily is an employee

-- authenticate: Login info for users
INSERT INTO authenticate (uid, email, pw_hash, salt) 
VALUES
    (1, 'alice@email.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1f8a7f1a3d5e4b9f8a7b6c5d4e3f2a1b'),
    (2, 'bob@email.com', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb9', '2a9b8c7d6e5f4a3b2c1d0e9f8a7b6c5d'),
    (3, 'carol@salon.com', 'c3228549323c4675b068694857b850495f553e839e0970a48b598d4f6c7a7b8e', '3b0c9d8e7f6a5b4c3d2e1f0a9b8c7d6e'),
    (4)
, 'david@salon.com', 'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', '4c1d0e9f8a7b6c5d4e3f2a1b0c9d8e7f'),
    (5, 'emily@salon.com', 'e57715f4e3c3b5b1a6b0c8a6f3b0c8a6f3b0c8a6f3b0c8a6f3b0c8a6f3b0c8a6', '5d2e1f0a9b8c7d6e5f4a3b2c1d0e9f8a');

/* * 3. Role-Specific Tables (Customers, Business, Employees)
 */

-- customers: Create customer profiles
INSERT INTO customers (uid) 
VALUES 
    (1), -- cid 1 is Alice
    (2); -- cid 2 is Bob

-- business: Create the salon, owned by Carol (uid 3) at address 1
INSERT INTO business (uid, name, aid, status) 
VALUES 
    (3, 'Carol\'s Cuts', 1, true); -- bid 1

-- employee: Create employee profiles for David (uid 4) and Emily (uid 5)
INSERT INTO employee (uid, bid, approved) 
VALUES
    (4, 1, true), -- eid 1 (David) works at Carol's Cuts (bid 1)
    (5, 1, true); -- eid 2 (Emily) works at Carol's Cuts (bid 1)

-- employee_expertise: Assign skills to employees
INSERT INTO employee_expertise (eid, exp_id) 
VALUES
    (1, 1), -- David (eid 1) does Hair Cutting (exp_id 1)
    (1, 3), -- David (eid 1) also does Styling (exp_id 3)
    (2, 2), -- Emily (eid 2) does Hair Coloring (exp_id 2)
    (2, 4); -- Emily (eid 2) also does Manicures (exp_id 4)

/* * 4. Business-Specific Details (Services, Products, Schedule)
 */

-- schedule: Set employee work hours
INSERT INTO schedule (eid, start_time, finish_time) 
VALUES
    (1, '2025-11-10 09:00:00', '2025-11-10 17:00:00'), -- David works Mon 9-5
    (1, '2025-11-11 09:00:00', '2025-11-11 17:00:00'), -- David works Tue 9-5
    (2, '2025-11-10 10:00:00', '2025-11-10 18:00:00'), -- Emily works Mon 10-6
    (2, '2025-11-12 10:00:00', '2025-11-12 18:00:00'); -- Emily works Wed 10-6

-- services: Services offered by Carol's Cuts (bid 1)
INSERT INTO services (name, price, bid, durationMin) 
VALUES
    ('Men\'s Haircut', 45.00, 1, 30),  -- sid 1
    ('Women\'s Haircut', 65.00, 1, 60),  -- sid 2
    ('Full Color', 120.00, 1, 120), -- sid 3
    ('Classic Manicure', 30.00, 1, 45); -- sid 4

-- products: Products sold at Carol's Cuts (bid 1)
INSERT INTO products (name, bid, price, stock, description) 
VALUES
    ('Premium Shampoo', 1, 25.00, 50, 'Nourishing shampoo for all hair types.'), -- pid 1
    ('Styling Gel', 1, 18.50, 30, 'Strong hold styling gel.'), -- pid 2
    ('Nail Polish (Red)', 1, 12.00, 25, 'Classic red nail polish.'); -- pid 3

/* * 5. Customer Activity (Appointments, Reviews, Cart)
 */

-- appointments: Customers booking appointments
INSERT INTO appointments (cid, eid, sid, start_time, expected_end_time, notes) 
VALUES
    (1, 1, 1, '2025-11-10 10:00:00', '2025-11-10 10:30:00', 'Alice (cid 1) with David (eid 1) for Men\'s Haircut (sid 1)'),
    (2, 2, 3, '2025-11-10 11:00:00', '2025-11-10 13:00:00', 'Bob (cid 2) with Emily (eid 2) for Full Color (sid 3)');

-- services_booked: (This table seems redundant with appointments.sid, but populating per schema)
INSERT INTO services_booked (aid, sid) 
VALUES 
    (1, 1), -- Appointment 1, Service 1
    (2, 3); -- Appointment 2, Service 3

-- services_provided: (Assuming appointment 1 is complete)
INSERT INTO services_provided (aid, sid) 
VALUES 
    (1, 1); -- Appointment 1, Service 1 has been provided

-- reviews: Customers leaving feedback
INSERT INTO reviews (cid, bid, eid, rating, comment) 
VALUES
    (1, 1, NULL, 5, 'Great salon! Very clean and professional. Will be back!'), -- Alice (cid 1) reviews the business (bid 1)
    (2, NULL, 2, 4, 'Emily did a great job on my color, but it took a little longer than expected.'); -- Bob (cid 2) reviews employee Emily (eid 2)

-- review_replies: Owner replying to a review
INSERT INTO review_replies (rvw_id, uid, comment) 
VALUES
    (1, 3, 'Thank you, Alice! We''re so glad you had a good experience.'); -- Carol (uid 3) replies to Alice's review (rvw_id 1)

-- cart: Alice adding items to her cart
INSERT INTO cart (pid, amount, cid, bid) 
VALUES
    (1, 2, 1, 1), -- Alice (cid 1) has 2 of Product 1 (Shampoo) from Business 1 in her cart.
    (3, 1, 1, 1); -- Alice (cid 1) also has 1 of Product 3 (Nail Polish)

/* * 6. Loyalty & Payment Systems
 */

-- loyalty_programs: Define programs for Carol's Cuts (bid 1)
-- ** NOTE: Only one boolean threshold is set to TRUE per row, others are FALSE **
INSERT INTO loyalty_programs (bid, appts_thresh, pdct_thresh, price_thresh, points_thresh, threshold) 
VALUES
    (1, true, false, false, false, 10), -- lprog_id 1: "10 appointment" threshold
    (1, false, false, false, true, 500), -- lprog_id 2: "500 point" threshold
    (1, false, false, true, false, 200); -- lprog_id 3: "$200 spent" threshold

-- loyalty_points: Define the "value" of points for the business
INSERT INTO loyalty_points (bid, pts_value) 
VALUES 
    (1, 0.01); -- At Carol's Cuts (bid 1), 1 point = $0.01

-- rewards: Define the rewards for the loyalty programs
INSERT INTO rewards (bid, lprog_id, is_appt, is_discount, rwd_value) 
VALUES
    (1, 1, true, true, 50.00); -- Reward for prog 1 (10 appts) is 50% off (interpreting rwd_value as percentage)
    
INSERT INTO rewards (bid, lprog_id, is_price, is_discount, rwd_value) 
VALUES
    (1, 2, true, true, 5.00); -- Reward for prog 2 (500 points) is $5.00 off

INSERT INTO rewards (bid, lprog_id, is_price, is_discount, rwd_value) 
VALUES
    (1, 3, true, true, 20.00); -- Reward for prog 3 ($200 spent) is $20.00 off

-- loyalty_transactions: Log customer progress
INSERT INTO loyalty_transactions (cid, lprog_id) 
VALUES
    (1, 1), -- Alice (cid 1) gets 1 credit towards the 10-appointment program
    (2, 2); -- Bob (cid 2) earned points (let's say 120) toward the 500-point program
    

-- promotions: Create a promotion linked to a loyalty program
INSERT INTO promotions (lprog_id, start_date, end_date, is_recurring, recurr_day, start_time, end_time, title, description) 
VALUES
    (2, '2025-11-01 00:00:00', '2025-11-30 23:59:59', false, NULL, '09:00:00', '17:00:00', 'November Points-a-Palooza', 'Get 2x points on all coloring services this month!');

-- payment_information: Store a payment method for Alice
INSERT INTO payment_information (uid, payment_type, card_number) 
VALUES
    (1, 'Credit Card', '4242424242424242'); -- Test card number for Alice (uid 1)

-- email_subscription: Set user preferences
INSERT INTO email_subscription (uid, cid, promotion, appointment) 
VALUES
    (1, 1, true, true),  -- Alice wants all emails
    (2, 2, true, false), -- Bob only wants promotions
    (3, NULL, false, false), -- Carol (owner) wants no marketing emails
    (4, NULL, false, false), -- David (employee) wants no marketing emails
    (5, NULL, false, false); -- Emily (employee) wants no marketing emails