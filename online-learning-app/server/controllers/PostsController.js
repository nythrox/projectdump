var SinglePost = require('../models/Posts');
var async = require('async');

// Display detail page for a specific book.
exports.post_detail = function(req, res, next) {
    SinglePost.findById(req.params.id, function(err, post) {
        if (err) console.log(err);
        else {
            res.send(post);
            console.log("success?" + post)
        } 
    });
};

exports.get_all_number = function(req,res,next) {
    SinglePost.find({
    }).limit(parseInt(req.params.number))
    .exec(function(err, books) {
        if (err) throw err;
        res.send(books)
        console.log(books);
    });
}

exports.get_all = function(req,res,next) {
    SinglePost.find({})
    .exec(function(err, books) {
        if (err) throw err;
        res.send(books)
        console.log(books);
    });
}