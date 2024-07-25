import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "postgre@2024",
  port: 5432,
});

db.connect();

var visited_countries = [
  // {country_code: "IN"},
  // {country_code: "GB"},
  // {country_code: "US"}
];

var countries = [];
let codes = [];

async function fetchCountryData(query, ...params) {
  try {
    const res1 = await db.query(query);
    visited_countries = res1.rows;
    console.log("User data: ", visited_countries);

    const res2 = await db.query(query, params);
    countries = res2.rows;
    // console.log("User data: ", countries);
  } catch (err) {
    console.error("Error executing query", err.stack);
  } finally {
    db.end();
  }
}

// fetchCountryData();

// db.query("SELECT country_code FROM visited_countries", (err, res) => {
//   if (err) {
//     console.error("Error executing query", err.stack);
//   } else {
//     visited_countries = res.rows;
//     console.log("User data: ", visited_countries);
//   }
//   // db.end();
// });

// db.query("SELECT country_code, country_name FROM countries", (err, res) => {
//   if (err) {
//     console.error("Error executing query", err.stack);
//   } else {
//     countries = res.rows;
//     console.log("User data: ", countries);
//   }
//   db.end();
// });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", async (req, res) => {
  //Write your code here.
  // var codes = country_data.map((item) => item.country_code);
  await fetchCountryData("SELECT country_code FROM visited_countries");
  visited_countries.forEach((item) => {
    codes.push(item.country_code);
  });
  res.render("index.ejs", { total: codes.length, countries: codes });
});

// console.log(country_data);
console.log(codes);

app.post("/add", async (req, res) => {
  var country = req.body.country;
  await fetchCountryData(
    "SELECT country_code FROM countries WHERE country_name = $1",
    [country]
  );
  // countries.forEach((item) => {
  //   if (country.toLowerCase() === item.country_name.toLowerCase()) {
  //     codes.push(item.country_code);
  //   }
  // });
  // res.render("index.ejs", { total: codes.length, countries: codes });
  res.redirect("/");
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
