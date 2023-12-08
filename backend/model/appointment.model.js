const mongoose = require('mongoose');

var appointment =new mongoose.Schema({
    patientId:{type:Number, require : true },
    doctor_id:{type:Number, require : true},
    date: {type : Date , require : true},
    note: {type : String , require : true},
    remember_me_before_0: {type : Boolean , require : true}, // the same day
    remember_me_before_1: {type : Boolean , require : true}, // before one day 
    remember_me_before_2: {type : Boolean , require : true}, // before two days
    remember_me_before_7: {type : Boolean , require : true}, // before seven days
})

module.exports = mongoose.model('APPOINTMENT' , appointment);
