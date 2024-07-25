import express from "express";
import axios from "axios";

const app = express();
const port = 3000;
const API_URL = "https://secrets-api.appbrewery.com/";

//TODO 1: Fill in your values for the 3 types of auth.
const myUsername = "suvam";
const myPassword = "suvam";
const myAPIKey = "925097a3-15fa-4848-9854-d768945a691f";
const myBearerToken = "35623e30-a770-4260-95b4-e2c6ec550c59";

app.get("/", (req, res) => {
  res.render("index.ejs", { content: "API Response." });
});

app.get("/noAuth", async (req, res) => {
  //TODO 2: Use axios to hit up the /random endpoint
  //The data you get back should be sent to the ejs file as "content"
  //Hint: make sure you use JSON.stringify to turn the JS object from axios into a string.
  let response = await axios.get(API_URL + "random");
  let result = response.data;
  res.render("index.ejs", { content: JSON.stringify(result) });
});

app.get("/basicAuth", async (req, res) => {
  //TODO 3: Write your code here to hit up the /all endpoint
  //Specify that you only want the secrets from page 2
  //HINT: This is how you can use axios to do basic auth:
  // https://stackoverflow.com/a/74632908
  /*
   axios.get(URL, {
      auth: {
        username: "abc",
        password: "123",
      },
    });
  */
  let response = await axios.get(API_URL + "all", {
    auth: {
      username: myUsername,
      password: myPassword,
    },
    params: { page: 2 },
  });
  res.render("index.ejs", { content: JSON.stringify(response.data) });
});

app.get("/apiKey", async (req, res) => {
  //TODO 4: Write your code here to hit up the /filter endpoint
  //Filter for all secrets with an embarassment score of 5 or greater
  //HINT: You need to provide a query parameter of apiKey in the request.
  let response = await axios.get(API_URL + "filter", {
    params: {
      score: 5,
      apiKey: myAPIKey,
    },
  });
  res.render("index.ejs", { content: JSON.stringify(response.data) });
});

app.get("/bearerToken", async (req, res) => {
  //TODO 5: Write your code here to hit up the /secrets/{id} endpoint
  //and get the secret with id of 42
  //HINT: This is how you can use axios to do bearer token auth:
  // https://stackoverflow.com/a/52645402
  /*
  axios.get(URL, {
    headers: { 
      Authorization: `Bearer <YOUR TOKEN HERE>` 
    },
  });
  */
  var id = 42;
  let response = await axios.get(API_URL + `secrets/${id}`, {
    headers: {
      Authorization: `Bearer ${myBearerToken}`,
    },
  });
  res.render("index.ejs", { content: JSON.stringify(response.data) });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
