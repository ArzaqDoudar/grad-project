const PATIENT = require('../model/patients.model')
const DOCTOR = require('../model/doctors.model')
const ADMIN = require('../model/admin.model')
const functions = require('../function.js')

module.exports = {
    login: async (req, res) => {
        const email = req.body.email;
        const password = req.body.password;
        const patient = await PATIENT.findOne({ email: email });
        if (patient) {
            // return patient 
            if (patient.active) {
                if (password == patient.password) {
                    res.json({ status: true, type: "patient", user: patient })
                } else {
                    res.json({ status: false, type: "patient", msg: "كلمة المرور خاطئة , حاول مرة اخرى", active: true });
                }
            } else {
                res.json({ status: false, type: "patient", msg: "الحساب غير مفعل , تم ارسال رمز التفعيل الى الإيميل الخاص بك <" + email + ">", active: false });
            }

        } else {
            const doctor = await DOCTOR.findOne({ '$and': [{ email: email }, { password: password }] });
            if (doctor) {
                if (password == doctor.password) {
                    res.json({ status: true, type: "doctor", user: doctor })
                } else {
                    res.json({ status: false, type: "doctor", msg: "كلمة المرور خاطئة , حاول مرة اخرى" });
                }
            } else {
                const admin = await ADMIN.findOne({ '$and': [{ email: email }, { password: password }] });
                if (admin) {
                    // returm admin
                    if (password == admin.password) {
                        res.json({ status: true, type: "admin", user: admin })
                    } else {
                        res.json({ status: false, type: "admin", msg: "كلمة المرور خاطئة , حاول مرة اخرى" });
                    }
                } else {
                    // this user not exis
                    res.json({ status: false, msg: "الايميل ليس موجود , حاول مرة اخرى" })
                }
            }
        }
    },
}
