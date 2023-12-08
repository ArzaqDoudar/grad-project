const express = require('express')
const router = express.Router();

const {getAllDoctors, insertDoctor, getAllPatients,editProfile, getDoctor,deleteDoctor,} = require('../controller/doctors');


router.get('/' , getAllDoctors);
router.post('/insertDoctor' , insertDoctor);
router.post('/getAllPatients' , getAllPatients);
router.post('/editProfileDoctor' , editProfile);
router.post('/getDoctor' , getDoctor);
router.post('/deleteDoctor' , deleteDoctor);



module.exports = router;