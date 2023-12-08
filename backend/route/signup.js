const express = require('express')
const router = express.Router();

const { checkEmail, checkCode, changePassword, changeVerifyCode, getPatientByEmail,insertPatient,editProfile,} = require('../controller/signup');


router.post('/insertPatient' , insertPatient);
router.post('/checkCode', checkCode);
router.post('/checkemail', checkEmail);
router.post('/changePassword', changePassword);
router.post('/changeVerifyCode', changeVerifyCode);
router.post('/getpatientbyemail', getPatientByEmail);
// router.post('/checkemail', checkEmail);
// router.delete('/:id', deletePatient);
// router.get('/:id', getPatient);
// router.post('/login', patientExist);

module.exports = router;