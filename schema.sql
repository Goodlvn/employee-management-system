DROP DATABASE IF EXISTS emp_trackerDB;
CREATE database emp_trackerDB;

USE emp_trackerDB;

CREATE TABLE department (
	department_id INT AUTO_INCREMENT NOT NULL,
    department VARCHAR(50) NOT NULL,
	PRIMARY KEY(department_id)
);

CREATE TABLE role (
	role_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    salary DECIMAL(15,2) NOT NULL,
    department_id INT,
    PRIMARY KEY (role_id),
    FOREIGN KEY(department_id) REFERENCES department(department_id)
);

CREATE TABLE employee (
	employee_id INT AUTO_INCREMENT NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
    role_id INT,
    PRIMARY KEY (employee_id),
	FOREIGN KEY(role_id) REFERENCES role(role_id)
);
