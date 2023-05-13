import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/patient/patient.dart';

abstract class TopBarController extends GetxController {
  goToChatScreen();
}

class TopBarControllerImp extends TopBarController {
  TopBarControllerImp(String _id, String _email) {
    id = _id;
    email = _email;
  }

  StatusRequest statusRequest = StatusRequest.none;
  PatientData patientData = PatientData(Get.find());

  late String? secondEmail;
  late String? secondName;
  late String? id;
  late String? email;
  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    // messageTextField = TextEditingController();
    update();
    super.onInit();
  }

  @override
  goToChatScreen() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await patientData.postData(id!);
    statusRequest = handlingData(response);
    print("response after handle= $response");
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
}
