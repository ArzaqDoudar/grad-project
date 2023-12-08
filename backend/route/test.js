const express = require('express')
const router = express.Router();

const {foodAPI  } = require('../controller/test');


// router.get('/test' , test);
// router.get('/' , getAllCarbs);
router.get('/foodapi' , foodAPI);

module.exports = router;