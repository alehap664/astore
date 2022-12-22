// database module
var mysql = require('mysql');

/**
 * Host: sql9.freesqldatabase.com
 * Database name: sql9584646
 * Database user: sql9584646
 * Database password: ntlbKxqnXu
 * Port number: 3306
 */
var config = {
    connectionLimit : 1000,
    connectTimeout  : 60 * 60 * 1000,
    acquireTimeout  : 60 * 60 * 1000,
    timeout         : 60 * 60 * 1000,

    host: 'db4free.net',
    user: 'astore664',
    password: 'abc!Q2w3e',
    database: 'astore664'
};

// init database
var pool = mysql.createPool(config);

//Fetch data
function RunQuery(sql, callback) {
    pool.getConnection(function (err, conn) {
        console.error(err)
        if (err) {
            ShowErrors(err);
        }
        conn.query(sql, function (err, rows, fields) {
            if (err) {
                ShowErrors(err);
            }
            conn.release();
            callback(rows);
        });
    });
}

//Throw errors
function ShowErrors(err) {
    throw err;
}

module.exports = {
    RunQuery: RunQuery
};