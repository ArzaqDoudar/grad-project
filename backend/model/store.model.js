const mongoose = require('mongoose');

var store =new mongoose.Schema({
    name: {type : String , require : true},//
    phone: {type : String },//
    location: {type : String },
    avatar: {type : String },//
    rate: {type : String },//
    lat: {type : String },//
    long: {type : String },
})

module.exports = mongoose.model('STORE' , store);



