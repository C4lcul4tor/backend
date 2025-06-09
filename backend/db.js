// backend/db.js
import mysql from 'mysql2/promise';

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  waitForConnections: true,
});

export default pool;

// Use promise wrapper
const db = connection.promise();

db.connect()
  .then(() => {
    console.log('✅ Connected to MariaDB');
  })
  .catch((err) => {
    console.error('❌ Error connecting to MariaDB:', err);
  });

module.exports = db;

