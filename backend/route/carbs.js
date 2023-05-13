const express = require('express')
const router = express.Router();

const {getAllCarbs , insertCarbs } = require('../controller/carbs');


// router.get('/test' , test);
router.get('/' , getAllCarbs);
router.post('/' , insertCarbs);

module.exports = router;