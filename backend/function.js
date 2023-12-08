var nodemailer = require('nodemailer');

module.exports = {
    printFailuer: (message) => {
        return json({ status: false, msg: message })
    },
    // sendMail: (from, to, subject, text) => {

    // },
    getRandomInt: (min ,max) => {
        return Math.floor(Math.random() * (max - min) + min);
    },
    sendEmail: (to , title,body) =>{
        var transporter = nodemailer.createTransport({
            service: 'gmail',
          auth: {
            user: 'companiondiabetes@gmail.com', // real password = DiabetesCompanion1629 
            pass: 'osrnlrwvyikderwi'
            // user: 'arzaqwin10@gmail.com',
            // pass: 'tzcevbhyzmbrxlwz'
          }  
        });
        
        var mailOptions = {
          from: 'companiondiabetes@gmail.com',
          to: to,
          subject: 'Diabetes Companion - '+title,
          text: body ,
        };
        
        // console.log( 'Verification code = '+code);
        transporter.sendMail(mailOptions, function (error, info) {
          if (error) {
            console.log(error);
          } else {
            console.log('Email sent: ' + info.response);
          }
        })
      },
}



