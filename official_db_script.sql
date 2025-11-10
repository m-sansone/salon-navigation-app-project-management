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
	("employee");




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
	status bool default false,
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	constraint pk_business primary key (bid),
	foreign key (uid) references users(uid),
	foreign key (aid) references addresses(aid)
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
    uid int not null,
    email varchar(255) not null,
    pw_hash char(64) not null,
    salt char(32) not null, 
    created_at timestamp default current_timestamp(),
    updated_at timestamp default current_timestamp() on update current_timestamp(),
    constraint pk_authenticate primary key(uid,email),
    foreign key(uid) references users(uid)
    );
	


-- stores appointments made by customers for each business and for which employee
create table if not exists appointments (
	aid int auto_increment not null, 												# primary key
	cid int not null, 																# customer making appointment (foreign key customers cid)
	eid int, 																		# employee customer wants to make appointment with (foreign key employee eid)
	sid int not null, 																# service customer wants to recieve at appointment (foreign key services sid)
	start_time timestamp not null,													# time customer should show up to appointment
	expected_end_time timestamp not null,											# time service should end
	end_time timestamp on update current_timestamp(),	
	notes text,																		# time service does end
	created_at timestamp default current_timestamp(),								
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (aid),
	foreign key (cid) references customers(cid),
	foreign key (eid) references employee(eid),
	foreign key (sid) references services(sid)
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
	lprog_id int not null,
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
	primary key (promo_id),
	foreign key (lprog_id) references loyalty_programs(lprog_id)
	
);


-- track loyalty program transactions made by customers 
create table if not exists loyalty_transactions (
	lt_id int auto_increment not null,																# primary key
	cid int not null,																# customer that made transaction (foreign key customers cid)
	lprog_id int not null,																# loyalty program that was used for transaction (foreign key loyalty_programs lid)
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (lt_id),
	foreign key (cid) references customers(cid),
	foreign key (lprog_id) references loyalty_programs(lprog_id)
);




-- track what type of emails each user wants to recieve
create table if not exists email_subscription (
    cid int not null,																				# primary key (foreign key users uid)
	promotion bool default true,													# does customer want to recieve emails for promotions
	appointment bool default true,													# does customer want to recieve emails for appointments
	created_at timestamp default current_timestamp(),                               # cid can be null, not every user will be a client
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (cid),
	foreign key (cid) references customers(cid) 
);



-- store user payment methods
create table if not exists payment_information (
	id int auto_increment not null,																# primary key
	uid int not null,																# user (foreign key users uid)
	payment_type varchar(128),														# payment type (credit, debit, etc)
	card_number varchar(128),														# card number
	created_at timestamp default current_timestamp(),								
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (id),
	foreign key (uid) references users(uid)
);



-- products each business sells with their stock
-- image: keeps track of images and stores in db as well
create table if not exists products (
	pid int auto_increment not null,														# primary key
	name varchar(255),																# name of product
	bid int not null,																# business selling product (foreign key business)
	price decimal(5,2),																# unit price of product
	stock int default 0,	
	image  LONGBLOB,															# stock of product defaults to 0
	description text,														# description of product
	created_at timestamp default current_timestamp(),
	updated_at datetime default current_timestamp() on update current_timestamp(),
	primary key (pid),
	foreign key (bid) references business(bid)
);

-- stores individual cart item with amount of each product being purchased
-- cid instead of uid because only customers use carts
create table if not exists cart (
	cart_id int auto_increment not null,  												# primary key
	pid int not null, 																# product customer is buying (product is unique to business) (foreign key products pid)
	amount int default 1,															# how much of a product customer wants
	cid int not null, 																# who is buying product (foreign key users uid)
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
	

-- track changes made to tables
create table if not exists audit (
	id int auto_increment not null,													# primary key
	table_name varchar(128) not null,												# table that was changed
	record_id int not null,															# record of table that was changed
	action enum('insert', 'update', 'delete') not null,								# what type of change
	old_data json,																	# old data
	new_data json,																	# new data
	changed_at timestamp default current_timestamp(),								# When was change made
	changed_by varchar(128),														# Who made change
	primary key (id)
);

