import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/doctor/doctor.dart';
import '../../data/datasource/remote/patient/patient.dart';

abstract class MainScreenDoctorController extends GetxController {
  goToChatAllPatients();
  goToChatScreen();
  changeIndex(value);
}

class MainScreenDoctorControllerImp extends MainScreenDoctorController {
  late String? email;
  late String? id;

  late String? patientEmail;
  late String? patientName;
  PatientData patientData = PatientData(Get.find());
  DoctorData doctorData = DoctorData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  int index = 0;
  List<Widget> items = <Widget>[
    const Icon(
      Icons.home,
      color: Colors.white,
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
      Icons.medical_services,
      color: ColorApp.blue,
      size: 26,
    ),
  ];

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];

    print('email from go to controller screen $email');
    super.onInit();
  }

  @override
  goToChatScreen() async {
    // statusRequest = StatusRequest.loading;
    // update();
    // var response = await patientData.postData(id!);
    // statusRequest = handlingData(response);
    // print("response after handle= $response");
    // if (statusRequest == StatusRequest.success) {
    //   if (response['status'] == true) {
    //     patientEmail = response['doctor_id'];
    //     patientName = response['doctor_name'];

    //     Get.toNamed(RouteApp.chatting, arguments: {
    //       'id': id,
    //       'email': email,
    //       'secondEmail': patientEmail,
    //       'secondName': patientName,
    //     });
    //   } else {
    //     print(response['msg']);
    //     print('no email');
    //     Get.toNamed(RouteApp.nodoctorchat);
    //   }
    // } else {
    //   print('statusRequest');
    //   print(statusRequest);
    //   print(response['msg']);
    //   Get.toNamed(RouteApp.nodoctorchat);
    // }
    // print('email from go to chat screen $email');

    // TODO if Doctor id is not exist change the route
  }

  @override
  changeIndex(value) {
    index = value;
    print("index inside controller $index");
    items = <Widget>[
      Icon(
        Icons.home,
        color: index == 0 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.add_circle_outlined,
        color: index == 1 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.account_circle_rounded,
        color: index == 2 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
      Icon(
        Icons.medical_services,
        color: index == 3 ? Colors.white : ColorApp.blue,
        size: 26,
      ),
    ];
    update();
  }

  @override
  goToChatAllPatients() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doctorData.getAllPatients(id!);
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        print(response['patients']);
        Get.toNamed(RouteApp.chatallpatients, arguments: {
          'id': id,
          'email': email,
          'patients': response['patients'],
        });
      } else {
        // print(response['msg']);
        // print('no email');
        // Get.toNamed(RouteApp.nodoctorchat);
      }
    } else {
      // print('statusRequest');
      // print(statusRequest);
      // print(response['msg']);
      // Get.toNamed(RouteApp.nodoctorchat);
    }
    print('id');
    print(id);
    // Get.toNamed(RouteApp.chatallpatients);
  }
}
