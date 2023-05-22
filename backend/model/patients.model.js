// import { nanoid } from 'nanoid';

const mongoose = require('mongoose');

var patient = new mongoose.Schema({
    name: { type: String, require: true },
    email: { type: String, require: true, unique: true },
    password: { type: String, require: true },
    diabetes_type: { type: String },
    avatar: { type: String },
    birthdate: { type: Date , require : false },
    phone: { type: Number },
    doctor_id: { type: String },
    gender: { type: String },
    code: { type: Number },
    active: { type: Boolean },
    token: { type: String },

    heartdisease: { type: String },
    bloodpressure: { type: String },
    kidneydisease: { type: String },
    greasy: { type: String },
})
module.exports = mongoose.model('PATIENT', patient);
