const express = require('express')
const router = express.Router();

const {getAllAdvices , insertAdvice ,deleteAdvice, getAdvice} = require('../controller/advices');


// router.get('/test' , test);
router.get('/' , getAllAdvices);
router.post('/' , insertAdvice);
router.delete('/:id' , deleteAdvice);
router.get('/:id' , getAdvice);

module.exports = router;