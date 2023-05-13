const mongoose = require('mongoose');

var glocose =new mongoose.Schema({
    patientId : {type:Number, require : true},
    blood_glocose : {type:Number, require : true},
    time : {type: Date, require : true},
    tag : {type: String, require : true},

})

module.exports = mongoose.model('DOCTOR' , doctor);


