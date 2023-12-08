const STORE = require('../model/store.model')

module.exports = {
    getAllStores: async (req, res, next) => { // done
        console.log('inside get all stores')
        const stores = await STORE.find();
        if (stores.length == 0) {
            res.json({ status: false, msg: "stores table is empty" })
        } else {
            res.json({
                status: true,
                datalength: stores.length,
                result: stores.map(store => {
                    return {
                        id: store.id,
                        name: store.name,
                        rate: store.rate,
                        location: store.location,
                        phone: store.phone,
                        avatar: store.avatar,
                        lat: store.lat,
                        long: store.long,
                    }
                })
            })
        }
    },
    getStore: async (req, res, next) => { // done
        console.log('inside get  stores')
        const id = req.body.id;

        const store = await STORE.findById(id);
        if (store) {
            res.json({
                status: true,
                store: store
            })
        } else {
            res.json({ status: false, msg: "stores table is empty" })

        }
    },

    insertStore: async (req, res) => { // done
        const name = req.body.name;
        const avatar = req.body.avatar;
        const rate = req.body.rate;
        const location = req.body.location;
        const phone = req.body.phone;
        const lat = req.body.lat;
        const long = req.body.long;


        const store = await new STORE({
            name: name,
            location: location,
            phone: phone,
            rate: rate,
            avatar: avatar,
            lat: lat,
            long: long,

        }).save();

        if (store) {
            res.json({ status: true, msg: "successfully insert" })
        } else {
            res.json({ status: false, msg: "failed insert" })
        }

    },
    deleteStore: async (req, res) => { // done
        const id = req.body.id;

        const deleted = await STORE.findByIdAndRemove(id);
        if (deleted) {
            res.json({ status: true, msg: "deleted successfully" })
        } else {
            res.json({ status: false, msg: "not deleted" })
        }
    },
}