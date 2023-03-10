const express = require('express'); // import express framework
const app = express();
const path = require('path')
const expresshandlebars = require('express-handlebars')
var  bodyParser = require('body-parser');
const port = 3000;


app.use([bodyParser.urlencoded({extended:true}) , express.json()]); // this is middelware using bodyparser 
const connection = require('./model/connection');

const routePatients = require('./route/patients');
const routeAdvices = require('./route/advices');

app.use('/patients' , routePatients); // this is middelware
app.use('/advices' , routeAdvices); // this is middelware

// app.set('views',path.join(__dirname , '/views/'))
// app.get("/",(req , res)=>{
//     res.send('<h1>Arzaq Ziad</h1>')
// })



app.listen(port , ()=>{
    console.log('it is working');
});

module.exports = app;

