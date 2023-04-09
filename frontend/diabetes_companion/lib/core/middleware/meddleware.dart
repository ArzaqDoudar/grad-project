// import '/core/constant/routes.dart';
// import '/core/services/services.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MiddleWare extends GetMiddleware {
//   MyServices myServices = Get.find();
//   @override
//   int? get priority => 1;
//   @override
//   RouteSettings? redirect(String? route) {
//     print('myServices onboardung ====== ');
//     // print(myServices.sharedPreferences.get('onBoarding'));
//     if (myServices.sharedPreferences.getString("onBoarding") == "1") {
//       print('myServices onboardung ====== ');
//       return const RouteSettings(name: RouteApp.login);
//     } else {
//       return const RouteSettings(name: RouteApp.onboarding);
//     }
//   }
// }
