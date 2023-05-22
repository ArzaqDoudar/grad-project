require('dotenv').config()
const S3 = require("aws-sdk/clients/s3");

const fs = require('fs');

const express = require('express'); // import express framework
const app = express();
const path = require('path')
const expresshandlebars = require('express-handlebars')
const cors = require('cors')
var  bodyParser = require('body-parser');
const port = 3000;

const s3 = new S3({
    accessKeyId: process.env.AWS_S3_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_S3_SECRET_ACCESS_KEY,
    endpoint: process.env.S3_GATEWAY,
    s3ForcePathStyle: true,
    signatureVersion: "v4",
    connectTimeout: 0,
    httpOptions: { timeout: 0 }
  });
 
app.use(cors({
    origin: '*',
    methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']
}))


app.use([bodyParser.urlencoded({extended:true}) , express.json()]); // this is middelware using bodyparser 
const connection = require('./model/connection');

const routePublic = require('./route/public');
const routePatients = require('./route/patients'); 
const routeDoctors = require('./route/doctors');
const routeAdvices = require('./route/advices');
const routeSignUp = require('./route/signup');
const routeAddLogs = require('./route/addlogs');
const routePatientsProfile = require('./route/patientprofile'); 

app.use('/' ,cors(), routePublic); // this is middelware
app.use('/patients' , cors(), routePatients);
app.use('/patients/profile' , cors(), routePatientsProfile); 
app.use('/doctors' , cors(), routeDoctors); 
app.use('/advices' , cors(), routeAdvices); 
app.use('/signup' , cors(), routeSignUp); 
app.use('/addlogs' , cors(), routeAddLogs); 
app.get('/test', async (req, res, next) => {
    const id = req.body.id;
    const link = req.body.link;
    const name = req.body.name;
    const foldername = req.body.foldername;

    // const name = 'default.png';
    // const foldername= 'avatar';


    const file = fs.readFileSync(link);
    // const file = fs.readFileSync('/home/arzaqziad/grad-prod/frontend/diabetes_companion/assets/images/avatar_doctor.png');
    //TODO make the Key unique using uuid package wich need to be installed
    let params = {
        Bucket: process.env.S3_BUCKET_NAME,
        Key: foldername+'/'+name,
        ACL: 'public-read',
        Body: file
    };


    //TODO find a proper way to ensure that the file has been uploaded successfully
    await s3.upload(params, {
        partSize: 64 * 1024 * 1024
      }).promise();



      const url = `${process.env.S3_BUCKET_NAME}.${process.env.S3_GATEWAY}/${params.Key}`;
      
      console.log(url);
      res.json({url: url});
});

app.listen(port , ()=>{
    console.log('it is working');
});

module.exports = app;


