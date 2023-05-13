const express = require('express')
const router = express.Router();
const cors = require('cors');

const {getAllAdvices , insertAdvice ,deleteAdvice, getAdvice , updateAdvice} = require('../controller/advices');


// router.get('/test' , test);
router.get('/' , getAllAdvices);
router.post('/' , insertAdvice);
router.delete('/:id' , deleteAdvice);
router.get('/:id' , getAdvice);
router.post('/updateAdvice' , updateAdvice);

module.exports = router;