// getAllProduct, getProduct, getStoreProducts, insertProduct , editProduct 


const PRODUCT = require('../model/product.model')

module.exports = {
    getAllProduct: async (req, res, next) => { // done
        const products = await PRODUCT.find();
        if (products.length == 0) {
            res.json({ status: false, msg: "products table is empty" })
        } else {
            res.json({
                status: true,
                result: products.map(product => {
                    return {
                        id: product.id,
                        name: product.name,
                        price: product.price,
                        store_id: product.store_id,
                        description: product.description,
                        ingredient: product.ingredient,
                        image: product.image,
                    }
                })
            })
        }
    },
    getProduct: async (req, res, next) => { // done
        const id = req.body.id; // product id
        const product = await PRODUCT.findById(
            id
        );
        if (product) {
            res.json({ status: true, 
                id: product.id,
                name: product.name,
                price: product.price,
                store_id: product.store_id,
                description: product.description,
                ingredient: product.ingredient,
                image: product.image, })
        } else {
            res.json({ status: false })
        }
    }, 
    getStoreProducts: async (req, res, next) => { // done
        const id = req.body.id; // store id 
        console.log('store id '+ id);
        const products = await PRODUCT.find(
            {store_id : id}
        );
        if (products.length != 0) {
            console.log('store products '+ products);

            res.json({ status: true, products: products })
        } else {
            res.json({ status: false })
        }
    },
    insertProduct: async (req, res) => { // done
        const name = req.body.name;
        const price = req.body.price;
        const store_id = req.body.store_id;
        const description = req.body.description;
        const ingredient = req.body.ingredient;
        const image = req.body.image;

        console.log('insert product name ' + name);
        const product = await new PRODUCT({
            name: name,
            price: price,
            store_id: store_id,
            description: description,
            ingredient: ingredient,
            image: image,
 
        }).save();

        if (product) {
            res.json({ status: true, msg: "successfully added" })
        } else {
            res.json({ status: false, msg: "failed added" })
        }
    },

}