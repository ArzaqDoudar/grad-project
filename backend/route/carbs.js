const express = require('express')
const router = express.Router();

const {getAllCarbs , insertCarbs ,deleteCarb} = require('../controller/carbs');


// router.get('/test' , test);
router.get('/' , getAllCarbs);
router.post('/insertCarbs' , insertCarbs);
router.post('/deleteCarb' , deleteCarb);

module.exports = router;