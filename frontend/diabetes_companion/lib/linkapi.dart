class LinkApp {
  static const String server = "https://79d4-82-213-3-79.eu.ngrok.io";

  //==================== Auth =================================
  static const String login = "$server/login"; // public file

  // static const String signup = "$server/signup";
  // static const String signupInsert = "$server/signup/insertPatient";
  // static const String checkCode = "$server/signup/checkCode";

  // patients
  static const String patients = "$server/patients";
  static const String signupInsert = "$patients/insertPatient"; // Done
  static const String checkCode = "$patients/checkCode"; // Done
  static const String changeVerifyCode = "$patients/changeVerifyCode";

  static const String checkEmail = "$patients/checkEmail";
  static const String resetPassword = "$patients/resetPassword";
  static const String changePassword = "$patients/changePassword";
  //advices
  static const String advices = "$server/advices";
}
