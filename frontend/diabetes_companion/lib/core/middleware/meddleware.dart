import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:diabetes_companion/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool('onboarding') == true) {
      return const RouteSettings(name: RouteApp.login);
    } else {
      return const RouteSettings(name: RouteApp.onboarding);
    }
  }
}
