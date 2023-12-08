const mongoose = require('mongoose');

var insulin =new mongoose.Schema({
    patientId : {type:String, require : true},
    dose_units : {type:Number, require : true},
    time : {type: Date, require : true},
})

module.exports = mongoose.model('INSULIN' , insulin);


 