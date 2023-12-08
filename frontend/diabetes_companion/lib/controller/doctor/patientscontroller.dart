import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/calculateage.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/doctor/doctor.dart';
import '../../view/widget/patientwidget.dart';

abstract class PatientsController extends GetxController {
  void goToPatientInformation(String id, String email);
  goToAddNewPatient();
  getPatients();
}

class PatientsControllerImp extends PatientsController {
  late String? id;
  late String? email;
  late TextEditingController name;
  late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;
  List<PatientWidget> patentWedgets = [];
  // ProfileData profileData = ProfileData(Get.find());

  DoctorData doctorData = DoctorData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getPatients();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  getPatients() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doctorData.getAllPatients(id!);
    statusRequest = handlingData(response);
    // print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        final patients = response['patients'] ?? [];
        for (var patient in patients) {
          // print('patient $patient');
          print('patient email is ( ${patient['email']} )');

          final String patientEmail = patient['email'];
          final String patientid = patient['_id'];
          final String patientName = patient['name'];
          final String patientDT = patient['diabetes_type'];
          final String patientgender = patient['gender'];
          final String birthdate = patient['birthdate'] ?? "";
          print('BIRTHDATE == $birthdate');
          var age = 0;

          if (birthdate.isNotEmpty) {
            List<String> date = birthdate.split('T');
            List<String> ageData = date[0].split('-');

            age = calculateAge(int.parse(ageData[2]), int.parse(ageData[1]),
                int.parse(ageData[0]));
          }

          final patientWedget = PatientWidget(
            diabetesType: patientDT,
            patientAge: age,
            patientName: patientName,
            gender: patientgender,
            onPressedFun: () => goToPatientInformation(patientid, patientEmail),
          );

          patentWedgets.add(patientWedget);
          update();
        }
      }
    }
  }

  @override
  void goToPatientInformation(id, email) {
    Get.toNamed(RouteApp.patientinformation, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  goToAddNewPatient() {
    Get.offNamed(RouteApp.addpatient, arguments: {
      'id': id,
      'email': email,
    });
  }
}
