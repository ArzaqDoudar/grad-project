var nodemailer = require('nodemailer');

module.exports = {
  sendEmail: (to , code , text) =>{
    var transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'arzaqwin10@gmail.com',
        pass: 'tzcevbhyzmbrxlwz'
      }
    });
    
    var mailOptions = {
      from: 'arzaqwin10@gmail.com',
      to: to,
      subject: 'Diabetes Companian - Verify Account ',
      text: 'Hi '+text,
    };
    
    console.log( 'Verification code = '+text);
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    })
  },
}