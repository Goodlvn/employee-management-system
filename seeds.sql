
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

INSERT INTO role (title, salary, department_id)
VALUES ("Lifeguard", 15, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Swim Instructor", 16, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Camp Counselor", 15, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Front Desk", 15, 3);

-- EMPLOYEE SEEDS

INSERT INTO employee (fist_name, last_name, role_id)
VALUES ("Steve", "Young", 1);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jerome", "Barclay", 2, 1, 1);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Peter", "Cordingly", 2, 2, 1);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Thomas", "Truong", 2, 3, 1);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jonathan", "Martinez", 3, 1, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Sean", "Vogelsburg", 3, 2, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jess", "Montano", 4, 1, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jacob", "Allen", 4, 2, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Steve", "Hurko", 5, 1, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jojo", "Duffy", 5, 2, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id)
VALUES ("Melissa", "Joy", 6, 1);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Kathy", "Miller", 6, 2, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Marla", "Allen", 7, 1, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Lauren", "Fuller", 7, 2, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Sam", "Parish", 8, 1, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jenna", "Holden", 8, 2, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Terra", "Majors", 9, 1, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Zoe", "Bever", 9, 2, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Michael", "Palabyab", 10, 1, 6);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("John", "Tupper", 10, 2, 6);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Ethan", "Chen", 11, 1, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Malia", "Wanderer", 11, 1, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Denton", "Long", 11, 2, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Dorian", "Griego", 11, 2, 3);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Sage", "Cammak", 11, 3, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Miles", "Gentry", 11, 3, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jenna", "Philbin", 12, 1, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Portia", "Kwan", 12, 1, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jacey", "Williams", 12, 2, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Arnecia", "Smith", 12, 2, 4);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Viviana", "Luna", 12, 3, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Yajira", "Salgado", 12, 3, 2);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Ehtan", "Harrington", 13, 1, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Tucker", "Mills", 13, 1, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Yaya", "Vargas", 13, 2, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Sarah", "Dunwoody", 13, 2, 5);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jonathan", "Prabhu", 14, 1, 6);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Jason", "Vanoncini", 14, 1, 6);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Justin", "Smith", 14, 2, 6);

INSERT INTO employee (fist_name, last_name, role_id, facility_id, manager_id)
VALUES ("Alessandrea", "Alonso", 14, 2, 6);