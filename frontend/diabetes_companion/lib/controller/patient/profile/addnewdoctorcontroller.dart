import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../linkapi.dart';

abstract class AddNewDoctorController extends GetxController {
  addNewDoctor();
  goToMyDoctors();
}

class AddNewDoctorControllerImp extends AddNewDoctorController {
  late String? id;
  late String? myemail;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController location;
  late TextEditingController specialty;
  // late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    myemail = Get.arguments['email'];

    name = TextEditingController();
    email = TextEditingController();
    location = TextEditingController();
    specialty = TextEditingController();
    phone = TextEditingController();

    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    location.dispose();
    specialty.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  addNewDoctor() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.addNewDoctor(
        id!, name.text, specialty.text, email.text, phone.text, location.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        goToMyDoctors();
      }
    }
  }
  // Get.toNamed(RouteApp.test, arguments: {
  //   'id': id,
  // });
  // }

  @override
  goToMyDoctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getPatientsDoctors(id!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        Get.offNamed(RouteApp.mydoctors, arguments: {
          'id': id,
          'email': myemail,
          'doctors': response['doctors'],
        });
      }
    }
  }
}
