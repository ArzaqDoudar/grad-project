import 'package:diabetes_companion/view/screen/firebase/chatallpatients.dart';
import 'package:diabetes_companion/view/screen/firebase/chatscreen.dart';
import 'package:diabetes_companion/view/screen/firebase/nodoctorchat.dart';
import 'package:diabetes_companion/view/screen/patient/home.dart';
import 'package:diabetes_companion/view/screen/patient/morepage.dart';
import 'package:diabetes_companion/view/screen/patient/profile/editprofile.dart';
import 'package:diabetes_companion/view/screen/patient/profile/mydoctors.dart';
import 'package:diabetes_companion/view/screen/patient/profile/resetpassword.dart';
import 'package:diabetes_companion/view/screen/patient/storespage.dart';
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
import 'view/screen/patient/profile/addnewdoctor.dart';
import 'view/screen/patient/profile/appointments.dart';
import 'view/screen/patient/profilepage.dart';
import 'view/screen/patient/reportpage.dart';

List<GetPage<dynamic>>? routes = [
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

  // GetPage(name: RouteApp.mainscreen, page: () => MainScreen()),
  // GetPage(name: RouteApp.mainscreen, page: () => MorePage()),

  GetPage(name: RouteApp.home, page: () => Home()),
  GetPage(name: RouteApp.reportspages, page: () => ReportPage()),
  GetPage(name: RouteApp.morepages, page: () => MorePage()),
  GetPage(name: RouteApp.profile, page: () => ProfilePage()),
  GetPage(name: RouteApp.storespages, page: () => StorePage()),

  //profile
  GetPage(name: RouteApp.editprofile, page: () => const EditProfile()),
  GetPage(name: RouteApp.mydoctors, page: () => MyDoctors()),
  GetPage(name: RouteApp.addnewdoctor, page: () => AddNewDoctor()),
  GetPage(name: RouteApp.myappointments, page: () => const Appointments()),
  GetPage(name: RouteApp.resetpassword, page: () => const ResetPassword()),

  //firebase
  GetPage(name: RouteApp.chatting, page: () => ChatScreen()),
  GetPage(name: RouteApp.nodoctorchat, page: () => const NoDoctorChat()),
  GetPage(name: RouteApp.chatallpatients, page: () => const ChatAllPatients()),

  //doctor
  GetPage(name: RouteApp.homedoctor, page: () => HomeDoctor()),
  GetPage(name: RouteApp.profiledoctor, page: () => const ProfilePageDoctor()),
  // GetPage(name: RouteApp.mainscreendoctor, page: () => MainScreenDoctor()),
  // GetPage(name: RouteApp.patientinfo, page: () => const PatientInfo()),
  // GetPage(name: RouteApp.addadvice, page: () => const NewPassword()),
  // GetPage(name: RouteApp.patient, page: () => const MainScreen()),
  GetPage(name: RouteApp.test, page: () => const TestPage()),
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
