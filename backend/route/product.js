const express = require('express')
const router = express.Router();

const { getAllProduct, getProduct, getStoreProducts, insertProduct , editProduct } = require('../controller/product');


// router.get('/test' , test);
router.get('/', getAllProduct);
router.post('/getProduct', getProduct);
router.post('/getStoreProducts', getStoreProducts);
router.post('/insertProduct', insertProduct);
// router.post('/editProduct', editProduct);

module.exports = router;