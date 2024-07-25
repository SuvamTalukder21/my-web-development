const fs = require("fs");

// fs.writeFile("doc.txt", "Hello from NodeJS!", (err) => {
//   if (err) throw err;
//   console.log("The file has been saved!");
// });

// fs.appendFile("doc.txt", "\nHello from Angela!", (err) => {
//   if (err) throw err;
//   console.log('The "Hello from Angela!" was appended to file!');
// });

fs.readFile("./doc.txt", "utf-8", (err, data) => {
  if (err) throw err;
  console.log(data);
});
