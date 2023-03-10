const mongoose = require('mongoose');

var patient =new mongoose.Schema({
    patientid: {type : Number , require : true},
    name: {type : String , require : true},
    email: {type : String , require : true},
    password: {type : String , require : true},
    diabetes_type: {type : Number },
    avatar: {type : String },
    birthdate: {type : Date },
    phone: {type : Number },
    // location: {type : Location },
    doctor_id: {type : Number },
    gender : {type : String}
})

module.exports = mongoose.model('PATIENT' , patient);

