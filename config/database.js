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
    host: 'sql9.freesqldatabase.com',
    user: 'sql9584646',
    password: 'ntlbKxqnXu',
    database: 'sql9584646'
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