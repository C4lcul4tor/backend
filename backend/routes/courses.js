// api/courses.js
import pool from '../utils/db.js';

export default async function handler(req, res) {
  try {
    const conn = await pool.getConnection();

    // GET request (all courses or status view)
    if (req.method === 'GET') {
      const { status } = req.query;

      if (status === 'true') {
        const [rows] = await conn.query('SELECT title, is_open FROM courses');
        conn.release();
        return res.status(200).json(rows);
      }

      const [rows] = await conn.query('SELECT * FROM courses ORDER BY id DESC');
      conn.release();
      return res.status(200).json(rows);
    }

    // POST request
    if (req.method === 'POST') {
      const body = req.body;

      // 🔁 Toggle is_open
      if (body.toggle) {
        const { course, is_open } = body;
        if (!course || typeof is_open !== 'boolean') {
          return res.status(400).json({ error: 'Invalid data' });
        }

        await conn.query('UPDATE courses SET is_open = ? WHERE title = ?', [is_open ? 1 : 0, course]);
        conn.release();
        return res.status(200).json({ success: true });
      }

      // ➕ Add a new course
      const {
        title,
        description,
        instructor_name,
        duration,
        meetings_per_week,
        lecture_hours_start,
        lecture_hours_end,
        price,
        sale_price,
        curriculum,
        learning_outcomes
      } = body;

      if (!title || !description || !instructor_name || !duration || !lecture_hours_start || !lecture_hours_end || price == null || !curriculum || !learning_outcomes) {
        return res.status(400).json({ error: 'Missing fields' });
      }

      const sql = `
        INSERT INTO courses (
          title, description, instructor_name, duration, meetings_per_week,
          lecture_start_time, lecture_end_time, price, sale_price,
          curriculum, learning_outcomes
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;

      await conn.query(sql, [
        title, description, instructor_name, duration, meetings_per_week,
        lecture_hours_start, lecture_hours_end, price, sale_price || 0,
        curriculum, learning_outcomes
      ]);
      conn.release();
      return res.status(201).json({ message: 'Course created successfully' });
    }

    res.status(405).json({ error: 'Method not allowed' });
  } catch (err) {
    console.error('DB Error:', err);
    res.status(500).json({ error: 'Database error' });
  }
}
