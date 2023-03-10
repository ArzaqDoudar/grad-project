const PATIENT = require('../model/patients.model')

module.exports = {
    test: async (req, res) => {
        res.send('Patient Controller')
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
        const patients = await PATIENT.find();
        if (patients.length == 0) {
            res.json({ status: false, msg: "advices table is empty" })
        } else {
            res.json({
                status: true,
                result: patients.map(patient => {
                    return {
                        id: patient.id,
                        patientid: patient.patientid,
                        name: patient.name,
                        email: patient.email,
                        password: patient.password,
                    }
                })
            })
        }
    },

    getPatient: async (req, res, next) => {//done
        const patientid = req.params.id;

        const patient = await PATIENT.findById(patientid);
        if (patient) {
            res.json({
                status: true,
                id: patient.id,
                patientid: patient.patientid,
                name: patient.name,
                email: patient.email,
                password: patient.password,
            })
        } else {
            res.json({ status: false, msg: "this patient is not exist" })
        }
    },


    insertPatient: async (req, res) => { // done
        const emailExist = await PATIENT.findOne({ "$or": [{ email: req.body.email  , patientid : req.body.patientid}] });
        if (emailExist) {
            res.json({ status: false, msg: "this email or ID is already exist" })
        } else {
            const patient = await new PATIENT({
                patientid: req.body.patientid,
                name: req.body.name,
                email: req.body.email,
                password: req.body.password,
            }).save();

            if (patient) {
                res.json({ status: true, msg: "successfully registered" })
            } else {
                res.json({ status: false, msg: "failed registartion" })
            }
        }
    },

    deletePatient: async (req, res) => { // done
        const id = req.params.id;

        const deleted = await PATIENT.findByIdAndRemove(id);
        if(deleted){
            res.json({ status: true, msg: "deleted successfully", 'patient': deleted })
        }else{
            res.json({ status: false, msg: "not deleted"   })
        }
    }
}