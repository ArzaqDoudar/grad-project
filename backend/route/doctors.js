const express = require('express')
const router = express.Router();

const {getAllDoctors, insertDoctor, getAllPatients,editProfile, getDoctor,} = require('../controller/doctors');


router.get('/' , getAllDoctors);
router.post('/insertDoctor' , insertDoctor);
router.post('/getAllPatients' , getAllPatients);
router.post('/editProfileDoctor' , editProfile);
router.post('/getDoctor' , getDoctor);



module.exports = router;