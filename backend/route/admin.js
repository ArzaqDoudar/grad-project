const express = require('express')
const router = express.Router();
const cors = require('cors');

const {insertDoctor , insertStore , insertCarbs} = require('../controller/admins');


// router.get('/test' , test);
router.post('/insertDoctor' , insertDoctor);
router.post('/insertStore' , insertStore);
router.post('/insertCarbs' , insertCarbs);

module.exports = router;