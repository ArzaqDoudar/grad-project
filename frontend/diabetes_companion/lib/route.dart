import 'package:diabetes_companion/view/screen/patient/loginfo/insulinehistorypage.dart';
import 'package:diabetes_companion/view/screen/patient/store/storelocation.dart';
import 'package:diabetes_companion/view/screen/patient/store/storeprofile.dart';

import '/view/screen/doctor/addadvice.dart';
import '/view/screen/doctor/addpatient.dart';
import '/view/screen/doctor/profile/editprofile.dart';
import '/view/screen/firebase/chatallpatients.dart';
import '/view/screen/firebase/chatscreen.dart';
import '/view/screen/firebase/nodoctorchat.dart';
import '/view/screen/patient/home.dart';
import '/view/screen/patient/morepage.dart';
import '/view/screen/patient/profile/editprofile.dart';
import '/view/screen/patient/profile/mydoctors.dart';
import '/view/screen/patient/profile/resetpassword.dart';
import '/view/screen/patient/storespage.dart';
import '/view/widget/patientinformation.dart';
import 'package:get/get.dart';
import '/view/screen/auth/forgetpassword/newpassword.dart';
import 'controller/patient/maincontrollers/addlogscontroller.dart';
import 'core/constant/routes.dart';
import 'view/screen/auth/forgetpassword/emailverification.dart';
import 'view/screen/auth/forgetpassword/verificationcode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/startup.dart';
import 'view/screen/auth/verifypatient.dart';
import 'view/screen/doctor/homepagedoctor.dart';
import 'view/screen/doctor/patientreportpage.dart';
import 'view/screen/doctor/patients.dart';
import 'view/screen/doctor/profile/profilepage.dart';
import 'view/screen/patient/loginfo/adddose.dart';
import 'view/screen/patient/profile/addnewdoctor.dart';
import 'view/screen/patient/profile/appointments.dart';
import 'view/screen/patient/profilepage.dart';
import 'view/screen/patient/reportpage.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Startup()),
  // GetPage(name: RouteApp.onboarding, page: () => const OnBoarding()),
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

  GetPage(name: RouteApp.home, page: () => const Home()),
  GetPage(name: RouteApp.reportspages, page: () => const ReportPage()),
  GetPage(
      name: RouteApp.insulinhistorypage,
      page: () => const InsulinHistoryPage()),
  GetPage(name: RouteApp.morepages, page: () => const MorePage()),
  GetPage(name: RouteApp.profile, page: () => const ProfilePage()),
  GetPage(name: RouteApp.storespages, page: () => StorePage()),
  GetPage(name: RouteApp.storelocation, page: () => StoreLocation()),
  GetPage(name: RouteApp.storeprofile, page: () => const StoreProfile()),
  // GetPage(name: RouteApp.storespages, page: () => AddNewDose()),

  // scan

  //profile
  GetPage(name: RouteApp.editprofile, page: () => const EditProfile()),
  GetPage(name: RouteApp.mydoctors, page: () => MyDoctors()),
  GetPage(name: RouteApp.addnewdoctor, page: () => const AddNewDoctor()),
  GetPage(name: RouteApp.myappointments, page: () => const Appointments()),
  GetPage(name: RouteApp.resetpassword, page: () => const ResetPassword()),

  //firebase
  GetPage(name: RouteApp.chatting, page: () => ChatScreen()),
  GetPage(name: RouteApp.nodoctorchat, page: () => const NoDoctorChat()),
  GetPage(name: RouteApp.chatallpatients, page: () => const ChatAllPatients()),

  //doctor
  GetPage(name: RouteApp.homedoctor, page: () => const HomeDoctor()),
  GetPage(name: RouteApp.profiledoctor, page: () => const ProfilePageDoctor()),
  GetPage(
      name: RouteApp.editprofiledoctor, page: () => const EditProfileDoctor()),
  GetPage(name: RouteApp.patient, page: () => const PatientsPage()),
  GetPage(name: RouteApp.addpatient, page: () => const AddPatient()),
  GetPage(
      name: RouteApp.patientinformation,
      page: () => const PatientInformation()),
  GetPage(name: RouteApp.addadvice, page: () => const AddAdvice()),
  GetPage(
      name: RouteApp.patientreportspages,
      page: () => const PatientReportPage()),

  // addLogs

  // GetPage(name: RouteApp.showallcarbs, page: () => const AddNewCarbs()),
  GetPage(
      name: RouteApp.showallcarbs,
      page: () => AddNewDose(
            controller: AddLogsControllerImp(),
          )),
];
