import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';

abstract class AlarmController extends GetxController {
  goToTest();
  addAlarm();
  showAlarm();
}

class AlarmControllerImp extends AlarmController {
  late String? id;
  late String? email;
  late TextEditingController name;
  // late TextEditingController title;
  late TextEditingController time;
  late SingleValueDropDownController title;
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  @override
  void onInit() {
    // id = Get.arguments['id'];
    // email = Get.arguments['email'];
    title = SingleValueDropDownController();
    title.setDropDown(
        const DropDownValueModel(name: 'اختر عنوان للمنبه', value: " "));
    time = TextEditingController();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  goToTest() {
    Get.toNamed(RouteApp.test, arguments: {
      'id': id,
    });
  }

  @override
  addAlarm() {
    if (time.text.isNotEmpty) {
      List<String> timedata = time.text.split(':');
      int hour = int.parse(timedata[0]);
      int min = int.parse(timedata[1]);
      FlutterAlarmClock.createAlarm(hour, min,
          title: title.dropDownValue?.value ?? '');
      title.clearDropDown();
      time.clear();
    }
  }

  @override
  showAlarm() {
    FlutterAlarmClock.showAlarms();
  }
}
