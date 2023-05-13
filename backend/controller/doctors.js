const DOCTOR = require('../model/doctors.model')
const PATIENT = require('../model/patients.model')

module.exports = {
    getAllDoctors: async (req, res, next) => { // done
        const doctors = await DOCTOR.find();
        if (doctors.length == 0) {
            res.json({ status: false, msg: "doctors table is empty" })
        } else {
            res.json({
                status: true,
                result: doctors.map(doctor => {
                    return {
                        id: carbs.id,
                        name: doctor.name,
                        email: doctor.email,
                        password: doctor.password,
                        specialty: doctor.specialty,
                        phone: doctor.phone,
                    }
                })
            })
        }
    }, 
    getAllPatients: async (req, res, next) => { // done
        const id = req.body.id;
        const patients = await PATIENT.find(
            { doctor_id: id},
        );
        if(patients.length != 0){
            res.json({ status: true , patients : patients})
        }else{
            res.json({ status: false })
        }
    },
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
}