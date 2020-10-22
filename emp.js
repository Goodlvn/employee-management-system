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
                choices: ["Add Employee", "Add Department", "Add Role", "View All Employees", "View All Departments", "View All Roles",
                    "Update Employee Roles", "View Employees By Department"],
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
                case "View All Departments":
                    viewAllDept();
                    break;
                case "View All Roles":
                    viewAllRoles();
                    break;
                case "Update Employee Roles":
                    updateRoles();
                    break;
                case "View Employees By Department":
                    viewByDept();
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

    connection.query("SELECT * FROM role", (err, res) => {
        console.log(res[0].title);
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
                    message: "What is their position?",
                    choices: function allRoles() {
                        var choiceArray = [];
                        res.forEach(res => choiceArray.push(res.title));
                        return choiceArray;
                    },
                    name: "role"
                },
            ])
            .then(answers => {
                var roleID;

                res.forEach(res => {
                    if (answers.role === res.title) {
                        roleID = res.role_id;
                    };
                });

                connection.query("INSERT INTO employee SET ?",
                    {
                        first_name: answers.firstName,
                        last_name: answers.lastName,
                        role_id: roleID,
                    },
                    (err, res) => {
                        if (err) throw err;
                        console.log("Employee Added!");
                        start();
                    });
            })
    });
};

function viewAllEmp() {

    connection.query(`SELECT employee.employee_id, employee.first_name, employee.last_name, 
                    role.title, role.salary, department.department FROM employee 
                    INNER JOIN role ON employee.role_id=role.role_id
                    INNER JOIN department ON role.department_id=department.department_id;`, (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    });
};

function viewAllDept() {
    connection.query(`SELECT department.department FROM department`, (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    });
};

function viewAllRoles() {
    connection.query(`SELECT role.title, role.salary, department.department FROM role INNER JOIN department ON role.department_id=department.department_id`, (err, res) => {
        if (err) throw err;
        console.table(res);
        start();
    });
};

function updateRoles() {

    var roleChoices = [];
    var roleObjArray = [];

    connection.query("SELECT * FROM role", (err, res) => {
        res.forEach(res => roleChoices.push(res.title));
        res.forEach(res => roleObjArray.push(res));
    });

    connection.query("SELECT * FROM employee", (err, res) => {
        if (err) throw err;
        inquirer
            .prompt([
                {
                    type: "list",
                    message: "Which employee would you like to update?",
                    choices: function allEmp() {
                        var choicesArray = [];
                        res.forEach(res => choicesArray.push(`${res.first_name} ${res.last_name}`));
                        return choicesArray;
                    },
                    name: "empChoice"
                },
                {
                    type: "list",
                    message: "What is their new role?",
                    choices: roleChoices,
                    name: "roleChoice"
                },
            ])
            .then(answers => {

                var empID;
                var roleID;

                res.forEach(res => {
                    if (answers.empChoice === `${res.first_name} ${res.last_name}`) {
                        empID = res.employee_id;
                    }
                });

                roleObjArray.forEach(role => {
                    if (answers.roleChoice === role.title) {
                        roleID = role.role_id;
                    }
                });

                connection.query("UPDATE employee SET ? WHERE ?",
                    [
                        {
                            role_id: roleID
                        },
                        {
                            employee_id: empID
                        }
                    ],
                    (err, res) => {
                        console.log("employee updated");
                        start();
                    });
            });
    });
};

function viewByDept() {

    
    connection.query("SELECT * FROM department", (err, res) => {
        let deptChoices = [];
        let deptID;


        // console.log(res);

        res.forEach(res => deptChoices.push(res.department));

        inquirer
            .prompt([
                {
                    type: "list",
                    message: "What department would you like to look at?",
                    choices: deptChoices,
                    name: "deptChoice"
                }
            ])
            .then(answers => {

                res.forEach(res => {
                    if (res.department === answers.deptChoice) {
                        deptID = res.department_id;

                    };
                });

                connection.query(`SELECT employee_id, first_name, last_name, role.title
                        FROM employee INNER JOIN role ON employee.role_id=role.role_id 
                        WHERE role.department_id= ?;`, [deptID],
                    (err, res) => {
                        if (err) throw err;

                        console.table(res);
                    });



            });
    });


};