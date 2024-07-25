import express from "express";
import bodyParser from "body-parser";

const app = express();
const port = 3000;

// Set up middleware
app.use(bodyParser.urlencoded({ extended: true }));
// app.set('view engine', 'ejs');
app.use(express.static("public"));

// Define routes
app.get("/", (req, res) => {
  // Render home page with posts
});

app.get("/new", (req, res) => {
  // Render form for creating new post
});

app.post("/create", (req, res) => {
  // Create new post
});

app.get("/edit/:id", (req, res) => {
  // Render form for editing post
});

app.post("/update/:id", (req, res) => {
  // Update post
});

app.post("/delete/:id", (req, res) => {
  // Delete post
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
