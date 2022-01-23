var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var Posts = new Schema({
    title: {type: String, required: true},
    desccription: {type: String, required: true},
    author: {type: String, required: true},
},{ toObject: { virtuals: true },toJSON: {virtuals: true} });

Posts
.virtual('url')
.get(function () {
  return '/post/' + this._id;
});

//Export model
module.exports = mongoose.model('Posts', Posts);