import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "permalist",
  password: "postgre@2024",
  port: 5432,
});

db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let items = NaN;

async function toDoList(query, params = NaN) {
  try {
    let res = await db.query(query, params);
    items = res.rows;
    // console.log(items);
  } catch (err) {
    console.error(err);
  }
  // finally {
  //   await db.end();
  // }
}

app.get("/", async (req, res) => {
  await toDoList("SELECT * FROM items ORDER BY id ASC;");
  res.render("index.ejs", {
    listTitle: "Today",
    listItems: items,
  });
});

app.post("/add", async (req, res) => {
  const item = req.body.newItem;
  await toDoList("INSERT INTO items (title) VALUES ($1);", [item]);
  // items.push({ title: item });
  res.redirect("/");
});

app.post("/edit", async (req, res) => {
  let id = req.body.updatedItemId;
  let title = req.body.updatedItemTitle;
  await toDoList("UPDATE items SET title = $1 WHERE id = $2;", [title, id]);
  res.redirect("/");
});

app.post("/delete", async (req, res) => {
  let id = req.body.deleteItemId;
  await toDoList("DELETE FROM items WHERE id = $1;", [id]);
  res.redirect("/");
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

process.on("SIGTERM", () => {
  db.end();
  console.log("Database connection closed.");
});
