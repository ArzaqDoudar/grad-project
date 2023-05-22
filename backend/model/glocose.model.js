const mongoose = require('mongoose');

var glocose =new mongoose.Schema({
    patientId : {type:String, require : true},
    blood_glocose : {type:Number, require : true},
    time : {type: Date, require : true},
    description:{type: String},
    tag : {type: String},

})

module.exports = mongoose.model('GLOCOSE' , glocose);


