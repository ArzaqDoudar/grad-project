// import 'package:flutter/material.dart';

// import '../../../core/class/statusrequest.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/functions/handlingdatacontroller.dart';
// import '../../../data/datasource/remote/patient/patient.dart';
// import '../../../data/datasource/remote/patient/profile/profile.dart';
// import '../../../view/widget/profileline.dart';
// import '/core/constant/routes.dart';
// import 'package:get/get.dart';

// abstract class MainScreenController extends GetxController {
//   goToChatScreen();
//   changeIndex(value);
//   goToEditProfile();
//   goToMyAppointments();
//   goToMyDoctors();
//   goToSettings();
//   showHideData();
//   getData();
//   signOut();
// }

// class MainScreenControllerImp extends MainScreenController {
//   late String id;
//   late String? email;
//   // late String? id;

//   String? name;
//   String? phone;
//   String? gender;
//   DateTime? birthdate;
//   int? diabetestype;
//   String? avatar;
//   bool dataVisible = false;
//   int? birthyear;
//   int year = DateTime.now().year;

//   late List<ProfileLine> data = [];
//   late String? secondEmail;
//   late String? secondName;
//   PatientData patientData = PatientData(Get.find());
//   ProfileData profileData = ProfileData(Get.find());

//   StatusRequest statusRequest = StatusRequest.none;
//   int index = 0;
//   List<Widget> items = <Widget>[
//     const Icon(
//       Icons.home,
//       color: Colors.white,
//       size: 26,
//     ),
//     const Icon(
//       Icons.bar_chart_rounded,
//       color: ColorApp.blue,
//       size: 26,
//     ),
//     const Icon(
//       Icons.add_circle_outlined,
//       color: ColorApp.blue,
//       size: 26,
//     ),
//     const Icon(
//       Icons.account_circle_rounded,
//       color: ColorApp.blue,
//       size: 26,
//     ),
//     const Icon(
//       Icons.store,
//       color: ColorApp.blue,
//       size: 26,
//     ),
//   ];

//   @override
//   void onInit() {
//     id = Get.arguments['id'];
//     email = Get.arguments['email'];
//     getData();
//     update();
//     print('email from go to controller screen $email');
//     super.onInit();
//   }

//   @override
//   goToChatScreen() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await patientData.postData(id);
//     statusRequest = handlingData(response);
//     print("response after handle= $response");
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == true) {
//         secondEmail = response['doctor_email'];
//         secondName = response['doctor_name'];
//         print('secondEmail');
//         print(secondEmail);
//         print(response['doctor_name']);
//         Get.toNamed(RouteApp.chatting, arguments: {
//           'id': id,
//           'email': email,
//           'secondEmail': secondEmail,
//           'secondName': secondName,
//         });
//       } else {
//         print(response['msg']);
//         print('no email');
//         Get.toNamed(RouteApp.nodoctorchat);
//       }
//     } else {
//       print('statusRequest');
//       print(statusRequest);
//       print(response['msg']);
//       Get.toNamed(RouteApp.nodoctorchat);
//     }
//     print('email from go to chat screen $email');

//     // TODO if Doctor id is not exist change the route
//   }

//   @override
//   changeIndex(value) {
//     index = value;
//     // if (index == 0) {
//     //   HomeControllerImp homecontroller = HomeControllerImp();
//     //   Get.put(homecontroller);
//     // } else if (index == 1) {
//     //   ReportControllerImp reportController = ReportControllerImp();
//     //   Get.put(reportController);
//     // } else if (index == 2) {
//     //   AddLogsControllerImp addLogsController = AddLogsControllerImp();
//     //   Get.put(addLogsController);
//     // } else if (index == 3) {
//     //   ProfileControllerImp profileController = ProfileControllerImp();
//     //   Get.put(profileController);
//     // } else if (index == 4) {
//     //   StoreControllerImp storeController = StoreControllerImp();
//     //   Get.put(storeController);
//     // }

//     items = <Widget>[
//       Icon(
//         Icons.home,
//         color: index == 0 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.bar_chart_rounded,
//         color: index == 1 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.add_circle_outlined,
//         color: index == 2 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.account_circle_rounded,
//         color: index == 3 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.store,
//         color: index == 4 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//     ];
//     update();
//   }

//   @override
//   getData() async {
//     print('getData');
//     print('id in profile controller = $id');
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await profileData.postData(id);
//     print('response = $response');

//     statusRequest = handlingData(response);

//     if (statusRequest == StatusRequest.success) {
//       //
//       if (response['status'] == true) {
//         print("data name");
//         name = response["name"];
//         email = response["email"];
//         phone = response["phone"].toString();
//         diabetestype = response["diabetes_type"];
//         gender = response["gender"];
//         avatar = response["avatar"];
//         birthdate = DateTime(2023, 5, 13);

//         print('name');
//         print(name);
//         print(diabetestype);
//         print(phone);
//         print(gender);
//         print('birthdate $birthdate ');
//         print('birthdate ${response["birthdate"]} ');

//         data = [
//           ProfileLine(
//             title: 'الايميل',
//             value: email!,
//             icon: const Icon(
//               Icons.label_important,
//               color: ColorApp.red,
//             ),
//           ),
//           ProfileLine(
//             title: 'رقم الهاتف',
//             value: phone != null ? '0${phone!}' : 'غير معرف',
//             icon: const Icon(
//               Icons.label_important,
//               color: ColorApp.red,
//             ),
//           ),
//           ProfileLine(
//             title: 'نوع السكري',
//             value: diabetestype == 1
//                 ? 'النوع الأول'
//                 : diabetestype == 2
//                     ? "النوع الثاني"
//                     : 'غير معرف',
//             icon: const Icon(
//               Icons.label_important,
//               color: ColorApp.red,
//             ),
//           ),
//           ProfileLine(
//             title: 'الجنس',
//             value: gender == 'female'
//                 ? 'انثى'
//                 : gender == 'male'
//                     ? "ذكر"
//                     : 'غير معرف',
//             icon: const Icon(
//               Icons.label_important,
//               color: ColorApp.red,
//             ),
//           ),
//         ];
//         update();
//       } else {
//         print('empty');
//       }
//     } else {
//       print('not success');
//     }
//   }

//   @override
//   goToEditProfile() {
//     Get.toNamed(RouteApp.editprofile, arguments: {
//       'id': id,
//       'email': email,
//       'name': name,
//       'birthdate': birthdate,
//       'gender': gender,
//       'diabetestype': diabetestype,
//       'phone': phone,
//       'avatar': avatar,
//     });
//   }

//   @override
//   goToMyDoctors() {
//     Get.offNamed(RouteApp.mydoctors, arguments: {
//       'id': id,
//     });
//   }

//   @override
//   goToMyAppointments() {
//     Get.offNamed(RouteApp.myappointments, arguments: {
//       'id': id,
//     });
//   }

//   @override
//   goToSettings() {
//     Get.offNamed(RouteApp.mainscreen);
//   }

//   @override
//   showHideData() {
//     dataVisible = !dataVisible;
//     update();
//   }

//   @override
//   signOut() {
//     print('signout');
//     Get.offNamed(RouteApp.login);
//   }
// }
