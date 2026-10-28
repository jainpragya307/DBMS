create database student_management;
use student_management;

create table students(
	id int primary key auto_increment,
    name varchar(50) not null,
    email varchar(50) unique not null,
    phone_no bigint unique not null,
    age int not null,
    c_id int,
    foreign key (c_id) references courses (c_id)
);

insert into students (name, email, phone_no, age, c_id) values
	('Aarav Desai', 'aarav@gmail.com', 9123456780, 20, 1),
	('Diya Shah', 'diya@gmail.com', 9876501234, 21, 2),
	('Rohan Patel', 'rohan@gmail.com', 9988776655, 19, 3),
	('Ananya Mehta', 'ananya@gmail.com', 8877665544, 22, 4),
	('Vivaan Joshi', 'vivaan@gmail.com', 7766554433, 20, 5),
	('Isha Shah', 'isha@gmail.com', 9123409876, 23, 1),
	('Arjun Patel', 'arjun@gmail.com', 9898989898, 21, 2),
	('Kavya Desai', 'kavya@gmail.com', 9090909090, 20, 3);
    
create table courses(
	c_id int primary key auto_increment,
    course_name varchar(50) not null,
    duration decimal(4,2) ,    -- duration we can also take as time
    fees int not null,
    t_id int,
    p_id int,
    foreign key (t_id) references teachers (t_id),
    foreign key (p_id) references payments(p_id)
    );

insert into courses (course_name, duration, fees, t_id, p_id) values 
	('Python Programming', 6.00, 15000, 1, 1),
	('Data Science', 8.00, 20000, 2, 2),
	('Web Development', 5.00, 12000, 3, 3),
	('Java Programming', 7.00, 18000, 4, 4),
	('Artificial Intelligence', 10.00, 25000, 5, 5);

create table payments(
	p_id int primary key auto_increment,
    trans_id int,  -- change to varchar
    time timestamp default now(),
    amount int not null,
    mode enum("cash" , "UPI" , "card") default "cash"
);

insert into payments (trans_id, amount, mode) values
	(1001, 15000, 'UPI'),
	(1002, 20000, 'card'),
	(1003, 12000, 'cash'),
	(1004, 18000, 'UPI'),
	(1005, 25000, 'card');

create table teachers(
	t_id int primary key auto_increment,
    name varchar(50) not null,
    email varchar(30) unique not null,
    phone_no bigint not null ,
    age int not null
);

insert into teachers (name , email , phone_no , age) values 
	('Rahul Sharma', 'rahul@gmail.com', 9876543210, 35),
	('Priya Patel', 'priya@gmail.com', 9876543211, 30),
	('Amit Shah', 'amit@gmail.com', 9876543212, 42),
	('Neha Joshi', 'neha@gmail.com', 9876543213, 28),
	('Karan Mehta', 'karan@gmail.com', 9876543214, 38);

desc student;
desc course;
desc payments;
desc teachers;

select * from students;
select * from courses;
select * from teachers;
select * from payments;
