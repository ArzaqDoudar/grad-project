
const mongoose = require('mongoose');
// mongoose.connect('mongodb+srv://ArzaqZiad:MklLcs66kd0zbIhE@diabetescompanion.hwfsnxx.mongodb.net/?retryWrites=true&w=majority');
mongoose.connect('mongodb+srv://ArzaqZiad:MklLcs66kd0zbIhE@diabetescompanion.hwfsnxx.mongodb.net/diabetes_companion');
const connection = mongoose.connection;
connection.on('connected' , ()=>{console.log('connected with database')});
connection.on('error' , ()=>{console.log('error with database')});

const PATIENT = require('./patients.model')

