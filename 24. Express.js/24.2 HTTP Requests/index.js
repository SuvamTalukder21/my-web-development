import express from "express";
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  // console.log(req.rawHeaders);
  res.send("<h1>Hello World!</h1>");
});

app.get("/contact", (req, res) => {
  // console.log(req.rawHeaders);
  res.send("<h2>suvamtalukder2002@gmail.com</h2>");
});

app.get("/about", (req, res) => {
  // console.log(req.rawHeaders);
  res.send("<h3>I'm pursuing Mechanical Engineering</h3>");
});

app.listen(port, () => {
  console.log(`Server running on port ${port}.`);
});
