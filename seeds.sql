
-- FACILITY SEEDS 

INSERT INTO facility (name)
VALUES ("Rinconada");

INSERT INTO facility (name)
VALUES ("Burgess");

INSERT INTO facility (name)
VALUES ("Belle Haven");

-- DEPARTMENT SEEDS

INSERT INTO department (name)
VALUES ("Upper Management");

INSERT INTO department (name)
VALUES ("Lifeguarding");

INSERT INTO department (name)
VALUES ("Swim School");

INSERT INTO department (name)
VALUES ("Camps");

INSERT INTO department (name)
VALUES ("Client Services");

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
VALUES ("Head of Client Services", 58000, 5);

INSERT INTO role (title, salary, department_id)
VALUES ("Lead Lifeguard", 18.50, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Swim School Lead", 20, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Camp Lead", 18.50, 4);

INSERT INTO role (title, salary, department_id)
VALUES ("Customer Success Rep.", 20, 5);

