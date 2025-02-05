create database Homework3
use  Homework3


create table C(fullname text, address varchar default 'Tashkent')

insert into C values ('Park Ji Sung', 'Seoul')
insert into C values ('Harry Wayne', 'Manchester')
insert into C values ('Lisandro Martinez', '')
insert into C(fullname) values ('Odil Axmedov')

insert into C values ('Andre Berchiche', null)

select fullname, ISNULL(address, 'Tashkent') from C

--Hometask
--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent




create table iam_roles (db_id int primary key,id varchar(50)not null,
name varchar(255)not null, type varchar (100),actions Text)

create table iam_projects (db_id int primary key,id varchar(50)not null,
name varchar (255),type varchar (50))

create table iam_statements (db_id int primary key,effect varchar (255),
actions text,resources text,
policy_id int,role_id int
foreign key (role_id) references iam_roles(db_id),
foreign key (policy_id ) references iam_policies (db_id) )


create table iam_policies (db_id int primary key,id varchar(50)not null,
[name] varchar(255),type varchar (50))
	

create table iam_members(db_id int primary key,name varchar(255) not null)

create table iam_role_projects (role_id int,project_id int
primary key (role_id, project_id)
foreign key (role_id) references iam_roles (db_id),
foreign key (project_id) references iam_projects (db_id))

create table iam_statements_projects (project_id int,statement_id int
primary key (project_id,statement_id),
foreign key (project_id ) references iam_projects (db_id),
foreign key (statement_id ) references  iam_statements(db_id)
)
create table iam_policy_projects (policy_id int foreign key references iam_policies (db_id),
project_id int foreign key references iam_projects (db_id)
)

create table iam_policy_members (member_id int foreign key references iam_members(db_id),
policy_id int foreign key references iam_policies (db_id))

create table iam_staged_project_rules (db_id int primary key, 
id varchar(50) not null, name varchar(255), type varchar(100),deleted bit,
project_id int foreign key references iam_projects(db_id))


create table iam_project_rules ( db_id int primary key, id varchar( 50)not null,
name varchar(255),type varchar(100),
project_id int foreign key references iam_projects (db_id)
)

create table iam_projects_graveyard ( db_id int primary key, id varchar (50)not null
)


create table iam_staged_rule_contidions ( db_id int primary key,value1 text, attribute varchar(100),operator varchar (100),
rule_db_id int foreign key references iam_staged_project_rules (db_id)
)

create table iam_rule_conditions( db_id int primary key, value1 text,
attribute varchar (100),operator varchar(100),
	rule_db_id int foreign key references iam_project_rules (db_id)
)
