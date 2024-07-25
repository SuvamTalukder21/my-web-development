import express from "express";
import bodyParser from "body-parser";
import axios from "axios";

const app = express();
const port = 3000;

const API_URL = "https://v2.jokeapi.dev/joke/Any?type=single";

app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  res.render("index.ejs", { joke: "Prepare for a joke!" });
});

app.post("/get-joke", async (req, res) => {
  let word = req.body.word;
  if (word === "" || word === undefined || word === null) {
    const result = await axios.get(`${API_URL}`);
    // console.log(result);
    res.render("index.ejs", { joke: result.data.joke });
  } else {
    const result = await axios.get(`${API_URL}&contains=${word}`);
    // console.log(result);
    if (result.data.error === false) {
      res.render("index.ejs", {
        joke: result.data.joke,
      });
    } else {
      res.render("index.ejs", {
        joke: "No joke found",
      });
    }
  }
});

app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});
