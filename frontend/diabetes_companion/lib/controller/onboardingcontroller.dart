import 'package:diabetes_companion/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/static/onboardinglist.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  MyServices myServices = Get.find();
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage >= onBoardingList.length) {
      myServices.sharedPreferences.setBool('onBoarding', true);
      Get.offNamed(RouteApp.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void skip() {
    myServices.sharedPreferences.setBool('onBoarding', true);
    Get.offNamed(RouteApp.login);
  }
}
