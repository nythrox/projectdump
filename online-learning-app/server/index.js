var createError = require("http-errors");
var express = require("express");
var path = require("path");
var mongoose = require("mongoose");
mongoose.set('debug', true);


var singlePost_controller = require("./controllers/PostsController");

const app = express();

mongoose.connect(
  "mongodb+srv://admin:P08514jwngba@express-locallibrary-tutorial-g12qi.mongodb.net/campus",
  function(err) {
    if (err) throw err;
    console.log("Successfully connected");
  }
);
mongoose = require('mongoose').set('debug', true);



app.use("/getPost/:id", singlePost_controller.post_detail);
app.use("/getPosts/:number", singlePost_controller.get_all_number);
app.use("/getPosts", singlePost_controller.get_all);

// Handles any requests that don't match the ones above
app.get("*", (req, res) => {
  res.send("welcome, friend.");
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log("App is listening on port " + port);


/* in case of no internet
res.send()
[{"_id":"5c7e9acf1c9d4400000eb937","title":"Name of the Wind","description":"one upon a time","author":"Neil Krhonemëil","image":"placeholder-start.jpg","url":"/post/5c7e9acf1c9d4400000eb937","id":"5c7e9acf1c9d4400000eb937"},{"_id":"5c7eb2b91c9d4400000eb938","title":"Way of Kings","description":"very good book read now","author":"Veil Tsukendere","image":"placeholder-2.jpg","url":"/post/5c7eb2b91c9d4400000eb938","id":"5c7eb2b91c9d4400000eb938"},{"_id":"5c7ecc991c9d4400000eb939","title":"A Wise Mans Fera","author":"Koko Snutlazvotsiski","description":"waka waka woko woko kvothe is koko","image":"placeholder-3.jpg","url":"/post/5c7ecc991c9d4400000eb939","id":"5c7ecc991c9d4400000eb939"}]
*/