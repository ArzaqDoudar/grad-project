import 'package:diabetes_companion/view/screen/firebase/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/topbarcontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../data/datasource/remote/patient/patient.dart';

class TopBar extends StatelessWidget {
  final String id;
  final String email;
  TopBar({
    required this.id,
    required this.email,
    super.key,
  });

  StatusRequest statusRequest = StatusRequest.none;
  PatientData patientData = PatientData(Get.find());

  late String? secondEmail;
  late String? secondName;

  @override
  Widget build(BuildContext context) {
    goToChatScreen() async {
      statusRequest = StatusRequest.loading;
      var response = await patientData.postData(id);
      statusRequest = handlingData(response);
      print("response after handle= $response");
      print('arzaq email');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          secondEmail = response['doctor_email'];
          secondName = response['doctor_name'];
          print('secondEmail');
          print(secondEmail);
          print(response['doctor_name']);
          Get.toNamed(RouteApp.chatting, arguments: {
            'id': id,
            'email': email,
            'secondEmail': secondEmail,
            'secondName': secondName,
          });
        } else {
          print(response['msg']);
          print('no email');
          Get.toNamed(RouteApp.nodoctorchat);
        }
      } else {
        print('statusRequest');
        print(statusRequest);
        print(response['msg']);
        Get.toNamed(RouteApp.nodoctorchat);
      }
      print('email from go to chat screen $email');

      // TODO if Doctor id is not exist change the route
    }

    return AppBar(
      elevation: 1,
      leading: IconButton(
        onPressed: () => goToChatScreen(),
        icon: const Icon(
          Icons.message,
          // color: ColorApp.blue,
        ),
      ),
      title: const Text(
        'رفيق السكري ',
        style: TextStyle(
            // color: ColorApp.blue,
            ),
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
