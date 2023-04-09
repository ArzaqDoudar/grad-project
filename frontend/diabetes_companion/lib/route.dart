import 'package:get/get.dart';
import '/test.dart';
import '/view/screen/auth/forgetpassword/newpassword.dart';
import 'core/constant/routes.dart';
import 'view/screen/auth/forgetpassword/emailverification.dart';
import 'view/screen/auth/forgetpassword/verificationcode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/startup.dart';
import 'view/screen/auth/verifypatient.dart';
import 'view/screen/doctor/homepage.dart';
import 'view/screen/doctor/mainscreen.dart';
import 'view/screen/doctor/profile/profilepage.dart';
import 'view/screen/patient/mainscreen.dart';
import 'view/screen/patient/profile/editprofile.dart';
import 'view/screen/patient/profile/profilepage.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: '/', page: () => const MainScreenDoctor()),
  // GetPage(name: '/', page: () => EditProfile()),
  GetPage(name: '/', page: () => const Startup()),
  // GetPage(name: '/', page: () => const OnBoarding()),
  // GetPage(
  //   name: RouteApp.onboarding,
  //   page: () => const OnBoarding(),
  //   middlewares: [MiddleWare()],
  // ),
  GetPage(name: RouteApp.login, page: () => const Login()),
  GetPage(name: RouteApp.signup, page: () => const Signup()),
  GetPage(name: RouteApp.verifypatient, page: () => const VerifyPatient()),
  GetPage(
      name: RouteApp.forgetpasswordemail,
      page: () => const EmailVerification()),
  GetPage(
      name: RouteApp.forgetpasswordcode, page: () => const VerificationCode()),
  GetPage(name: RouteApp.newpassword, page: () => const NewPassword()),
  GetPage(name: RouteApp.mainscreen, page: () => const MainScreen()),
  GetPage(name: RouteApp.profile, page: () => const ProfilePage()),
  GetPage(name: RouteApp.test, page: () => const TestPage()),

  // GetPage(name: '/', page: () => const Startup()),

  //doctor
  GetPage(name: RouteApp.homedoctor, page: () => HomeDoctor()),
  GetPage(name: RouteApp.profiledoctor, page: () => const ProfilePageDoctor()),
  GetPage(
      name: RouteApp.mainscreendoctor, page: () => const MainScreenDoctor()),
  // GetPage(name: RouteApp.patientinfo, page: () => const PatientInfo()),
  // GetPage(name: RouteApp.addadvice, page: () => const NewPassword()),
  // GetPage(name: RouteApp.patient, page: () => const MainScreen()),
];




// const Test()

// Map<String, Widget Function(BuildContext)> routes = {
//   RouteApp.startup: (context) => const Startup(),
//   // RouteApp.test: (context) => const Test(),
//   RouteApp.onboarding: (context) => const OnBoarding(),
//   RouteApp.login: (context) => const Login(),
//   RouteApp.signup: (context) => const Signup(),
//   RouteApp.verifypatient: (context) => const VerifyPatient(),
//   RouteApp.forgetpasswordemail: (context) => const EmailVerification(),
//   RouteApp.forgetpasswordcode: (context) => const VerificationCode(),
//   RouteApp.newpassword: (context) => const NewPassword(),
//   RouteApp.mainscreen: (context) => const MainScreen(),
//   RouteApp.profile: (context) => const ProfilePage(),
// };
