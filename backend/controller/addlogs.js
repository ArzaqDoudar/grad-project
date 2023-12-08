const GLOCOSE = require('../model/glocose.model')
const CARBS = require('../model/carbs.model')
const INSULIN = require('../model/insulin.model')
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
    getGlocose: async (req, res, next) => { // done
        const id = req.body.id;
        const timerange = req.body.timerange;
        let last = new Date();
        last.setDate(last.getDate() - timerange);
        console.log('last = ' + last)
        //, { time: { "$gte": lastWeek }}
        const data = await GLOCOSE.find({ "$and": [{ patientId: id }, { time: { "$gte": last } }] });
        if (data.length != 0) {
            console.log('data = ' + data)
            console.log('datalength = ' + data.length)
            res.json({ status: true, datalength: data.length, data: data })
        } else {
            res.json({ status: false })
        }
    },
    insertGlocose: async (req, res) => { // done
        const id = req.body.id; //patientId
        const data = req.body.data;
        const tag = req.body.tag;
        const time = req.body.time;
        console.log('time = ' + time);
        var timedata = new Date(Date.parse(time));
        console.log('timedata = ' + timedata);
        // console.log('time0 = '+Date.now());
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
            console.log(glocose.time);
            res.json({ status: true, msg: "successfully registered" })
        } else {
            res.json({ status: false, msg: "failed add" })
        }
    },
    insertCarb: async (req, res) => { // done
        // const id = req.body.id; //patientId
        const name = req.body.name;
        const weight = req.body.weight; 
        const weight_description = req.body.weight_description;
        const carb = req.body.carb;
        console.log('carb = ' + carb);
        console.log('weight_description = '+weight_description);

        const carbs = await new CARBS({
            name: name,
            weight: weight,
            carb: carb,
            weight_description: weight_description,

        }).save();

        if (carbs) {
            res.json({ status: true,name : name, msg: "successfully added" })
        } else {
            res.json({ status: false, msg: "failed add" })
        }
    },
    getAllCarbs: async (req, res, next) => { // done
        const carbs = await CARBS.find();
        if (carbs.length == 0) {
            res.json({ status: false, msg: "carbs table is empty" })
        } else {
            res.json({
                status: true,
                carbs: carbs.map(carb => {
                    return {
                        id: carb.id,
                        name: carb.name,
                        weight: carb.weight,
                        weight_description: carb.weight_description,

                        carb: carb.carb,
                    }
                })
            })
        }
    },



    getAllInsulin: async (req, res, next) => { // done
        const insulins = await INSULIN.find();
        if (insulins.length == 0) {
            res.json({ status: false, msg: "insulin table is empty" })
        } else {
            res.json({
                status: true,
                result: insulins.map(insulin => {
                    return {
                        id: insulin.id,
                        patientId: insulin.patientId,
                        dose_units: insulin.dose_units,
                        time: insulin.time,
                    }
                })
            })
        }
    },
    getInsulin: async (req, res, next) => { // done
        const id = req.body.id;
        const timerange = req.body.timerange;
        let last = new Date();
        last.setDate(last.getDate() - timerange);
        console.log('last = ' + last)
        //, { time: { "$gte": lastWeek }}
        const data = await INSULIN.find({ "$and": [{ patientId: id }, { time: { "$gte": last } }] });
        if (data.length != 0) {
            console.log('data = ' + data)
            res.json({ status: true, datalength: data.length, data: data })
        } else {
            res.json({ status: false , length : 0})
        }
    },
    insertInsulin: async (req, res) => { // done
        const id = req.body.id; //patientId
        const dose_units = req.body.dose_units;
        const time = req.body.time;            
        
        
        const insulin = await new INSULIN({
            patientId: id,
            dose_units: Number(dose_units),
            time: time,
            
        }).save();
        
        if (insulin) {
            console.log("tnsulin time "+insulin.time);
            console.log(insulin.time);
            res.json({ status: true, msg: "successfully added" })
        } else {
            res.json({ status: false, msg: "failed add" })
        }
    },

}