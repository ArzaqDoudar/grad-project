const mongoose = require('mongoose');

var my_doctors =new mongoose.Schema({
    patientId:{type: String, require : true},
    name: {type : String , require : true},
    speciality: {type : String , require : true},
    email: {type : String },
    location: {type : String , require},
    phone: {type : Number },
})

module.exports = mongoose.model('MY_DOCTOR' , my_doctors);


