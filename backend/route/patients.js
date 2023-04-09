const express = require('express')
const router = express.Router();

const {checkEmail, checkCode, changePassword,resetPassword, changeVerifyCode, getPatientByEmail,insertPatient,editProfile,getAllPatients  , deletePatient , getPatient , patientExist} = require('../controller/patients');


router.get('/' , getAllPatients);
router.delete('/:id' , deletePatient);
router.get('/:id' , getPatient);

router.post('/insertPatient' , insertPatient);
router.post('/checkCode', checkCode);
router.post('/checkemail', checkEmail);
router.post('/resetPassword', resetPassword);
router.post('/changePassword', changePassword);
router.post('/changeVerifyCode', changeVerifyCode);


router.post('/login' , patientExist);
router.post('/getpatientbyemail', getPatientByEmail);

module.exports = router;