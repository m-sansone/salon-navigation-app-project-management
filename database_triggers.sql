use salon_app;

delimiter $$

create trigger if not exists users_insert
after insert on users
for each row
begin
	insert into audit (table_name, record_id, action, new_data, changed_at)
	values (
		'users', 
		new.uid, 
		'insert', 
		JSON_OBJECT(
			'uid', new.uid,
			'first_name', new.first_name,
			'last_name', new.last_name,
			'phone', new.phone,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists users_update
after update on users
for each row
begin
	insert into audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'users', 
		new.uid, 
		'insert',
		JSON_OBJECT(
			'uid', old.uid,
			'first_name', old.first_name,
			'last_name', old.last_name,
			'phone', old.phone,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'uid', new.uid,
			'first_name', new.first_name,
			'last_name', new.last_name,
			'phone', new.phone,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists users_roles_insert
after insert on users_roles
for each row
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'users_roles', 
		new.uid, 
		'insert', 
		JSON_OBJECT(
			'uid', new.uid,
			'rid', new.rid,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists users_roles_update
after update on users_roles
for each row
begin
	insert into audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'users_roles', 
		new.uid, 
		'update', 
		JSON_OBJECT(
			'uid', old.uid,
			'rid', old.rid,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'uid', new.uid,
			'rid', new.rid,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists customers_insert
after insert on customers
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'customers', 
		new.cid, 
		'insert', 
		JSON_OBJECT(
			'cid', new.cid,
			'uid', new.uid,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists customers_update
after update on customers
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'customers', 
		new.cid, 
		'update',
		JSON_OBJECT(
			'cid', old.cid,
			'uid', old.uid,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'cid', new.cid,
			'uid', new.uid,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists addresses_insert
after insert on addresses
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'addresses', 
		new.aid, 
		'insert', 
		JSON_OBJECT(
			'aid', new.aid,
			'street', new.street,
			'city', new.city,
			'state', new.state,
			'country', new.country,
			'zip_code', new.zip_code,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists addresses_update
after insert on addresses
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'addresses', 
		new.aid, 
		'update',
		JSON_OBJECT(
			'aid', old.aid,
			'street', old.street,
			'city', old.city,
			'state', old.state,
			'country', old.country,
			'zip_code', old.zip_code,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'aid', new.aid,
			'street', new.street,
			'city', new.city,
			'state', new.state,
			'country', new.country,
			'zip_code', new.zip_code,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists business_insert
after insert on business
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'business', 
		new.bid, 
		'insert', 
		JSON_OBJECT(
			'bid', new.aid,
			'uid', new.uid,
			'name', new.name,
			'aid', new.aid,
			'deposit_rate', new.deposit_rate,
			'status', new.status,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists business_update
after update on business
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'business', 
		new.bid, 
		'update',
		JSON_OBJECT(
			'bid', old.bid,
			'uid', old.uid,
			'name', old.name,
			'aid', old.aid,
			'deposit_rate', old.deposit_rate,
			'status', old.status,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'bid', new.bid,
			'uid', new.uid,
			'name', new.name,
			'aid', new.aid,
			'deposit_rate', new.deposit_rate,
			'status', new.status,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists business_delete
after delete on business
begin
	insert into  audit (table_name, record_id, action, old_data)
	values (
		'business', 
		old.bid, 
		'delete', 
		JSON_OBJECT(
			'bid', old.aid,
			'uid', old.uid,
			'name', old.name,
			'aid', old.aid,
			'deposit_rate', old.deposit_rate,
			'status', old.status,
			'created_at', old.created_at
		)
	);
end$$

create trigger if not exists employee_insert
after insert on employee
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'employee', 
		new.eid, 
		'insert', 
		JSON_OBJECT(
			'eid', new.eid,
			'uid', new.uid,
			'bid', new.bid,
			'approved', new.approved,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists employee_update
after update on employee
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'employee', 
		new.eid, 
		'update',
		JSON_OBJECT(
			'eid', old.eid,
			'uid', old.uid,
			'bid', old.bid,
			'approved', old.approved,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'eid', new.eid,
			'uid', new.uid,
			'bid', new.bid,
			'approved', new.approved,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists employee_delete
after delete on employee
begin
	insert into  audit (table_name, record_id, action, old_data)
	values (
		'employee', 
		old.eid, 
		'delete',
		JSON_OBJECT(
			'eid', old.eid,
			'uid', old.uid,
			'bid', old.bid,
			'approved', old.approved,
			'created_at', old.created_at
		)
	);
end$$

create trigger if not exists expertise_insert
after insert on expertise
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'expertise', 
		new.exp_id, 
		'insert', 
		JSON_OBJECT(
			'exp_id', new.exp_id,
			'expertise', new.expertise,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists expertise_update
after update on expertise
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'expertise', 
		new.exp_id, 
		'update', 
		JSON_OBJECT(
			'exp_id', old.exp_id,
			'expertise', old.expertise,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'exp_id', new.exp_id,
			'expertise', new.expertise,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists expertise_delete
after delete on expertise
begin
	insert into  audit (table_name, record_id, action, old_data)
	values (
		'expertise', 
		old.exp_id, 
		'delete', 
		JSON_OBJECT(
			'exp_id', old.exp_id,
			'expertise', old.expertise,
			'created_at', old.created_at
		)
	);
end$$

create trigger if not exists employee_expertise_insert
after insert on employee_expertise
begin
	insert into  audit (table_name, record_id, action, new_data, changed_at)
	values (
		'employee_expertise', 
		new.eid, 
		'insert', 
		JSON_OBJECT(
			'eid', new.eid,
			'exp_id', new.exp_id,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists employee_expertise_update
after update on employee_expertise
begin
	insert into  audit (table_name, record_id, action, old_data, new_data, changed_at)
	values (
		'employee_expertise', 
		new.eid, 
		'update', 
		JSON_OBJECT(
			'eid', old.eid,
			'exp_id', old.exp_id,
			'created_at', old.created_at
		),
		JSON_OBJECT(
			'eid', new.eid,
			'exp_id', new.exp_id,
			'created_at', new.created_at
		),
		new.updated_at
	);
end$$

create trigger if not exists employee_expertise_delete
after delete on employee_expertise
begin
	insert into  audit (table_name, record_id, action, old_data)
	values (
		'employee_expertise', 
		old.eid, 
		'delete', 
		JSON_OBJECT(
			'eid', old.eid,
			'exp_id', old.exp_id,
			'created_at', old.created_at
		)
	);
end$$

delimiter ;
