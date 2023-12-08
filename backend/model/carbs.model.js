const mongoose = require('mongoose');

var carbs =new mongoose.Schema({
    name:{type:String, require : true},
    weight:{type:Number, require : true},
    weight_description:{type:String},
    carb:{type:Number, require : true},
})

module.exports = mongoose.model('CARBS' , carbs);