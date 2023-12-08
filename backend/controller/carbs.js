const CARBS = require('../model/carbs.model')
// const PATIENT = require('../model/patients.model')

module.exports = {
    getAllCarbs: async (req, res, next) => { // done
        const carbs = await CARBS.find();
        if (carbs.length == 0) {
            res.json({ status: false, msg: "carbs table is empty" })
        } else {
            res.json({
                status: true,
                result: carbs.map(carb => {
                    return {
                        id: carb.id,
                        name: carb.name,
                        weight: carb.weight,
                        carb: carb.carb,
                        weight_description: carb.weight_description,
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
    insertCarbs: async (req, res) => { // done
        const name = req.body.name;
        const carb = req.body.carb;
        const weight_description = req.body.weight_description;
        const weight = req.body.weight;

        
        console.log('insert carbs name '+ name);
        // colsole.log('weight_description = '+weight_description);
        const carbs = await new CARBS({
            name: name,
            carb: carb,
            weight: weight,
            weight_description: weight_description,

        }).save();

        if (carbs) {
            res.json({ status: true, msg: "successfully added" })
        } else {
            res.json({ status: false, msg: "failed registartion" })
        }
    },
    deleteCarb: async (req, res) => { // done
        const id = req.body.id;

        const deleted = await CARBS.findByIdAndRemove(id);
        if (deleted) {
            res.json({ status: true, msg: "deleted successfully" })
        } else {
            res.json({ status: false, msg: "not deleted" })
        }
    },
}