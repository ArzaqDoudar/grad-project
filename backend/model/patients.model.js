// import { nanoid } from 'nanoid';

const mongoose = require('mongoose');

var patient = new mongoose.Schema({
    name: { type: String, require: true  },
    email: { type: String, require: true , unique : true},
    password: { type: String, require: true },
    diabetes_type: { type: Number },
    avatar: { type: String },
    birthdate: { type: Date },
    phone: { type: Number },
    // location: {type : Location },
    doctor_id: { type: Number },
    gender: { type: String },
    code:{type : Number},
    active:{type : Boolean},
    token:{type : String},

})

module.exports = mongoose.model('PATIENT', patient);



