const mongoose = require('mongoose');

var advice =new mongoose.Schema({
    text: {type : String , require : true},
    description: {type : String , require : false},
    image: {type : String },
    diabetes_type: {type : Number },
    doctor_id: {type : Number },
})

module.exports = mongoose.model('ADVICE' , advice);



