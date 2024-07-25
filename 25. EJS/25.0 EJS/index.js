import express from "express";
import bodyParser from "body-parser";

const app = express();
const port = 3000;
const today = new Date();
//Test code
// weekend:
// new Date("June 24, 2023 11:13:00");
// weekday:
// new Date("June 20, 2023 11:13:00");
const day = today.getDay();

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.render("index.ejs", { day_of_the_week: day });
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
