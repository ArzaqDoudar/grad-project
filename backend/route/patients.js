const express = require('express')
const router = express.Router();

const {checkEmail, checkCode,resetPassword,changePassword, resendVerifyCode, getPatientByEmail,insertPatient,editProfile,getAllPatients  , deletePatient , getPatient ,getPatientDoctor ,addDoctor, patientExist} = require('../controller/patients');


router.get('/' , getAllPatients);
router.delete('/:id' , deletePatient);

router.post('/getPatient' , getPatient);
router.post('/insertPatient' , insertPatient);
router.post('/checkCode', checkCode);
router.post('/checkemail', checkEmail);
router.post('/resetPassword', resetPassword);
router.post('/changePassword', changePassword);
router.post('/getPatientDoctor', getPatientDoctor);
router.post('/addDoctor', addDoctor);
router.post('/resendVerifyCode', resendVerifyCode);
router.post('/editProfile', editProfile);


// router.post('/login' , patientExist); 
router.post('/getpatientbyemail', getPatientByEmail);

module.exports = router;