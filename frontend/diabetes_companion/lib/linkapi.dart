class LinkApp {
  static const String server = "https://417d-158-140-78-237.ngrok-free.app";

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
  static const String changeToken = "$patients/changeToken";

  static const String getPatient = "$patients/getPatient";
  static const String editProfile = "$patients/editProfile";
  static const String getPatientDoctor = "$patients/getPatientDoctor";
  static const String addDoctor = "$patients/addDoctor";

  static const String patientsprofile = "$patients/profile";
  static const String getPatientsDoctors =
      "$patientsprofile/getPatientsDoctors";
  static const String insertDoctor = "$patientsprofile/insertDoctor";
  //advices
  static const String advices = "$server/advices";
  static const String insertAdvice = "$advices/insertAdvice";
  static const String getAdvice = "$advices/getAdvice";

// store

  static const String store = "$server/store";
  static const String product = "$store/product";
  static const String getAllStores = "$store/getAllStores";
  static const String getStore = "$store/getStore";
  static const String getProduct = "$product/getProduct";
  static const String getStoreProducts = "$product/getStoreProducts";

  //addlogs
  static const String addlogs = "$server/addlogs";
  static const String insertGlocose = "$addlogs/insertGlocose";
  static const String getGlocose = "$addlogs/getGlocose";
  static const String getAllCarbs = "$addlogs/getAllCarbs";
  static const String insertInsulin = "$addlogs/insertInsulin";
  static const String getInsulin = "$addlogs/getInsulin";

  // doctor
  static const String doctors = "$server/doctors";
  static const String getAllPatients = "$doctors/getAllPatients";
  static const String editProfileDoctor = "$doctors/editProfileDoctor";
  static const String getDoctor = "$doctors/getDoctor";
}
