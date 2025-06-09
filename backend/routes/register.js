// api/register.js
import pool from '..db.js';

export default async function handler(req, res) {
  try {
    const conn = await pool.getConnection();

    if (req.method === 'GET') {
      const { all, courses, lecturers } = req.query;

      if (all === 'true') {
        const [results] = await conn.query('SELECT * FROM registrations ORDER BY id DESC');
        conn.release();
        return res.status(200).json(results);
      }

      if (courses === 'status') {
        const [results] = await conn.query('SELECT title, is_open FROM courses');
        conn.release();
        return res.status(200).json(results);
      }

      if (courses === 'all') {
        const [results] = await conn.query('SELECT * FROM courses ORDER BY id DESC');
        conn.release();
        return res.status(200).json(results);
      }

      if (lecturers === 'all') {
        const [results] = await conn.query('SELECT * FROM lecturers ORDER BY id DESC');
        conn.release();
        return res.status(200).json(results);
      }

      res.status(400).json({ error: 'Invalid query' });
    }

    if (req.method === 'POST') {
      const body = req.body;

      // 💰 Toggle paid/unpaid
      if (body.toggle_payment) {
        const { id, is_paid } = body;
        if (typeof id !== 'number' || typeof is_paid !== 'boolean') {
          return res.status(400).json({ error: 'Invalid payment toggle input' });
        }

        await conn.query('UPDATE registrations SET is_paid = ? WHERE id = ?', [is_paid ? 1 : 0, id]);
        conn.release();
        return res.status(200).json({ success: true });
      }

      // 🔒 Toggle course lock/unlock
      if (body.toggle_course) {
        const { course, is_open } = body;
        if (typeof course !== 'string' || typeof is_open !== 'boolean') {
          return res.status(400).json({ error: 'Invalid course toggle input' });
        }

        await conn.query('UPDATE courses SET is_open = ? WHERE title = ?', [is_open ? 1 : 0, course]);
        conn.release();
        return res.status(200).json({ success: true });
      }

      // 📝 Register student
      const { name, surname, birthdate, personalNumber, mobile, email, course } = body;

      if (!(name && surname && birthdate && personalNumber && mobile && email && course)) {
        return res.status(400).json({ error: 'Missing fields' });
      }

      const sql = `INSERT INTO registrations (name, surname, birthdate, personalNumber, mobile, email, course, registered_at, is_paid)
                   VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), 0)`;

      await conn.query(sql, [name, surname, birthdate, personalNumber, mobile, email, course]);
      conn.release();
      return res.status(200).json({ success: true });
    }

    res.status(405).json({ error: 'Method not allowed' });
  } catch (err) {
    console.error('DB Error:', err);
    res.status(500).json({ error: 'Database error' });
  }
}
