const mongoose = require('mongoose');

var admin =new mongoose.Schema({
    name: {type : String , require : true},
    email: {type : String , require : true},
    password: {type : String , require : true},
    token:{type : String},
})

module.exports = mongoose.model('ADMIN' , admin);

