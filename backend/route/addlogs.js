const express = require('express')
const router = express.Router();
const cors = require('cors');

const {getAllGlocose ,insertGlocose,} = require('../controller/addlogs');


router.get('/getAllGlocose' , getAllGlocose);
router.post('/insertGlocose' , insertGlocose);
// router.delete('/:id' , deleteAdvice);
// router.get('/:id' , getAdvice);
// router.post('/updateAdvice' , updateAdvice);

module.exports = router;