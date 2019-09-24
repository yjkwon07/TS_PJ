const mysql = require('mysql2/promise');

module.exports = mysql.createPool({
        host: process.env.MYSQL_HOST,
        port: Number(process.env.MYSQL_PORT),
        user: process.env.MYSQL_ID,
        password: process.env.MYSQL_PASSWORD,
        database: process.env.MYSQL_DATABASE,
        connectionLimit: 4,
    });
