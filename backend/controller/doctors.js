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
                datalength: doctors.length,
                result: doctors.map(doctor => {
                    return {
                        id: doctor.id,
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
        console.log('getAllPatients with id = '); 
        console.log(id);  
        const patients = await PATIENT.find(
            { doctor_id: id },
        );
        if (patients.length != 0) {
            console.log(patients);
            res.json({ status: true, patients: patients })
        } else {
            console.log('getAllPatients false '); 

            res.json({ status: false })
        }
    },
    getDoctor: async (req, res, next) => { // done
        const id = req.body.id;
        const doctor = await DOCTOR.findById(id);
        if (doctor) {
            // res.json({ status: true, patients: patients })
            res.json({
                status: true,
                id: doctor.id,
                email: doctor.email,
                name: doctor.name,
                phone: doctor.phone,
                specialty: doctor.specialty,
            });
        } else {
            console.log("this patient is not exist");
            res.json({ status: false, msg: "this doctor is not exist" })
        }
    },
    insertDoctor: async (req, res) => { // done
        // console.log('req ='+ req.body);

        const email = req.body.email;
        const password = req.body.password;
        const name = req.body.name;
        const specialty = req.body.specialty;
        const phone = req.body.phone;


        console.log('email ='+ email);
        console.log('name ='+ name);

        const emailExist = await DOCTOR.findOne({ email: email }); // TODO change the patient id field
        if (emailExist) {
            res.json({ 'status': false, 'msg': "this Email is already exist" })
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
                res.json({ "status": true, "msg": "successfully registered" })
            } else {
                res.json({ "status": false, "msg": "failed registartion" })
            }
        }
    },
    editProfile: async (req, res, next) => { //d done
        const id = req.body.id;

        console.log('editProfile doctor id = ' + id);
        const name = req.body.name;
        const phone = req.body.phone;
        const specialty = req.body.specialty;


        const doctor = await DOCTOR.findOneAndUpdate(
            { _id: id },
            {
                $set: {
                    name: name,
                    specialty: specialty,
                    phone: phone,
                }
            },
            { upsert: false, new: true },
        );
        if (doctor) {
            console.log("doctor profile update " );
            res.json({ status: true, email: doctor.email, id: doctor.id });
        } else {
            console.log("patient " + doctor);
            res.json({ status: false, msg: 'لم يم تحديث معلوماتك .' });
        }
    },
    deleteDoctor: async (req, res) => { // done
        const id = req.body.id;

        const deleted = await DOCTOR.findByIdAndRemove(id);
        if (deleted) {
            res.json({ status: true, msg: "deleted successfully" })
        } else {
            res.json({ status: false, msg: "not deleted" })
        }
    },
}