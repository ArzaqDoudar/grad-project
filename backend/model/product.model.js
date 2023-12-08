const mongoose = require('mongoose');

var product =new mongoose.Schema({
    name: {type : String , require : true},//
    price: {type : String },//
    description: {type : String },
    ingredient: {type : String },
    image: {type : String },//
    store_id: {type : String },//
})

module.exports = mongoose.model('PRODUCT' , product);



