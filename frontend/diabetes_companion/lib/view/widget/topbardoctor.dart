import 'package:diabetes_companion/view/screen/firebase/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/doctor/doctor.dart';
import '../../data/datasource/remote/patient/patient.dart';

class TopBarDoctor extends StatelessWidget {
  final String id;
  final String email;
  final String? title;
  TopBarDoctor({
    required this.id,
    required this.email,
    super.key,
    this.title,
  });

  StatusRequest statusRequest = StatusRequest.none;
  PatientData patientData = PatientData(Get.find());
  DoctorData doctorData = DoctorData(Get.find());

  late String? patientEmail;
  late String? patientName;

  @override
  Widget build(BuildContext context) {
    // goToChatScreen1() {
    //   print('goToChatScreen1');
    //   Get.toNamed(RouteApp.chatallpatients, arguments: {
    //     'id': id,
    //     'email': email,

    //     //add hear
    //   });
    // }

    goToChatAllPatients() async {
      statusRequest = StatusRequest.loading;
      var response = await doctorData.getAllPatients(id);
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
          print('no email');
          Get.toNamed(RouteApp.chatallpatients, arguments: {
            'id': id,
            'email': email,
          });
        }
      } else {
        Get.toNamed(RouteApp.chatallpatients, arguments: {
          'id': id,
          'email': email,
        });
      }
    }

    return AppBar(
      elevation: 1,
      leading: IconButton(
        onPressed: () => goToChatAllPatients(),
        icon: const Icon(
          Icons.message,
          // color: ColorApp.blue,
        ),
      ),
      title: Text(
        title ?? 'رفيق السكري',
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notifications,
            // color: ColorApp.blue,
          ),
          onPressed: () {
            // TODO notifications
          },
        )
      ],
      backgroundColor: ColorApp.blue,
    );
  }
}
