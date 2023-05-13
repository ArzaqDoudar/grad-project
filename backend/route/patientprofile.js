const express = require('express')
const router = express.Router();

const {getAllDoctors,getPatientsDoctors , insertDoctor} = require('../controller/profile');
// const {} = require('../controller/patientprofile/myappointments');


router.get('/' , getAllDoctors);

router.post('/getPatientsDoctors' , getPatientsDoctors);
router.post('/insertDoctor' , insertDoctor);



module.exports = router;