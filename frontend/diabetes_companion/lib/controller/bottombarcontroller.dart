import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';
import '../core/constant/routes.dart';

abstract class BottomBarController extends GetxController {
  goToHome();
  goToReport();
  goToAddLogs();
  goToProfile();
  goToStore();
  changeIndex(int value);
}

class BottomBarControllerImp extends BottomBarController {
  BottomBarControllerImp(String _id, String _email) {
    id = _id;
    email = _email;
  }

  String? id;
  String? email;
  int index = 0;

  List<Widget> items = <Widget>[
    const Icon(
      Icons.home,
      color: Colors.white,
      size: 26,
    ),
    const Icon(
      Icons.bar_chart_rounded,
      color: ColorApp.blue,
      size: 26,
    ),
    const Icon(
      Icons.add_circle_outlined,
      color: ColorApp.blue,
      size: 26,
    ),
    const Icon(
      Icons.account_circle_rounded,
      color: ColorApp.blue,
      size: 26,
    ),
    const Icon(
      Icons.store,
      color: ColorApp.blue,
      size: 26,
    ),
  ];
  @override
  void onInit() {
    // id = Get.arguments['id'];
    // email = Get.arguments['email'];
    changeIndex(0);
    update();
    super.onInit();
  }

  @override
  changeIndex(value) {
    index = value;

    items = <Widget>[
      Icon(
        Icons.home,
        color: index == 0 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.bar_chart_rounded,
        color: index == 1 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.add_circle_outlined,
        color: index == 2 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.account_circle_rounded,
        color: index == 3 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.store,
        color: index == 4 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
    ];
    update();
  }

  @override
  goToAddLogs() {
    Get.toNamed(RouteApp.morepages, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  goToHome() {
    Get.toNamed(RouteApp.home, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  goToProfile() {
    Get.toNamed(RouteApp.profile, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  goToReport() {
    Get.toNamed(RouteApp.reportspages, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  goToStore() {
    Get.toNamed(RouteApp.storespages, arguments: {
      'id': id,
      'email': email,
    });
  }
}
