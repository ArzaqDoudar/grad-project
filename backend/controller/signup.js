const PATIENT = require('../model/patients.model')
const functions = require('../function.js')
// const email = require('./testemail')


module.exports = {
    insertPatient: async (req, res) => { // done
        console.log('req ==== ', req);
        const email = req.body.email;
        const password = req.body.password;
        const name = req.body.name;
        const code = functions.getRandomInt(10000, 99999);

        const emailExist = await PATIENT.findOne({ email: email }); // TODO change the patient id field
        if (emailExist) {
            res.json({ status: false, msg: "this Email is already exist" })
        } else {
            const patient = await new PATIENT({
                name: name,
                email: email,
                password: password,
                code: code,
                active: false,

            }).save();

            if (patient) {
                // send mail
                const emailSend = functions.sendEmail(email, 'Verify Account', 'Hi ' + name + ' thank you for signing into Diabetes Companion\nThe verification code  is ' + code + '\nplease use this code in the app to continue your registration.');
                res.json({ status: true, msg: "successfully registered", code: code })
            } else {
                res.json({ status: false, msg: "failed registartion" })
            }
        }
    },


    editProfile: async (req, res) => { // done
        const id = req.body.id;
        const name = req.body.name;
        const avatar = req.body.avatar;
        const phone = req.body.phone;
        const birthdate = req.body.birthdate;
        const gender = req.body.gender;
        // const code = 0;
        const diabetes_type = req.body.diabetes_type;
        const doctor_id = req.body.doctor_id;
        const patient = await PATIENT.findByIdAndUpdate()
    },
    checkEmail: async (req, res) => { // done
        const email = req.body.email;

        const patient = await PATIENT.findOne({ email: email });

        if (patient) {
            const newCode = functions.getRandomInt(10000, 99999);
            const changeCode = await PATIENT.findOneAndUpdate(
                { _id: patient.id },
                { $set: { code: newCode } },
                { upsert: false, new: true },
            );
            res.json({
                status: true, msg: "this email already exist",
                id: patient.id,
                name: patient.name,
                pass: patient.password,
                code: newCode,
            })
        } else {
            res.json({ status: false, msg: "this email not exist" })
        }
    },
    getPatientByEmail: async (req, res) => { // done
        const email = req.body.email;
        const patient = await PATIENT.findOne({ "$or": [{ email: email }] });
        if (patient) {
            res.json({
                status: true, msg: "this email already exist",
                name: patient.name,
                password: patient.password,
                code: patient.code,
                active: patient.active,
            })
        } else {
            res.json({ status: false, msg: "this email not exist" })
        }
    },
    checkCode: async (req, res) => { // TODO change it to check code
        const email = req.body.email;
        const code = req.body.code;
        const patient = await PATIENT.findOne({ '$and': [{ email: email }, { code: code }] });
        if (patient) {
            const activatePatient = await PATIENT.findOneAndUpdate(
                { _id: patient.id },
                { $set: { active: true } },
                { upsert: false, new: true },
            );
            res.json({
                status: true,
                msg: "Success Registration",
                patient: activatePatient,
            })
        } else {
            res.json({ status: false, msg: "Wrong Verification Code" })
        }
    },
    changePassword: async (req, res) => { // done
        const id = req.body.id;
        const oldPassword = req.body.oldPassword;
        const newPassword = req.body.newPassword;
        const patient = await PATIENT.findById(id);
        if (patient) {
            console.log("patient id ==", patient.id)
            if (patient.password == oldPassword) {
                const changedPassword = await PATIENT.findOneAndUpdate(
                    { _id: patient.id },
                    { $set: { password: newPassword } },
                    { upsert: false, new: true },
                );
                console.log("changedPassword", changedPassword)
                if (changedPassword) {
                    res.json({ status: true, msg: "Password Updated", password: changedPassword.password });
                } else {
                    res.json({ status: false, msg: "Password Not Updated" });
                }
            } else {
                res.json({ status: false, msg: "Wrong Password" });
            }

        } else {
            res.json({ status: false, msg: "patient not exist" })
        }

    },
    changeVerifyCode: async (req, res) => {
        const id = req.body.id;
        const code = functions.getRandomInt(10000, 99999);
        const patient = await PATIENT.findById(id);
        // console.log("patient", patient)

        if (patient) {
            const changedCode = await PATIENT.findOneAndUpdate(
                { _id: patient.id },
                { $set: { code: code } },
                { upsert: false, new: true },
            );
            if (changedCode) {
                const emailSend = functions.sendEmail(patient.email, 'Verify Account', 'Verification code is ' + code);
                res.json({ status: true, msg: "Code Updated", code: changedCode.code });

            } else {
                res.json({ status: false, msg: "Code Not Updated" });
            }
        } else {
            res.json({ status: false, msg: "patient not exist" })
        }
    },
    activatePatient: async (req, res) => {
        const id = req.body.id;
        const patient = await PATIENT.findById(id);

        if (patient) {
            const changedCode = await PATIENT.findOneAndUpdate(
                { _id: patient.id },
                { $set: { avatar: true } },
                { upsert: false, new: true },
            );
            if (changedCode) {
                res.json({ status: true, msg: "Patient activate" });

            } else {
                res.json({ status: false, msg: "Patient Not activate" });
            }
        } else {
            res.json({ status: false, msg: "patient not exist" })
        }
    },

}