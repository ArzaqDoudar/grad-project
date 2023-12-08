const ADVICE = require('../model/advices.model')

module.exports = {
    insertAdvice: async (req, res) => { // done
        const doctor_id = req.body.doctor_id;
        const text = req.body.text;
        const description = req.body.description;
        const diabetes_type = req.body.diabetes_type;
        const tag = req.body.tag;
        console.log('inside insert advice')

        // const textExist = await ADVICE.findOne({ text: text });
        // if (textExist) {
        //     res.json({ msg: 'this advice is already exist' });
        // } else {
        const advice = await new ADVICE({
            text: text,
            description: description, 
            tag: tag,
            diabetes_type: diabetes_type,
            doctor_id: doctor_id,
            // image: image,
        }).save();
        if (advice) {
            res.json(
                {
                    status:true,
                    msg: 'inserted successfully',
                    text: advice.text,
                    description: advice.description,
                    image: advice.image,
                }
            )
        } else {
            res.json(
                {
                    status: false,
                    msg: 'advice not inserted',
                }
            )
        }
        // }
    },
    updateAdvice: async (req, res, next) => {
        const id = req.body.id;
        const text = req.body.text;
        const image = req.body.image;
        const description = req.body.description;

        console.log('id = ', id);
        console.log('text = ', text);
        console.log('image = ', image);
        console.log('description = ', description);
        const advice = await ADVICE.findById(id);
        if (advice) {
            const updated = await ADVICE.findOneAndUpdate(
                { _id: advice.id },
                { $set: { text: text, image: image, description: description, } },
                { upsert: false, new: true },
            );
            if (updated) {
                res.json({ status: true, msg: "Advice Updated", advice: updated });
            } else {
                res.json({ status: false, msg: "Advice Not Updated" })
            }
        } else {
            res.json({ status: false, msg: "Advice Not Exist" })
        }
    },
    getAllAdvices: async (req, res, next) => { // done

        const advices = await ADVICE.find();
        if (advices.length == 0) {
            res.json({
                status: 'failure',
                msg: "advices table is empty"
            });
        } else {

            res.json({
                status: true,
                datalength:advices.length,
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
            res.json({
                status: true,
                msg: 'Advice deleted sucssesfuly', 'Advice': deleted
            });
        } else {
            res.json({
                status: 'failure',
                msg: 'this advice is not exist'
            });
        }
    },




    getAdvice: async (req, res) => { // done
        // const collectionSize = await ADVICE.countDocuments();
        // const randomIndex = Math.floor(Math.random() * collectionSize);
        var array = [];
        const advices = await ADVICE.find(); // add discription
        if (advices.length == 0) {
            res.json({
                status: 'failure',
                msg: "advices table is empty"
            });
        } else {
            advices.forEach(advice => {
                array.push(advice.id)
            });
        }
        // const randomElement = array[0];
        const randomElement = array[Math.floor(Math.random() * array.length)];

        const randomAdvice = await ADVICE.findById(randomElement);

        // console.log('random advice = ' + randomAdvice);
        // console.log('random advice = ' + randomAdvice.description);

        if (randomAdvice) {
            res.json({
                status: true,
                advicetext: randomAdvice.text,
                advicedescription: randomAdvice.description,
                adviceimage: randomAdvice.image,
            })
        } else {
            res.json({
                status: false,
                msg: 'this advice is not exist'
            });
        }
    },

    getRandom: async (req, res) => {
        var random = Math.floor(Math.random() * count);

        const advice = await ADVICE.findOne().skip(random).exec(
            function (err, result) {
                // Tada! random user
                if (advice) {
                    console.log(result)
                    console.log(advice)
                } else {
                    console.log("advice error")

                }
            })


        // const id = req.params.id;
        //  = await ADVICE.findById(id);
        // if (advice) {
        //     res.json({
        //         id: advice.id,
        //         text: advice.text,
        //         description: advice.description,
        //         image: advice.image,
        //         diabetes_type: advice.diabetes_type,
        //         doctor_id: advice.doctor_id
        //     })
        // } else {
        //     res.json({ msg: 'this advice is not exist' });
        // }
    },

    // TODO add update to advice
}