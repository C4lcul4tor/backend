// api/lecturers.js
import pool from '..db.js';

export default async function handler(req, res) {
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });

  try {
    const conn = await pool.getConnection();
    const [results] = await conn.query('SELECT id, name, role, bio, image_url AS image FROM lecturers');
    conn.release();

    res.status(200).json(results);
  } catch (err) {
    console.error('DB Error:', err);
    res.status(500).json({ error: 'Failed to fetch lecturers' });
  }
}
