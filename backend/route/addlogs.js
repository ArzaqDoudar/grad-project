const express = require('express')
const router = express.Router();
const cors = require('cors');

const { getAllGlocose, insertGlocose, getGlocose, insertCarb, getAllCarbs, getAllInsulin, getInsulin, insertInsulin, } = require('../controller/addlogs');


router.get('/getAllGlocose', getAllGlocose);
router.post('/insertGlocose', insertGlocose);
router.post('/getGlocose', getGlocose);

router.post('/insertCarb', insertCarb);
router.post('/getAllCarbs', getAllCarbs);

router.get('/getAllGlocose', getAllInsulin);
router.post('/insertInsulin', insertInsulin);
router.post('/getInsulin', getInsulin);

// router.delete('/:id' , deleteAdvice);
// router.get('/:id' , getAdvice);
// router.post('/updateAdvice' , updateAdvice);

module.exports = router;