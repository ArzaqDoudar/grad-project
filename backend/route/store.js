const express = require('express')
const router = express.Router();

const { insertStore , getAllStores,getStore,deleteStore} = require('../controller/store');


router.get('/', getAllStores);
router.post('/insertStore' , insertStore);
router.post('/getStore' , getStore);
router.post('/getAllStores' , getAllStores);
router.post('/deleteStore' , deleteStore);

module.exports = router;