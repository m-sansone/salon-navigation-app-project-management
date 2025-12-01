-- Insert Customers
INSERT INTO salon_app.users (uid,first_name, last_name, phone)
values
(1, 'Rocky', 'Balboa', '9082657889'),
(2,'Alice', 'Smith', '9082541946'),
(3,'Bob', 'Johnson', '9085870123'),
(4,'Sarah', 'Jenkins', '9087443785'),
(5,'Mike', 'Brown', '9084971187'),
(6,'Emily', 'Davis', '9083894915'),
(7,'Mark', 'David', '9084087161'),
(8,'Alexandria', 'Systine', '9086485272'),
(9,'Richard', 'Gangri', '9084511174'),
(10,'Mark', 'Hamil', '9086469701');

INSERT INTO salon_app.authenticate (uid, email, pw_hash, salt)
values
(1, 'rockybalb@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(2, 'alice.smith@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(3, 'b.johnson@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(4, 'sarah.jenkins@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(5, 'mike.brown@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(6, 'emily.davis@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(7, 'davidMark@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(8, 'alexSys@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(9, 'richG@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(10, 'lukeskywalker@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd');

INSERT INTO salon_app.users_roles (uid, rid)
values
(1, 1),
(2, 1), 
(3, 1), 
(4, 1), 
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10,1);

insert into salon_app.customers (uid)
values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

insert into salon_app.email_subscription (cid)
values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

insert into salon_app.payment_information (uid, payment_type, card_number)
values
(1, 'credit', '123456789'),
(1, 'debit', '987654321'),
(1, 'debit', '987651234'),
(2, 'debit', '123456789'),
(2, 'credit', '987654321'),
(2, 'debit', '987651234'),
(3, 'debit', '123456789'),
(3, 'credit', '987654321'),
(3, 'credit', '987651234');

-- Insert Addresses
insert into salon_app.addresses (aid, street, city, state, country, zip_code)
values
(1,'23 Alfred St','Jersey City','New Jersey','United States','08878'),
(2,'27 Under Pass','Jersey City','New Jersey','United States','08878'),
(3,'34 Helton Pl','Jersey City','New Jersey','United States','08878'),
(4,'54 Contrary St','Jersey City','New Jersey','United States','08878'),
(5,'21 Halton Rd','Newark','New Jersey','United States','08877'),
(6,'78 Edison St','Newark','New Jersey','United States','08877'),
(7,'57 Richmond St','Newark','New Jersey','United States','08877'),
(8,'445 Stone Dr','Newark','New Jersey','United States','08877'),
(9,'23 Kerchoff Rd','Newark','New Jersey','United States','08877'),
(10,'11 Canary Pl','Newark','New Jersey','United States','08877');

-- Insert Owners
INSERT INTO salon_app.users (uid,first_name, last_name, phone)
values
(11, 'Alexander', 'Hamilton', '9082647889'),
(12,'John', 'Kennedy', '9082541646'),
(13,'Billy', 'Bob', '9085830123'),
(14,'Hank', 'Harm', '9087443785'),
(15,'Destiny', 'Miller', '9084171187'),
(16,'Elly', 'Donte', '9083894615'),
(17,'Yousef', 'Marqi', '9084097161'),
(18,'Krish', 'Darji', '9086484272'),
(19,'Pruthvi', 'Soni', '9084551174'),
(20,'Henry', 'Cavill', '9086869701');

INSERT INTO salon_app.authenticate (uid, email, pw_hash, salt)
values
(11, 'hamiltonA@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(12, 'kennedyJ@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(13, 'BillyB@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(14, 'harmful@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(15, 'Destiny@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(16, 'EllyD@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(17, 'yousefM@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(18, 'kd44@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(19, 'pruthviS@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(20, 'superman@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd');

INSERT INTO salon_app.users_roles (uid, rid)
values
(11, 2),
(12, 2), 
(13, 2), 
(14, 2), 
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20,2);

insert into salon_app.business (bid, uid, name, aid, deposit_rate, status)
values
(1, 11,'Barberz Inc',1,0.050,True),
(2, 12,'Salonary',2,0.150,True),
(3, 13,'The Sharp Edge',3,0.000,True),
(4, 14,'Fade Factory',4,0.150,True),
(5, 15,'King’s Clippers',5,0.000,True),
(6, 16,'The Cut Lounge',6,0.050,True),
(7, 17,'Blade & Bourbon',7,0.200,True),
(8, 18,'Urban Fades',8,0.100,True),
(9, 19,'FreshCutz Studio',9,0.100,True),
(10, 20,'The Gentleman’s Chair',10,0.350,True);

insert into salon_app.hours_of_operation (bid, day, open_time, close_time, is_closed)
values (1, 'sunday', '11:00:00', '21:00:00', false);

-- Insert employees

INSERT INTO salon_app.expertise (expertise)
VALUES
('Fades'),         -- exp_id: 1
('Coloring'),      -- exp_id: 2
('Styling'),       -- exp_id: 3
('Beard Trim'),    -- exp_id: 4
('Manicure'),      -- exp_id: 5
('Pedicure');      -- exp_id: 6

INSERT INTO salon_app.users (uid,first_name, last_name, phone)
values
(21, 'Henry', 'David', '9082647889'),
(22,'Johnny', 'Test', '9082541646'),
(23,'Finn', 'Mertins', '9085830123'),
(24,'Dipper', 'Pines', '9087443785'),
(25,'Mabel', 'Pines', '9084171187'),
(26,'Stanford', 'Prince', '9083894615'),
(27,'Steven', 'Ukelele', '9084097161'),
(28,'Hali', 'Burton', '9086484272'),
(29,'Clark', 'Kent', '9084551174'),
(30,'Kal', 'El', '9086869901');

INSERT INTO salon_app.authenticate (uid, email, pw_hash, salt)
values
(21, 'henryA@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(22, 'testJ@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(23, 'MertinsF@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(24, 'pinesD@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(25, 'pinesM@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(26, 'pines2@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(27, 'universe@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(28, 'burtonH@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(29, 'clarkkent@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(30, 'kalel@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd');

INSERT INTO salon_app.users_roles (uid, rid)
values
(21, 3),
(22, 3), 
(23, 3), 
(24, 3), 
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30,3);

insert into salon_app.employee (eid,uid, bid, approved)
values
(1,21,1,True),
(2,22,2,True),
(3,23,3,True),
(4,24,4,True),
(5,25,5,True),
(6,26,6,True),
(7,27,7,True),
(8,28,8,True),
(9,29,9,True),
(10,30,10,True);

update salon_app.employee e
join salon_app.users u on e.uid=u.uid
set e.bio=concat("Hello my name is ", u.first_name, " ",u.last_name);

insert into salon_app.employee_expertise (eid, exp_id )
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,1),
(8,2),
(9,3),
(10,4);

insert into salon_app.reviews (cid, eid, rating, comment)
values
(1,1,4,'Great'),
(2,1,5,'Amazing'),
(2,1,4,'Great'),
(1,2,1,'Terrible'),
(2,2,3,'Alright'),
(2,2,1,'Terrible'),
(1,3,3,'Alright'),
(2,3,3,'Alright'),
(2,3,2,'Bad'),
(1,4,4,'Great'),
(2,4,1,'Terrible'),
(2,4,2,'Bad'),
(1,5,3,'Alright'),
(2,5,2,'Bad'),
(2,5,1,'Terrible'),
(1,6,4,'Great'),
(2,6,5,'Amazing'),
(2,6,2,'Bad'),
(1,7,3,'Alright'),
(2,7,1,'Terrible'),
(2,7,1,'Terrible'),
(1,8,5,'Amazing'),
(2,8,4,'Great'),
(2,8,3,'Alright'),
(1,9,3,'Alright'),
(2,9,2,'Bad'),
(2,9,1,'Terrible'),
(1,10,5,'Amazing'),
(2,10,2,'Bad'),
(2,10,3,'Alright');

insert into salon_app.services (sid, name, price, bid)
values
(1, "hair cut", 15.00, 1),
(2, "hair cut", 15.00, 2),
(3, "hair cut", 15.00, 3),
(4, "hair cut", 15.00, 4),
(5, "hair cut", 15.00, 5),
(6, "hair cut", 15.00, 6),
(7, "hair cut", 15.00, 7),
(8, "hair cut", 15.00, 8),
(9, "hair cut", 15.00, 9),
(10, "hair cut", 15.00, 10);

insert into salon_app.appointments (cid, eid, sid, start_time, expected_end_time) 
values 
(1,1,1,'2025-11-05 16:30:00','2025-11-05 16:30:00'),
(2,1,1,'2025-11-06 15:30:00','2025-11-06 16:30:00'),
(3,1,1,'2025-11-07 07:30:00','2025-11-07 08:30:00'),
(4,1,1,'2025-11-08 07:30:00','2025-11-08 08:30:00'),
(5,1,1,'2025-11-09 07:30:00','2025-11-09 08:30:00'),
(6,1,1,'2025-10-10 07:30:00','2025-10-10 08:30:00'),
(7,1,1,'2025-10-11 07:30:00','2025-10-11 08:30:00'),
(8,1,1,'2025-10-12 07:30:00','2025-10-12 08:30:00'),
(9,1,1,'2025-10-13 07:30:00','2025-10-13 08:30:00'),
(10,1,1,'2025-10-14 07:30:00','2025-10-14 08:30:00');

insert into salon_app.appointments (cid, eid, sid, start_time, expected_end_time) 
values 
(1,2,2,'2025-11-05 17:30:00','2025-11-05 17:30:00'),
(2,2,2,'2025-11-06 15:30:00','2025-11-06 16:30:00'),
(3,2,2,'2025-11-07 07:30:00','2025-11-07 08:30:00'),
(4,2,2,'2025-11-08 07:30:00','2025-11-08 08:30:00'),
(5,2,2,'2025-11-09 07:30:00','2025-11-09 08:30:00'),
(6,2,2,'2025-11-10 07:30:00','2025-11-10 08:30:00'),
(7,2,2,'2025-10-11 07:30:00','2025-10-11 08:30:00'),
(8,2,2,'2025-10-12 07:30:00','2025-10-12 08:30:00'),
(9,2,2,'2025-10-13 07:30:00','2025-10-13 08:30:00'),
(10,2,2,'2025-10-14 07:30:00','2025-10-14 08:30:00');

insert into salon_app.appointments (cid, eid, sid, start_time, expected_end_time) 
values 
(1,3,3,'2025-11-05 18:30:00','2025-11-05 18:30:00'),
(2,3,3,'2025-11-06 15:30:00','2025-11-06 16:30:00'),
(3,3,3,'2025-11-07 07:30:00','2025-11-07 08:30:00'),
(4,3,3,'2025-11-08 07:30:00','2025-11-08 08:30:00'),
(5,3,3,'2025-11-09 07:30:00','2025-11-09 08:30:00'),
(6,3,3,'2025-10-10 07:30:00','2025-10-10 08:30:00'),
(7,3,3,'2025-10-11 07:30:00','2025-10-11 08:30:00'),
(8,3,3,'2025-10-12 07:30:00','2025-10-12 08:30:00'),
(9,3,3,'2025-10-13 07:30:00','2025-10-13 08:30:00'),
(10,3,3,'2025-10-14 07:30:00','2025-10-14 08:30:00');

insert into salon_app.appointments (cid, eid, sid, start_time, expected_end_time) 
values 
(1,4,4,'2025-10-05 18:30:00','2025-10-05 18:30:00'),
(2,4,4,'2025-11-06 15:30:00','2025-11-06 16:30:00'),
(3,4,4,'2025-10-07 07:30:00','2025-10-07 08:30:00'),
(4,4,4,'2025-11-08 07:30:00','2025-11-08 08:30:00'),
(5,4,4,'2025-11-09 07:30:00','2025-11-09 08:30:00'),
(6,4,4,'2025-10-10 07:30:00','2025-10-10 08:30:00'),
(7,4,4,'2025-10-11 07:30:00','2025-10-11 08:30:00'),
(8,4,4,'2025-10-12 07:30:00','2025-10-12 08:30:00'),
(9,4,4,'2025-10-13 07:30:00','2025-10-13 08:30:00'),
(10,4,4,'2025-11-14 07:30:00','2025-11-14 08:30:00'),
(10,4,4,'2025-11-15 07:30:00','2025-11-15 08:30:00'),
(3,4,4,'2025-11-16 07:30:00','2025-11-15 08:30:00')
;

insert into salon_app.reviews (cid, bid, rating)
values
(1,1,1),
(2,1,4),
(3,1,5),
(4,1,2),
(5,1,1),
(6,1,1),
(7,1,3),
(8,1,4),
(9,1,2),
(10,1,5);

insert into salon_app.reviews (cid, bid, rating)
values
(1,2,1),
(2,2,2),
(3,2,1),
(4,2,2),
(5,2,2),
(6,2,5),
(7,2,3),
(8,2,3),
(9,2,2),
(10,2,4);

insert into salon_app.transactions (cid, bid, aid, amount, payment_method_id)
values
(1,1,1,0.75,1),
(1,2,11,0.75,2),
(1,3,21,0.75,3),
(2,1,2,0.75,4),
(2,2,12,0.75,5),
(2,3,22,0.75,6),
(3,1,3,0.75,7),
(3,2,13,0.75,8),
(3,3,23,0.75,9);
