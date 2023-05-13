const mongoose = require('mongoose');

var carbs =new mongoose.Schema({
    name:{type:Number, require : true},
    weight:{type:Number, require : true},
    carb:{type:Number, require : true},
})

module.exports = mongoose.model('CARBS' , carbs);


