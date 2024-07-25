// Import the required modules
import express from "express"; // Express is a web framework for Node.js
import bodyParser from "body-parser"; // Body-parser middleware to handle HTTP POST request data
import pg from "pg"; // PostgreSQL client for Node.js

// Create an instance of Express
const app = express();
// Define the port number where the server will listen
const port = 3000;

// Configure the PostgreSQL client with connection details
const db = new pg.Client({
  user: "postgres", // Username for the database
  host: "localhost", // Host where the database server is running
  database: "secrets", // Name of the database
  password: "postgre@2024", // Password for the database user
  port: 5432, // Port number where the database server listens
});

// Connect to the PostgreSQL database
db.connect();

// Use body-parser to parse URL-encoded bodies (sent by HTML forms)
app.use(bodyParser.urlencoded({ extended: true }));
// Serve static files from the "public" directory (like CSS, images, etc.)
app.use(express.static("public"));

// Define the route for the home page
app.get("/", (req, res) => {
  res.render("home.ejs"); // Render the home.ejs view when the root URL is accessed
});

// Define the route for the login page
app.get("/login", (req, res) => {
  res.render("login.ejs"); // Render the login.ejs view when the /login URL is accessed
});

// Define the route for the registration page
app.get("/register", (req, res) => {
  res.render("register.ejs"); // Render the register.ejs view when the /register URL is accessed
});

// Handle the POST request for the registration form submission
app.post("/register", async (req, res) => {
  let email = req.body.username; // Get the email from the form data
  let password = req.body.password; // Get the password from the form data

  try {
    // Query the database to check if the email already exists
    const checkResult = await db.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    // If the email already exists, inform the user
    if (checkResult.rows.length > 0) {
      res.send("Email already exists. Try logging in");
    } else {
      // If the email does not exist, insert the new user into the database
      const result = await db.query(
        "INSERT INTO users (email, password) VALUES ($1, $2)",
        [email, password]
      );

      // Log the result of the insert query
      console.log(result);

      // Render the secrets.ejs view to show the secrets page after successful registration
      res.render("secrets.ejs");
    }
  } catch (err) {
    // Log any errors that occur during the process
    console.log(err);
    console.error(err);
  }
});

// Handle the POST request for the login form submission
app.post("/login", async (req, res) => {
  let email = req.body.username; // Get the email from the form data
  let password = req.body.password; // Get the password from the form data

  try {
    // Query the database to check if the email exists
    const checkEmail = await db.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    // Log the number of rows returned (for debugging)
    console.log(checkEmail.rows.length);

    // If the email exists in the database
    if (checkEmail.rows.length > 0) {
      // Query to check if the password matches the email
      const checkPassword = await db.query(
        "SELECT * FROM users WHERE email = $1 AND password = $2",
        [email, password]
      );

      // Log the rows returned by the password check query (for debugging)
      console.log(checkPassword.rows);

      // If the email and password match
      if (checkPassword.rows.length > 0) {
        // Render the secrets.ejs view to show the secrets page after successful login
        res.render("secrets.ejs");
      } else {
        // If the password is incorrect, inform the user
        res.send("Password entered is incorrect.");
      }
    } else {
      // If the email does not exist, inform the user
      res.send("Email entered is incorrect. User not found.");
    }
  } catch (err) {
    // Log any errors that occur during the process
    console.log(err);
    console.error(err);

    // Send a generic error message to the client
    res.status(500).send("An error occurred while processing your request.");
  }
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
