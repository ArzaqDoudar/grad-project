const ADVICE = require('../model/advices.model')

module.exports = {
    insertAdvice: async (req, res) => { // done
        const textExist = await ADVICE.findOne({ "$or": [{ text: req.body.text }] });
        if (textExist) {
            res.json({ 'msg': 'this advice is already exist' });
        } else {
            const advice = await new ADVICE({
                text: req.body.text,
                image: req.body.image,
                description: req.body.description
            }).save();
            if (advice) {
                res.json(
                    {
                        'msg': 'inserted successfully',
                        text: advice.text,
                        description: advice.description,
                        image: advice.image,
                    }
                )
            } else {
                res.json(
                    {
                        'msg': 'advice not inserted',
                    }
                )
            }
        }
    },
    getAllAdvices: async (req, res, next) => { // done

        const advices = await ADVICE.find();
        if (advices.length == 0) {
            res.json({ 'msg': "advices table is empty" });
        } else {

            res.json({
                result: advices.map(advice => {
                    return {
                        id: advice.id,
                        text: advice.text,
                        description: advice.description,
                        image: advice.image,
                        diabetes_type: advice.diabetes_type,
                        doctor_id: advice.doctor_id
                    }
                })
            })
        }
    },


    deleteAdvice: async (req, res) => { // done
        const adviceid = req.params.id;
        const deleted = await ADVICE.findByIdAndRemove(adviceid);
        if (deleted) {
            res.json({ 'msg': 'Advice deleted sucssesfuly', 'Advice': deleted });
        } else {
            res.json({ 'msg': 'this advice is not exist' });
        }
    },



    getAdvice: async (req, res) => { // done
        const id = req.params.id;
        const advice = await ADVICE.findById(id);
        if (advice) {
            res.json({
                id: advice.id,
                text: advice.text,
                description: advice.description,
                image: advice.image,
                diabetes_type: advice.diabetes_type,
                doctor_id: advice.doctor_id
            })
        } else {
            res.json({msg: 'this advice is not exist' });
        }
    },

    // TODO add update to advice
}