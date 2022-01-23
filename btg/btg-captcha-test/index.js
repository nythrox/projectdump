const express = require("express");
var path = require('path');
const app = express();

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname + "/index.html"));
});

app.listen(8000, () => {
  console.log("started listening at port ", 8000);
});
