import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';

abstract class PatientInformationController extends GetxController {
  goToTest();
}

class PatientInformationControllerImp extends PatientInformationController {
  late String? id;
  late String? email;
  late TextEditingController name;

  late String? patientId;
  late String? patientName;
  late String? patientEmail;
  late String? diabetesType;
  late int? patientAge;
  late String? patientGender;
  late num? patientPhone;

  late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
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
}
