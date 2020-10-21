const mysql = require("mysql");
const inquirer = require("inquirer");
const cTable = require('console.table');

const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "password",
    database: "emp_trackerDB"
});

connection.connect((err) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    start();
});

function start() {
    inquirer
        .prompt([
            {
                type: "list",
                message: "What would you like to do?",
                choices: ["Add Employee", "Add Department", "Add Role", "View All Employees", "View All Employees By Department", "View All Employees By Manager"],
                name: "initQuery"
            }
        ])
        .then(answers => {

            switch (answers.initQuery) {
                case "Add Department":
                    addDept();
                    break;
                case "Add Role":
                    addRole();
                    break;
                case "Add Employee":
                    addEmp();
                    break;
                case "View All Employees":
                    viewAllEmp();
                    break;
                default:
                    console.log("Or do the default");

            };
        });
};

function addDept() {
    inquirer
        .prompt([
            {
                type: "input",
                message: "What is the name of the Department?",
                name: "departmentName"
            },
        ])
        .then(answers => {
            connection.query("INSERT INTO department SET ?",
                {
                    department: answers.departmentName
                },
                (err, res) => {
                    if (err) throw err;
                    console.log("Department added!");
                    start();
                });   
        });

        
}

function addRole() {

    connection.query("SELECT * FROM department", (err, res) => {
        if (err) throw err;

        let departments = [];
        res.forEach(dept => departments.push(dept.department));

        inquirer
            .prompt([
                {
                    type: "input",
                    message: "What is the name of the role?",
                    name: "roleName"
                },
                {
                    type: "input",
                    message: "What is the salary for this position?",
                    name: "salary"
                },
                {
                    type: "list",
                    message: "What department does this position belong to?",
                    choices: departments,
                    name: "department"
                },
            ])
            .then(answers => {

                let deptID;

                res.forEach(res => {
                    if (answers.department === res.department) {
                        deptID = res.department_id;
                    };
                });

                connection.query("INSERT INTO role SET ?",
                    {
                        title: answers.roleName,
                        salary: answers.salary,
                        department_id: deptID
                    },
                    (err, res) => {
                        if (err) throw err;
                        console.log("Position added!");
                        start();
                    });
            });
    });
};

function addEmp() {

    let departments = [];
    let roles = [];

    connection.query("SELECT * FROM role", (err, res) => {
        res.forEach(role => roles.push(role.title));
    });

    connection.query("SELECT * FROM department", (err, res) => {
        if (err) throw err;

        res.forEach(dept => departments.push(dept.department));
        inquirer
            .prompt([
                {
                    type: "input",
                    message: "What is their first name?",
                    name: "firstName"
                },
                {
                    type: "input",
                    message: "What is their last name?",
                    name: "lastName"
                },
                {
                    type: "list",
                    message: "What department do they belong to?",
                    choices: departments,
                    name: "department"
                },
                {
                    type: "list",
                    message: "What is their title?",
                    choices: roles,
                    name: "role"
                },
            ])
            .then(answers => {

                let deptID;
                let roleID;

                res.forEach(res => {
                    if (answers.department === res.department) {
                        deptID = res.department_id;
                    };
                });

                connection.query("SELECT * FROM role", (err, res) => {
                    res.forEach(res => {
                        if (answers.role === res.title) {
                            roleID = res.role_id;
                        };
                    });
                });

                connection.query("INSERT INTO employee SET ?",
                    {
                        first_name: answers.firstName,
                        last_name: answers.lastName,
                        role_id: roleID,
                        department_id: deptID
                    },
                    (err, res) => {
                        if (err) throw err;
                        console.log("Employee Added!");
                        start();
                    });
            });
    });
}

function viewAllEmp() {
    connection.query("SELECT * FROM employee", (err, res) => {
        if (err) throw err;

        console.table(res);
    });
};
