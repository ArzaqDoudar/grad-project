const MYDOCTORS = require('../model/patientprofile/mydoctors.model');
// const PATIENT = require('../model/patients.model')

module.exports = {
    getAllDoctors: async (req, res, next) => { // done
        const doctors = await MYDOCTORS.find();
        if (doctors.length == 0) {
            res.json({ status: false, msg: "my doctors table is empty" })
        } else {
            res.json({
                status: true,
                result: doctors.map(doctor => {
                    return {
                        id: doctor.id,
                        patientId: doctor.patientId,
                        name: doctor.name,
                        phone: doctor.phone,
                        speciality: doctor.speciality,
                        email: doctor.email,
                        location: doctor.location, 
                    }
                })
            })
        }
    },
    getPatientsDoctors: async (req, res, next) => { // done
        const id = req.body.id;
        const doctors = await MYDOCTORS.find(
            { patientId: id },
        );
        if (doctors.length != 0) {
            res.json({ status: true, doctors: doctors })
        } else {
            res.json({ status: false })
        }
    },
    insertDoctor: async (req, res) => { // done
        const id = req.body.patientId;
        const name = req.body.name;
        const speciality = req.body.speciality;
        const phone = req.body.phone;
        const email = req.body.email;
        const location = req.body.location;  

        console.log('insert Doctor ');
        console.log('id '+id);
        console.log('name '+name); 
        console.log('speciality '+speciality);
        console.log('phone '+phone);
        console.log('email '+email);
        console.log('location '+location);

        const mydoctor = await new MYDOCTORS({
            patientId: id,
            name: name,
            speciality: speciality,
            email: email, 
            location: location,
            phone: phone,

        }).save();

        if (mydoctor) {
            console.log('mydoctor => ' + mydoctor);
            res.json({ status: true, msg: "تمت العملية بنجاح" })
        } else {
            res.json({ status: false, msg: "حدث خطأ !" })
        }
    },
}