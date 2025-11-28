drop database if exists salon_app;
create database if not exists salon_app;

use salon_app;

/*
 * UPDATED NOV 8, 2025 3:20 PM by John
 * 
 * 
 */


/* 
 * Users sign up on website and are later split into different roles: 
 * Customers, Business, or Employee.
 * Primary Key: uid (user_id)
 * */
create table if not exists users (
	uid int auto_increment not null,
	first_name varchar(128) not null,
	last_name varchar (128) not null,
	phone varchar(11),
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	constraint pk_user primary key (uid)
);



/* 
 * The different roles a user can be: Customer, Business Owner, or Employee.
 * Primary Key: rid (role_id)
 * */
create table if not exists roles (
	rid int auto_increment not null,
	name varchar(128),
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (rid)
);


/* 
 * Table that keeps track of the role of every signed up user of the site.
 * Primary Key: uid (user_id)
 * Foreign Keys: rid (role_id [from roles]), uid(user_id[from users])
 * */
create table if not exists users_roles (
	uid int not null,
	rid int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (uid),
	foreign key (uid) references users(uid),
	foreign key (rid) references roles(rid)
);

insert into roles (name)
values
	("customer"),
	("business"),
	("employee"),
	("admin");




/* 
 * Customer information recorded into database. Each customer has unique identification.
 * Primary Key: cid (customer_id)
 * Foreign Key: uid (user_id [from users])
 * */
create table if not exists customers (
	cid int auto_increment not null,
	uid int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	constraint pk_cust primary key (cid, uid),
	foreign key (uid) references users(uid)
);  

/* 
 * Address of the Businesses Signed Up
 * Primary key: aid(address_id)
 * */
create table if not exists addresses (
	aid int auto_increment not null,
	street varchar(255),
	city varchar(255),
	state varchar(255),
	country varchar(255),
	zip_code varchar(255),
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (aid)
);


/* 
 * Information of Signed Up Businesses Recorded
 * Keep track if Business still opened or not (status)
 * Primary Keys: bid (business_id), uid(user_id)
 * Foreign Keys: uid (user_id[from users]), aid(address_id[from addresses])
 * */
create table if not exists business (
	bid int auto_increment not null,
	uid int not null,
	name varchar(255) not null unique,
	aid int not null,
	deposit_rate decimal(4,3) default 0.000,
	status bool default false,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	check (deposit_rate<1.000),
	constraint pk_business primary key (bid),
	foreign key (uid) references users(uid),
	foreign key (aid) references addresses(aid)
);

create table if not exists hours_of_operation (
	id int auto_increment not null,
	bid int not null,
	day enum ('sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'),
	open_time time not null,
	close_time time not null,
	is_closed bool default false,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	check ((open_time is null and close_time is null) or
		(open_time is not null and close_time is not null)),
	check (open_time < close_time or is_closed=true),
	primary key (id),
	foreign key (bid) references business(bid),
	unique key business_day (bid, day)
);

/* 
 * Information stored of every worker for each business on record.
 * Primary Keys: eid(employee_id), uid(user_id)
 * Foreign Keys: bid(business_id), uid(user_id)
 * */
create table if not exists employee (
	eid int auto_increment not null,
	uid int not null,
	bid int,
	approved bool default false,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	constraint pk_employee primary key (eid),
	foreign key (uid) references users(uid),
	foreign key (bid) references business(bid)
);


/* 
 * Recording data of the various skillsets that the salon barbers have to offer.
 * Primary Key: exp_id(Expertise ID)
 * */
create table if not exists expertise (
	exp_id int auto_increment not null,
	expertise varchar(128) not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (exp_id)
);


/* 
 * Recording what specific departments that employees can specialize in.
 * Primary Keys: eid(employee_id), exp_id(expertise_id)
 * Foreign Keys: eid(employee_id [from employee]), 
 * exp_id(expertise_id[from expertise])
 * */
create table if not exists employee_expertise (
	eid int not null,
	exp_id int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	constraint pk_employee_expertise primary key (eid, exp_id),
	foreign key (eid) references employee(eid),
	foreign key (exp_id) references expertise(exp_id)
);

create table if not exists saved_employee (
	cid int not null,
	eid int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cid),
	foreign key (cid) references customers(cid),
	foreign key (eid) references employee(eid),
	unique key saved_employee (cid, eid)
);

create table if not exists saved_business (
	cid int not null,
	bid int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cid),
	foreign key (cid) references customers(cid),
	foreign key (bid) references business(bid),
	unique key saved_salon (cid, bid)
);

-- MODIFIED: Keeps track of all reviews left by clients on salons/workers; primary key rvw_id (review id) for each unique review record, 
-- with foreign keys linking back to the customer who gave the review, and the business or worker being reviewed (cid, bid, and eid, respectively).
-- rating that runs from 1 to 5 (indicating stars)
create table if not exists reviews ( 
	rvw_id int auto_increment not null,
	cid int not null,
	bid int, 
	eid int,
	rating int not null check(rating between 1 and 5),
	comment TEXT,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (rvw_id),
	foreign key (cid) references customers(cid),
	foreign key (bid) references business(bid),
	foreign key (eid) references employee(eid),
	check (
	eid is not null or bid is not null
	)
);



-- Replies to review: has its own unique reply id (rply_id)
-- any user can reply to a review (uid recorded), including the Owner or even workers.
-- foreign key links to reviews table's rvw_id, indicating that it is indeed a reply.
create table if not exists review_replies (
	rply_id int auto_increment not null,
	rvw_id int not null,
	uid int not null,
	comment TEXT,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (rply_id),
	foreign key (uid) references users(uid),
	foreign key (rvw_id) references reviews(rvw_id)
);



/* 
 * Keeps record of the scheduled time each employee works
 * Primary Key: sched_id(schedule_id)
 * Foreign Key: eid(employee_id [from employee])
 * */
create table if not exists schedule (
    sched_id int auto_increment not null,
    eid int not null,
    day varchar(10),
    start_time timestamp,
    finish_time timestamp,
    created_at timestamp default current_timestamp(),
    updated_at datetime default current_timestamp() on update current_timestamp(),
    primary key (sched_id),
    foreign key (eid) references employee(eid)
);

/* 
 * The information stored for each service offered by a business.
 * Primary Key: sid (service_id) 
 * Foreign Key: bid (business_id [from business])
 * */
create table if not exists services (
	sid int auto_increment not null,
	name varchar(255),
	price decimal(5,2),
	bid int not null,
	durationMin int default 0,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (sid),
	foreign key (bid) references business(bid)
);


/* 
 * Authentication Table: stores sensitive information 
 * to authenticate users signed up.
 * hash used to protect sensitive password information (64hex characters)
 * salt added to hash for extra security (random salts stored as hexadecimal)
 * Primary Key: uid (user_id)
 * Foreign Key: uid(user_id [from users])
 * */
create table if not exists authenticate(
    uid int unique not null,
    email varchar(255) unique not null,
    pw_hash char(64) not null,
    salt char(32) not null, 
    created_at timestamp default current_timestamp(),
    updated_at timestamp default current_timestamp() on update current_timestamp(),
    constraint pk_authenticate primary key(uid,email),
    foreign key(uid) references users(uid)
    );
	


-- stores appointments made by customers for each business and for which employee
create table if not exists appointments (
	aid int auto_increment not null, 	
	cid int not null, 		
	eid int, 
	sid int not null, 
	start_time timestamp not null,
	expected_end_time timestamp not null,
	end_time timestamp on update current_timestamp(),	
	notes text,
	before_image longblob,
	after_image longblob,
	created_at timestamp default current_timestamp(),								
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (aid),
	foreign key (cid) references customers(cid),
	foreign key (eid) references employee(eid),
	foreign key (sid) references services(sid)
);

CREATE TABLE IF NOT EXISTS appointment_notes (
    note_id INT AUTO_INCREMENT PRIMARY KEY,
    aid INT NOT NULL,
    author_uid INT NOT NULL,
    author_role VARCHAR(50) NOT NULL,
    note_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aid) REFERENCES appointments(aid) ON DELETE CASCADE,
    FOREIGN KEY (author_uid) REFERENCES users(uid) ON DELETE CASCADE,
    INDEX idx_appointment (aid),
    INDEX idx_created (created_at)
);

-- MODIFIED: each row is a loyalty program a business has implemented; each program has a unique id (lprog_id)
-- foreign key links to business (bid)
-- indication for what type of various loyalty programs are possible: Buy 1 Get 1 Free ("BOGO"), points accumulation, money spent on a business' services
-- or products, amount of visits to the salon.
-- The number at which a reward for a program is met (threshold). For example, after 10 appointments, client gets a free one.

create table if not exists loyalty_programs (
	lprog_id int auto_increment not null,																
	bid int not null,
	appts_thresh bool default false,
	pdct_thresh bool default false,
	price_thresh bool default false,
	points_thresh bool default false,
	threshold int not null,
	created_at timestamp default current_timestamp(),								
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (lprog_id),
	foreign key (bid) references business(bid)
	
);



-- NEW: track different types of rewards for particular business' loyalty program.
-- which type of Loyalty Program is it corresponding to the programs table above
-- value of reward specifying the value of reward. 10 percent off, 1 free appointment, etc. (rwd_value)
-- foreign keys to loyalty_programs table and business table (lprog_id and bid, respectively.)
create table if not exists rewards( 
rwd_id int auto_increment not null,
bid int not null,
lprog_id int not null,    
is_appt bool default false, 
is_product bool default false,
is_price bool default false,
is_points bool default false, 
is_discount bool default false,
rwd_value decimal(5,2),
created_at timestamp default current_timestamp(),								
updated_at datetime default current_timestamp() on update current_timestamp(),
primary key (rwd_id),
foreign key (bid) references business(bid),
foreign key (lprog_id) references loyalty_programs(lprog_id)
);



-- MODIFIED: tracks how many points a business can have (pts_value)
-- A business gives 100 points total, for example.
create table if not exists loyalty_points (
	bid int not null, 
	pts_value decimal(5,2),
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (bid),
	foreign key (bid) references business(bid)
	
);

-- MODIFIED: each row is a promotion a business has implemented
-- how long does the promo last (start_date, end_date)
-- does it take on a regular basis (is_recurring)
-- what day(s) of the week would it regularly occur (recurr_day)
-- when does the promo start and end that day (start_time, end_time)
create table if not exists promotions (
	promo_id int auto_increment not null,
	start_date timestamp not null,
	end_date timestamp not null, 
	is_recurring bool default false, 
	recurr_day varchar(10),
	start_time time not null,
	end_time time not null,
	title varchar(128),
	description text,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (promo_id)
	
);


-- track loyalty program transactions made by customers 
create table if not exists loyalty_transactions (
	lt_id int auto_increment not null,											
	cid int not null,														
	lprog_id int not null,														
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (lt_id),
	foreign key (cid) references customers(cid),
	foreign key (lprog_id) references loyalty_programs(lprog_id)
);




-- track what type of emails each user wants to recieve
create table if not exists email_subscription (
    cid int not null,
	promotion bool default true,
	appointment bool default true,
	created_at timestamp default current_timestamp(), 
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cid),
	foreign key (cid) references customers(cid) 
);



-- store user payment methods
create table if not exists payment_information (
	id int auto_increment not null,	
	uid int not null,	
	payment_type varchar(128),	
	card_number varchar(128),
	created_at timestamp default current_timestamp(),								
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (id),
	foreign key (uid) references users(uid)
);



-- products each business sells with their stock
-- image: keeps track of images and stores in db as well
create table if not exists products (
	pid int auto_increment not null,
	name varchar(255),
	bid int not null,
	price decimal(5,2),	
	stock int default 0,	
	image  LONGBLOB,				
	description text,												
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (pid),
	foreign key (bid) references business(bid)
);

-- stores individual cart item with amount of each product being purchased
-- cid instead of uid because only customers use carts
create table if not exists cart (
	cart_id int auto_increment not null,  											
	pid int not null, 										
	amount int default 1,													
	cid int not null, 															
	bid int not null,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cart_id),
	unique key (cid,pid),   -- needs to be unique for cart adding logic
	foreign key (pid) references products(pid),
	foreign key (cid) references customers(cid)
);

-- Tracking the Loyalty Points balance for each customer of a business
create table if not exists customer_loyalty_points(
	cid int not null,
	bid int not null,
	pts_balance decimal(5,2),
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cid,bid),
	foreign key (cid) references customers(cid),
    foreign key (bid) references business (bid)

);

create table if not exists service_time (
	id int auto_increment not null,
	start_time timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (id)
);

-- track appointment and product transactions
CREATE TABLE IF NOT EXISTS transactions (
    trans_id INT AUTO_INCREMENT PRIMARY KEY,
    cid INT NOT NULL,
    bid INT NOT NULL,
    aid INT,
    pid INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_method_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cid) REFERENCES customers(cid),
    FOREIGN KEY (bid) REFERENCES business(bid),
    FOREIGN KEY (aid) REFERENCES appointments(aid),
    FOREIGN KEY (pid) REFERENCES products(pid),
    FOREIGN KEY (payment_method_id) REFERENCES payment_information(id)
);
	

-- track changes made to tables
create table if not exists audit (
	id int auto_increment not null,
	table_name varchar(128) not null,
	record_id int not null,
	action enum('insert', 'update', 'delete') not null,
	old_data json,
	new_data json,
	changed_at timestamp default current_timestamp(),
	primary key (id)
);


