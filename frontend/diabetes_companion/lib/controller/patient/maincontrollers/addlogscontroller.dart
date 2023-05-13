import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/patient/addlogs.dart';

abstract class AddLogsController extends GetxController {
  getData();
  saveBloodGlocode();
}

class AddLogsControllerImp extends AddLogsController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());
  AddLogsData addLogsData = AddLogsData(Get.find());

  //blood glocose page
  late TextEditingController dateController;
  late TextEditingController glocoseController;
  late SingleValueDropDownController tsgController;

  //
  late TextEditingController weightController;
  late TextEditingController fatsWeightController;

  // carb page
  late TextEditingController fatsController;
  late TextEditingController carbsController;
  late TextEditingController proteinController;
  late TextEditingController caloriesController;

  String? id;
  String? email;
  String? name;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    dateController = TextEditingController();
    glocoseController = TextEditingController();
    weightController = TextEditingController();
    fatsWeightController = TextEditingController();
    fatsController = TextEditingController();
    carbsController = TextEditingController();
    proteinController = TextEditingController();
    caloriesController = TextEditingController();
    tsgController = SingleValueDropDownController();
  }

  @override
  getData() {}

  @override
  saveBloodGlocode() {
    print('hi');
    print('glocoseController ${glocoseController.text}');
    print('dateController ${dateController.text}');
    print('tsgController ${tsgController.dropDownValue?.value}');
    print('hi');

// bloodGlocose(String id, int data, DateTime time, String tag)
    // AddLogsData.bloodGlocose(String id, int data, DateTime time, String tag)
  }
}
