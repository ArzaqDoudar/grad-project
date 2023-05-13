const mongoose = require('mongoose');

var doctor =new mongoose.Schema({
    name: {type : String , require : true},
    email: {type : String , require : true},
    password: {type : String , require : true},
    specialty : {type : String},
    phone: {type : Number },
    token:{type : String},
})

module.exports = mongoose.model('DOCTOR' , doctor);


