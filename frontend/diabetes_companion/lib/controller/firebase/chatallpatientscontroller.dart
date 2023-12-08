import '/view/widget/patientline.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';

abstract class ChatAllPatientsController extends GetxController {
  getAllPatents();
  goToAddPatient();
  void goToChatScreen(String secondEmail, String secondName);
}

class ChatAllPatientsControllerImp extends ChatAllPatientsController {
  StatusRequest statusRequest = StatusRequest.none;
  List<PatientLine> patentWedgets = [];

  late String? id;
  late String? email;
  // final patients;

  @override
  void onInit() {
    print('ChatAllPatientsControllerImp 1');
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    print('ChatAllPatientsControllerImp 2');
    print(id);
    print(email);
    print(email);
    getAllPatents();
    update();

    print('patentWedgets $patentWedgets');
    super.onInit();
  }

  @override
  getAllPatents() {
    print('getAllPatents Imp');
    final patients = Get.arguments['patients'] ?? [];
    for (var patient in patients) {
      print('patient $patient');
      final String patientEmail = patient['email'];
      final String patientName = patient['name'];
      final String patientDT = patient['diabetes_type'];
      final String patientgender = patient['gender'];

      final patientWedget = PatientLine(
        email: patientEmail,
        name: patientName,
        diabetestype: int.parse(patientDT),
        gender: patientgender,
        onPressedFun: () => goToChatScreen(patientEmail, patientName),
      );
      patentWedgets.add(patientWedget);
    }
  }

  @override
  void goToChatScreen(secondEmail, secondName) {
    print('secondEmail');
    print(secondEmail);
    Get.toNamed(RouteApp.chatting, arguments: {
      'id': id,
      'email': email,
      'secondEmail': secondEmail,
      'secondName': secondName,
    });
  }

  @override
  goToAddPatient() {
    // print('goToAddPatient ..................................');
    Get.toNamed(RouteApp.addpatient, arguments: {
      'id': id,
      'email': email,
    });
  }
}
