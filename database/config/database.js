require("dotenv").config();

module.exports = {
  development: {
    username: "root",
    password: process.env.DB_PWD || "",
    database: "workouteazy",
    host: "127.0.0.1",
    dialect: "mysql",
    port: process.env.DB_PORT || "3306",
  },
  test: {
    username: "root",
    password: null,
    database: "database_test",
    host: "127.0.0.1",
    dialect: "mysql",
  },
  production: {
    username: "root",
    password: null,
    database: "database_production",
    host: "127.0.0.1",
    dialect: "mysql",
  },
};
