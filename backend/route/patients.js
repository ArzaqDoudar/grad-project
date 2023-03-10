const express = require('express')
const router = express.Router();

const {getAllPatients , insertPatient , deletePatient , getPatient , patientExist} = require('../controller/patients');


router.get('/' , getAllPatients);
router.post('/' , insertPatient);
router.delete('/:id' , deletePatient);
router.get('/:id' , getPatient);
router.post('/login' , patientExist);

module.exports = router;