import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/calculateage.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/patient/profile/profile.dart';

abstract class PatientInformationController extends GetxController {
  getData();
  goToPatientReport();
}

class PatientInformationControllerImp extends PatientInformationController {
  late String? id;
  late String? email;
  // late TextEditingController name;

  // late String? patientId;
  late String? patientName;
  late String? patientId;
  late String? patientEmail;
  late String? diabetesType;
  late int? patientAge;
  late String? patientGender;
  late num? patientPhone;

  String? gender;
  String? birthdate;
  String? birthdatedata;
  int? age;

  String? heartdisease; // امراض القلب
  String? bloodpressure; // ضغط الدم
  String? kidneydisease; // امراض الكلى
  String? greasy;

  List<Text> diseaselist = [];

  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    patientName = '';
    patientId = '';
    patientEmail = '';
    diabetesType = '';
    patientAge = 0;
    patientGender = '';
    patientPhone = 0;
    heartdisease = "false";
    bloodpressure = "false";
    kidneydisease = "false";
    greasy = "false";
    getData();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    // name.dispose();
    super.dispose();
  }

  @override
  getData() async {
    print('getData');
    print('id in profile controller = $id');
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.postData(id!);
    print('response = $response');

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      //   arzaq111@gmail.com
      update();
      if (response['status'] == true) {
        print("data name");
        patientId = response["id"];
        update();
        print('patient id = ${patientId}');
        patientName = response["name"];
        patientEmail = response["email"];
        patientPhone = response["phone"];
        diabetesType = response["diabetes_type"];
        gender = response["gender"];
        // avatar = response["avatar"];
        birthdate = response["birthdate"];

        heartdisease = response["heartdisease"];
        bloodpressure = response["bloodpressure"];
        kidneydisease = response["kidneydisease"];
        greasy = response["greasy"];

        diabetesType == "1"
            ? diabetesType = 'النوع الاول'
            : diabetesType == "2"
                ? diabetesType = 'النوع الثاني'
                : diabetesType = 'غير معرف';
        gender == 'male' ? patientGender = 'ذكر' : patientGender = 'انثى';

        if (birthdate != null) {
          List<String> date = birthdate!.split('T');
          List<String> ageData = date[0].split('-');
          birthdatedata = date[0];

          age = calculateAge(int.parse(ageData[2]), int.parse(ageData[1]),
              int.parse(ageData[0]));
          birthdatedata = "$birthdatedata { $age عام}";
        }
        patientAge = age;

        if (bloodpressure == "true") {
          const Text text = Text('ضغط الدم',
              style: TextStyle(
                fontSize: 14,
                color: ColorApp.blue,
                fontWeight: FontWeight.bold,
              ));

          diseaselist.add(text);
        }

        if (heartdisease == "true") {
          const Text text = Text('امراض القلب',
              style: TextStyle(
                fontSize: 14,
                color: ColorApp.blue,
                fontWeight: FontWeight.bold,
              ));

          diseaselist.add(text);
        }
        if (kidneydisease == 'true') {
          const Text text = Text('امراض الكلى',
              style: TextStyle(
                fontSize: 14,
                color: ColorApp.blue,
                fontWeight: FontWeight.bold,
              ));

          diseaselist.add(text);
        }
        if (greasy == "true") {
          const Text text = Text('الدهنيات',
              style: TextStyle(
                fontSize: 14,
                color: ColorApp.blue,
                fontWeight: FontWeight.bold,
              ));

          diseaselist.add(text);
        }
        update();
      } else {
        print('empty');
      }
    } else {
      print('not success');
    }
  }

  @override
  goToPatientReport() {
    Get.toNamed(RouteApp.patientreportspages, arguments: {
      'id': patientId,
      'email': patientEmail,
      'name': patientName,
    });
  }
}
