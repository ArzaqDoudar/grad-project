const GLOCOSE = require('../model/glocose.model')
// const PATIENT = require('../model/patients.model')

module.exports = {
    getAllGlocose: async (req, res, next) => { // done
        const glocoses = await GLOCOSE.find();
        if (glocoses.length == 0) {
            res.json({ status: false, msg: "glocose table is empty" })
        } else {
            res.json({
                status: true,
                result: glocoses.map(glocose => {
                    return {
                        id: glocose.id,
                        patientId: glocose.patientId,
                        blood_glocose: glocose.blood_glocose,
                        time: glocose.time,
                        description: glocose.description,
                        tag: glocose.tag,
                    }
                })
            })
        }
    },
    getAllPatients: async (req, res, next) => { // done
        const id = req.body.id;
        const patients = await PATIENT.find(
            { doctor_id: id },
        );
        if (patients.length != 0) {
            res.json({ status: true, patients: patients })
        } else {
            res.json({ status: false })
        }
    },
    insertGlocose: async (req, res) => { // done
        const id = req.body.id; //patientId
        const data = req.body.data;
        const tag = req.body.tag;
        const time = req.body.time;

        var description;
        if (Number(data) < 70) {
            description = 'low';
        } else if (Number(data) >= 70 && Number(data) <= 180) {
            description = 'normal';
        } else if (Number(data) > 180 && Number(data) < 240) {
            description = 'high';
        } else {
            description = 'veryhigh';
        }
        const glocose = await new GLOCOSE({
            patientId: id,
            blood_glocose: Number(data),
            description: description,
            tag: tag,
            time: time,

        }).save();

        if (glocose) {
            res.json({ status: true, msg: "successfully registered" })
        } else {
            res.json({ status: false, msg: "failed add" })
        }
    },
}