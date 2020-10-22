-- DEPARTMENT SEEDS
INSERT INTO department (department)
VALUES ("Upper Management");

INSERT INTO department (department)
VALUES ("Lifeguarding");

INSERT INTO department (department)
VALUES ("Swim School");

INSERT INTO department (department)
VALUES ("Camps");



-- ROLE SEEDS
INSERT INTO role (title, salary, department_id)
VALUES ("Cheif Operating Officer", 80000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("General Manager", 70000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Head Lifeguard", 55000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Head of Swim School", 60000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Head of Camps", 63000, 4);

INSERT INTO role (title, salary, department_id)
VALUES ("Lead Lifeguard", 18.50, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Swim School Lead", 20, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Camp Lead", 18.50, 4);


-- EMPLOYEE SEEDS

INSERT INTO employee (first_name, last_name, role_id)
VALUES ("Jerome", "Barclay", 2);

INSERT INTO employee (first_name, last_name, role_id)
VALUES ("Jonathan", "Martinez", 3);

INSERT INTO employee (first_name, last_name, role_id)
VALUES ("Jess", "Vargas", 4);


