import express from "express";
import bodyParser from "body-parser";

const app = express();
const port = 3000;
var title = "Enter your name below 👇🏻";

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.render("index.ejs", { title });
});

app.post("/submit", (req, res) => {
  let fullname = req.body.fName + req.body.lName;
  title = `There are ${fullname.length} letters in your name`;
  res.render("index.ejs", { title });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
