// Note: Can't replace \n with <br>&emsp in review string from database

import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "library",
  password: "postgre@2024",
  port: 5432,
});

db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", async (req, res) => {
  const books = await db.query("SELECT * FROM books ORDER BY id ASC;");
  // console.log(books.rows);
  res.render("index.ejs", { library: books.rows });
});

app.get("/book", async (req, res) => {
  const id = req.query.id;
  const book = await db.query("SELECT * FROM books WHERE id = $1;", [id]);
  // console.log(id);
  // console.log(book.rows[0].review);
  // res.render("book.ejs", { book: book.rows[0] });
  res.render("book.ejs", {
    title: book.rows[0].title,
    author: book.rows[0].author,
    publication_year: book.rows[0].publication_year,
    rating: book.rows[0].rating,
    isbn: book.rows[0].isbn,
    description: book.rows[0].description,
    review: book.rows[0].review,
  });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
