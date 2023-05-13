const express = require('express')
const router = express.Router();

const {getAllDoctors, insertDoctor, getAllPatients, } = require('../controller/doctors');


router.get('/' , getAllDoctors);
router.post('/insertDoctor' , insertDoctor);
router.post('/getAllPatients' , getAllPatients);



module.exports = router;