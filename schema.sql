DROP DATABASE IF EXISTS emp_trackerDB;
CREATE database emp_trackerDB;

USE emp_trackerDB;

CREATE TABLE facility (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE department (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
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
    facility_id INT,
	manager_id  INT,
    PRIMARY KEY (id),
	FOREIGN KEY(role_id) REFERENCES role (id),
    FOREIGN KEY(facility_id) REFERENCES facility(id),
    FOREIGN KEY(manager_id) REFERENCES role(id)
);

SELECT * FROM employee;
SELECT * FROM role;
SELECT * FROM department;
SELECT * FROM facility;


--   connection.query("SELECT * FROM department", (err, res) => {
--         if (err) throw err;

--         res.forEach(dept => departments.push(dept.department));
--         inquirer
--             .prompt([
--                 {
--                     type: "input",
--                     message: "What is their first name?",
--                     name: "firstName"
--                 },
--                 {
--                     type: "input",
--                     message: "What is their last name?",
--                     name: "lastName"
--                 },
--                 {
--                     type: "list",
--                     message: "What is their title?",
--                     choices: roles,
--                     name: "role"
--                 },
--             ])
--             .then(answers => {
--                 var roleID = 0;

--                 connection.query("SELECT * FROM role", (err, res) => {
--                     res.forEach(res => {
--                         if (answers.role === res.title) {
--                             roleID = res.role_id;
--                             console.log(roleID);

--                         };
--                     });
--                 });

                

                
--             });
--     });