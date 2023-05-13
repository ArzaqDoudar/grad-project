import 'package:diabetes_companion/view/widget/patientline.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';

abstract class ChatAllPatientsController extends GetxController {
  getAllPatents();
  goToChatScreen(secondEmail, secondName);
}

class ChatAllPatientsControllerImp extends ChatAllPatientsController {
  StatusRequest statusRequest = StatusRequest.none;
  List<PatientLine> patentWedgets = [];

  late String? id;
  late String? email;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    print(id);
    print(email);
    getAllPatents();
    update();
    super.onInit();
  }

  @override
  getAllPatents() {
    final patients = Get.arguments['patients'];
    for (var patient in patients) {
      final patientEmail = patient['email'];
      final patientName = patient['name'];
      final patientDT = patient['diabetes_type'];
      final patientAvatar = patient['avatar'];

      final patientWedget = PatientLine(
        email: patientEmail,
        name: patientName,
        diabetestype: patientDT,
        avatar: patientAvatar,
        onPressedFun: () => goToChatScreen(patientEmail, patientName),
      );
      patentWedgets.add(patientWedget);
    }
  }

  @override
  goToChatScreen(secondEmail, secondName) {
    print('secondEmail');
    print(secondEmail);
    Get.toNamed(RouteApp.chatting, arguments: {
      'id': id,
      'email': email,
      'secondEmail': secondEmail,
      'secondName': secondName,
    });
  }
}
