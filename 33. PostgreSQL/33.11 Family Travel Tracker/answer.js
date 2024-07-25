import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// Database connection setup
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "123456",
  port: 5432,
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let currentUserId = 1; // Default to the first user

// Fetch visited countries for a specific user
async function checkVisited(userId) {
  try {
    const result = await db.query(
      "SELECT country_code FROM visited_countries WHERE user_id = $1",
      [userId]
    );
    return result.rows.map((row) => row.country_code);
  } catch (err) {
    console.error("Error executing query", err.stack);
    return [];
  }
}

// Fetch all users from the database
async function getUsers() {
  try {
    const result = await db.query("SELECT * FROM users");
    return result.rows;
  } catch (err) {
    console.error("Error executing query", err.stack);
    return [];
  }
}

// GET home page
app.get("/", async (req, res) => {
  const countries = await checkVisited(currentUserId);
  const users = await getUsers();
  const currentUser = users.find((user) => user.id === currentUserId);

  res.render("index.ejs", {
    countries: countries,
    total: countries.length,
    users: users,
    color: currentUser ? currentUser.color : "teal",
  });
});

// Handle adding a country for the current user
app.post("/add", async (req, res) => {
  const input = req.body["country"].trim();
  if (!input) {
    return res.redirect("/");
  }

  try {
    const result = await db.query(
      "SELECT country_code FROM countries WHERE LOWER(country_name) LIKE '%' || $1 || '%';",
      [input.toLowerCase()]
    );

    if (result.rows.length > 0) {
      const countryCode = result.rows[0].country_code;
      await db.query(
        "INSERT INTO visited_countries (country_code, user_id) VALUES ($1, $2)",
        [countryCode, currentUserId]
      );
    }
  } catch (err) {
    console.log(err);
  }
  res.redirect("/");
});

// Handle user selection
app.post("/user", async (req, res) => {
  const selectedUserId = parseInt(req.body["user"], 10);
  if (selectedUserId) {
    currentUserId = selectedUserId;
  }
  res.redirect("/");
});

// Handle adding a new user
app.post("/new", async (req, res) => {
  const userName = req.body["name"].trim();
  const userColor = req.body["color"].trim();

  if (userName && userColor) {
    try {
      await db.query("INSERT INTO users (name, color) VALUES ($1, $2)", [
        userName,
        userColor,
      ]);
    } catch (err) {
      console.log(err);
    }
  }
  res.redirect("/");
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

process.on("SIGTERM", () => {
  db.end();
  console.log("Database connection closed.");
});
