const DOCTOR = require('../model/doctors.model')
const STORE = require('../model/store.model')
const CARBS = require('../model/carbs.model')

module.exports = {
    insertDoctor: async (req, res) => { // done
        const email = req.body.email; 
        const password = req.body.password;
        const name = req.body.name;
        const specialty = req.body.specialty;
        const phone = req.body.phone;

        const emailExist = await DOCTOR.findOne({ email: email }); // TODO change the patient id field
        if (emailExist) {
            res.json({ status: false, msg: "this Email is already exist" })
        } else {
            const doctor = await new DOCTOR({
                name: name,
                email: email,
                password: password,
                specialty: specialty,
                phone: phone,

            }).save();

            if (doctor) {
                // send mail
                // const emailSend = functions.sendEmail(email, 'Verify Account', 'Hi ' + name + ' thank you for signing into Diabetes Companion\nThe verification code  is ' + code + '\nplease use this code in the app to continue your registration.');
                res.json({ status: true, msg: "successfully registered" })
            } else {
                res.json({ status: false, msg: "failed registartion" })
            }
        }
    },

    insertStore: async (req, res) => { // done
        const storeName = req.body.storeName;
        const storeLocation = req.body.storeLocation;
        const storeNumber = req.body.storeNumber;
        const storeImage = req.body.storeImage;
        
        const store = await new STORE({
            storeName : storeName,
            storeLocation : storeLocation,
            storeNumber : storeNumber,
            storeImage : storeImage
        }).save();
        if (store) {
            res.json(
                {
                    status:true,
                    msg: 'store inserted successfully',
                    text: advice.text,
                    description: advice.description,
                    image: advice.image,
                }
            )
        } else {
            res.json(
                {
                    status: false,
                    msg: 'store not inserted',
                }
            )
        }
        // }
    },

    
    
    // TODO add update to advice
}