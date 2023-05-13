class LinkApp {
  static const String server = "https://7573-82-213-52-108.ngrok-free.app";

  //==================== Auth =================================
  static const String login = "$server/login"; // public file

  // static const String signup = "$server/signup";
  // static const String signupInsert = "$server/signup/insertPatient";
  // static const String checkCode = "$server/signup/checkCode";

  // patients

  static const String patients = "$server/patients";
  static const String signupInsert = "$patients/insertPatient"; // Done
  static const String checkCode = "$patients/checkCode"; // Done
  static const String resendVerifyCode = "$patients/resendVerifyCode";

  static const String checkEmail = "$patients/checkEmail";
  static const String resetPassword = "$patients/resetPassword";
  static const String changePassword = "$patients/changePassword";

  static const String getPatient = "$patients/getPatient";
  static const String editProfile = "$patients/editProfile";
  static const String getPatientDoctor = "$patients/getPatientDoctor";

  static const String patientsprofile = "$patients/profile";
  static const String getPatientsDoctors =
      "$patientsprofile/getPatientsDoctors";
  static const String insertDoctor = "$patientsprofile/insertDoctor";
  //advices
  static const String advices = "$server/advices";

  //addlogs
  static const String logs = "$server/logs";
  static const String bloodglocose = "$logs/bloodglocose";

  // doctor
  static const String doctors = "$server/doctors";
  static const String getAllPatients = "$doctors/getAllPatients";
}
