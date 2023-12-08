const PATIENT = require('../model/patients.model')
const DOCTOR = require('../model/doctors.model')
const functions = require('../function.js')

module.exports = {
    test: async (req, res) => {
        res.send('Patient Controller')
    },
    insertPatient: async (req, res) => { // done
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
                phone: 0,
                gender: "",
                birthdate: "",
                diabetes_type: 0,
                doctor_id: '0',
                heartdisease: "false",
                bloodpressure: "false",
                kidneydisease: "false",
                greasy: "false",
                weight: 0,
                carbstoinsulin: 0,

            }).save();

            if (patient) {
                const emailSend = functions.sendEmail(email, 'Verify Account', 'Hi ' + name + ' thank you for signing into Diabetes Companion\nThe verification code  is ' + code + '\nplease use this code in the app to continue your registration.');
                res.json({ status: true, msg: "successfully registered", code: code })
            } else {
                res.json({ status: false, msg: "failed registartion" })
            }
        }
    },
    checkEmail: async (req, res) => { // done
        const email = req.body.email;

        const patient = await PATIENT.findOne({ email: email });

        if (patient) {
            const newCode = functions.getRandomInt(10000, 99999);
            const emailSend = functions.sendEmail(email, 'Verify Account', 'Hi ' + patient.name + ' \nThe verification code is ' + newCode + '\nplease use this code in the app to reset your password.');
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
        const patient = await PATIENT.findOne({ _id: id });
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
    resetPassword: async (req, res) => { // done
        const email = req.body.email;
        const newPassword = req.body.newPassword;
        const patient = await PATIENT.findOne({ email: email });
        if (patient) {
            console.log("patient id ==", patient.id)
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
            res.json({ status: false, msg: "patient not exist" })
        }

    },
    resendVerifyCode: async (req, res) => {
        const email = req.body.email;
        const code = functions.getRandomInt(10000, 99999);
        const patient = await PATIENT.findOne({ email: email });
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
                { $set: { active: true } },
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
    patientExist: async (req, res) => { // done
        const emailExise = await PATIENT.findOne({ "$and": [{ email: req.body.email }] });

        if (emailExise) {
            const correctPassword = await PATIENT.findOne({ "$and": [{ email: req.body.email }, { password: req.body.password }] });
            if (correctPassword) {
                res.json({ status: true, msg: "Login successfuly" })
            } else {
                res.json({ status: false, msg: "wrong password" })
            }
        } else {
            res.json({ status: false, msg: "exist not user" })
        }


    },
    getAllPatients: async (req, res, next) => { // done
        console.log('inside get all patients');
        const patients = await PATIENT.find();
        if (patients.length == 0) {
            res.json({ status: false, msg: "patient table is empty" })
        } else {
            res.json({
                status: true,
                datalength: patients.length,
                result: patients.map(patient => {
                    return {
                        id: patient.id,
                        patientid: patient.patientid,
                        name: patient.name,
                        email: patient.email,
                        password: patient.password,
                        doctor_id: patient.doctor_id,

                        gender: patient.gender,
                        birthdate: patient.birthdate,
                        diabetes_type: patient.diabetes_type,
                        code: patient.code,
                        active: patient.active,
                        weight: patient.weight,
                        carbstoinsulin: patient.carbstoinsulin,

                        heartdisease: patient.heartdisease,
                        bloodpressure: patient.bloodpressure,
                        kidneydisease: patient.kidneydisease,
                        greasy: patient.greasy,
                    }
                })
            })
        }
    },
    getPatient: async (req, res, next) => {//done
        // const patientid = req.params.id;
        const id = req.body.id;

        console.log('getPatient id = ' + id);
        const patient = await PATIENT.findById(id);
        if (patient) {
            console.log('patient = ' + patient);
            res.json({
                status: true,
                id: patient.id,
                email: patient.email,
                name: patient.name,
                phone: patient.phone,
                diabetes_type: patient.diabetes_type,
                gender: patient.gender,
                birthdate: patient.birthdate,
                weight: patient.weight,
                carbstoinsulin: patient.carbstoinsulin,
                avatar: patient.avatar,

                heartdisease: patient.heartdisease,
                bloodpressure: patient.bloodpressure,
                kidneydisease: patient.kidneydisease,
                greasy: patient.greasy,
            });
        } else {
            console.log("this patient is not exist");
            res.json({ status: false, msg: "this patient is not exist" })
        }
    },
    getPatientDoctor: async (req, res, next) => {//done
        // const patientid = req.params.id;
        const id = req.body.id;

        const patient = await PATIENT.findById(id);
        if (patient) {
            console.log('doctor id == ' + patient.doctor_id)
            if (patient.doctor_id != '0') {
                const doctor = await DOCTOR.findById(patient.doctor_id);
                if (doctor) {
                    res.json({
                        status: true,
                        doctor_id: patient.doctor_id,
                        doctor_email: doctor.email,
                        doctor_name: doctor.name,
                    })
                } else {
                    res.json({ status: false, msg: "this doctor not exist" })
                }
            } else {
                res.json({ status: false, msg: "no doctor" })
            }
        } else {
            res.json({ status: false, msg: "this patient is not exist" })
        }
    },
    addDoctor: async (req, res) => { // done
        const id = req.body.id; // patient id
        const doctor_id = req.body.doctorId;
        const patient = await PATIENT.findOne({ _id: id });
        if (patient) {
            console.log("patient id ==", patient.id)
            // if (patient.password == oldPassword) {
            const adddoctor = await PATIENT.findOneAndUpdate(
                { _id: patient.id },
                { $set: { doctor_id: doctor_id } },
                { upsert: false, new: true },
            );
            console.log("doctor added successfuly", adddoctor)
            if (adddoctor) {
                res.json({ status: true, password: adddoctor });
            } else {
                res.json({ status: false, msg: "Doctor Not Added" });
            }
            // } else {
            //     res.json({ status: false, msg: "Wrong Password" });
            // }

        } else {
            res.json({ status: false, msg: "patient not exist" })
        }
    },
    editProfile: async (req, res, next) => { // done
        const id = req.body.id;

        console.log('editProfile id = ' + id);
        const name = req.body.name;
        const avatar = req.body.avatar;
        const phone = req.body.phone;
        const birthdate = req.body.birthdate;
        const gender = req.body.gender;
        const diabetes_type = req.body.diabetes_type;

        const heartdisease = req.body.heartdisease;
        const bloodpressure = req.body.bloodpressure;
        const kidneydisease = req.body.kidneydisease;
        const greasy = req.body.greasy;
        const weight = req.body.weight;
        const carbstoinsulin = req.body.carbstoinsulin;

        console.log('greasy '.greasy);

        const patient = await PATIENT.findOneAndUpdate(
            { _id: id },
            {
                $set: {
                    name: name,
                    avatar: avatar,
                    phone: phone,
                    birthdate: birthdate,
                    gender: gender,
                    diabetes_type: diabetes_type,
                    heartdisease: heartdisease,
                    bloodpressure: bloodpressure,
                    kidneydisease: kidneydisease,
                    greasy: greasy,
                    weight: weight,
                    carbstoinsulin: carbstoinsulin
                }
            },
            { upsert: false, new: true },
        );
        if (patient) {
            // console.log("patient " + patient.birthdate.getDay());
            res.json({ status: true, email: patient.email, id: patient.id });
        } else {
            console.log("patient " + patient);
            res.json({ status: false, msg: 'لم يم تحديث معلوماتك .' });
        }
    },
    deletePatient: async (req, res) => { // done
        const id = req.body.id;

        const deleted = await PATIENT.findByIdAndRemove(id);
        if (deleted) {
            res.json({ status: true, msg: "deleted successfully" })
        } else {
            res.json({ status: false, msg: "not deleted" })
        }
    },
    changeToken: async (req, res) => { // TODO change it to check code
        const id = req.body.id;
        const token = req.body.token;
        // const patient = await PATIENT.findById(id );
        const patient = await PATIENT.findOneAndUpdate(
            { _id: id },
            { $set: { token: token } },
            { upsert: false, new: true },
        );

        if (patient) {
            res.json({
                status: true,
                msg: "Success Registration",
            })
        } else {
            res.json({ status: false, msg: "Wrong Verification Code" })
        }
    },
}

