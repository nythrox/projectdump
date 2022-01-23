import express from "express";
import mysql2 from "mysql2/promise";
const app = express();

interface User {
  id: number
  name: string
  age?: number
}
let db = mysql2.createConnection("aa");

async function findUser(id: number): Promise<User> {
  const sql = await db;
  const [result, _] = await sql.execute<mysql2.RowDataPacket[]>(
    "SELECT * FROM users WHERE id = ?",
    [id]
  );
  
  const user = result[0]
  return user as User;
}
async function updateUser(id: number) {
  const sql = await db;
  const [result, _] = await sql.execute<mysql2.RowDataPacket[]>(
    "UPDATE users SET name = $ age = $ WHERE id = $",
    ['jason', 18, id]
  );
  
}

async function findUsers(id: number): Promise<User[]> {
  const sql = await db;
  const [result, _] = await sql.execute<mysql2.RowDataPacket[]>(
    "SELECT * FROM users WHERE id = ?",
    [id]
  );

  return result as User[];
}


