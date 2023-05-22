// EditProfileDoctorControllerImp

import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/editprofile.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../data/datasource/remote/doctor/doctor.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class EditProfileDoctorController extends GetxController {
  edit();
  goToResetPassword();
  // backToProfile();
}

class EditProfileDoctorControllerImp extends EditProfileDoctorController {
  StatusRequest statusRequest = StatusRequest.none;

  DoctorData doctorData = DoctorData(Get.find());
  // EditProfileData editProfileData = EditProfileData(Get.find());

  late String? id;
  late String? email;
  late TextEditingController name;
  late TextEditingController specialty;
  late TextEditingController phone;

  String? namedata;
  String? phonedata;
  String? specialtydata;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    namedata = Get.arguments['name'];
    phonedata = Get.arguments['phone'];
    specialtydata = Get.arguments['specialty'];

    name = TextEditingController();
    specialty = TextEditingController();
    phone = TextEditingController();

    if (namedata != null) {
      name.text = namedata!;
    }
    if (specialtydata != null) {
      specialty.text = specialtydata!;
    }
    if (phonedata != null) {
      if (phonedata != "0") {
        phone.text = ' 0$phonedata';
      }
    }
    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    specialty.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  edit() async {
    statusRequest = StatusRequest.loading;
    update();
    // if (phone.text.isEmpty) {
    //   phone.text = "0";
    // }
    var response = await doctorData.editProfile(
      id!,
      name.text,
      phone.text,
      specialty.text,
    );
    // print('response1 $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      // print('response $response');
      if (response['status'] == true) {
        Get.offNamed(RouteApp.profiledoctor, arguments: {
          'id': response['id'],
          'email': response['email'],
        });
      } else {
        Get.defaultDialog(
          title: 'حدث خطأ',
          middleText: response['msg'],
        );
      }
    } else {
      // print('id = $id');
      print('statusRequest = $statusRequest');
      print('response error');
    }
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(RouteApp.resetpassword, arguments: {
      'id': id,
      'email': email,
    });
  }
}
