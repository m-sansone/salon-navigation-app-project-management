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

insert into salon_app.customers (cid,uid)
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

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

insert into salon_app.business (bid, uid, name, aid, status)
values
(1,11,'Barberz Inc',1,True),
(2,12,'Salonary',2,True),
(3,13,'The Sharp Edge',3,True),
(4,14,'Fade Factory',4,True),
(5,15,'King’s Clippers',5,True),
(6,16,'The Cut Lounge',6,True),
(7,17,'Blade & Bourbon',7,True),
(8,18,'Urban Fades',8,True),
(9,19,'FreshCutz Studio',9,True),
(10,20,'The Gentleman’s Chair',10,True);

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
(30,'Henr', 'Cavill', '9086869701');

INSERT INTO salon_app.authenticate (uid, email, pw_hash, salt)
values
(21, 'hamiltonA@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(22, 'kennedyJ@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(23, 'BillyB@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(24, 'harmful@gmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(25, 'Destiny@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(26, 'EllyD@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(27, 'yousefM@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(28, 'kd44@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(29, 'pruthviS@yahoo.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd'),
(30, 'superman@hotmail.com', '17d378628abaacbb84edcc3dcbbecd8ae2d3fc686de24cf79c8601e1d2f0c0a6', '3c06fdf11be14fc3b6e9a51c194719cd');

INSERT INTO salon_app.users_roles (uid, rid)
values
(21, 2),
(22, 2), 
(23, 2), 
(24, 2), 
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30,2);

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
(10,30,10,true);

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
