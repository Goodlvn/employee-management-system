DROP DATABASE IF EXISTS emp_trackerDB;
CREATE database emp_trackerDB;

USE emp_trackerDB;

CREATE TABLE department (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role (
	id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(50) NOT NULL,
    salary DECIMAL(15,2) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(department_id) REFERENCES department(id)
);

CREATE TABLE employee (
	id INT AUTO_INCREMENT NOT NULL,
	fist_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	role_id int NOT NULL,
	manager_id  int,
    PRIMARY KEY (id),
	FOREIGN KEY(role_id) REFERENCES role (id),
    FOREIGN KEY(manager_id) REFERENCES role(id)
);

SELECT * FROM employee;
SELECT * FROM role;
SELECT * FROM department;

INSERT INTO department (name)
VALUES ("Upper Management");

INSERT INTO department (name)
VALUES ("Lifeguarding");

INSERT INTO department (name)
VALUES ("Swim School");

INSERT INTO department (name)
VALUES ("Camps");

INSERT INTO role (title, salary, department_id)
VALUES ("Cheif Operating Officer", $80,000, 1);


