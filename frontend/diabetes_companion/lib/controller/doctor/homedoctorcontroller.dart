import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

abstract class HomeDoctorController extends GetxController {
  // getAdvice();
  getData();
}

class HomeDoctorControllerImp extends HomeDoctorController {
  StatusRequest statusRequest = StatusRequest.none;

  // AdviceData adviceData = AdviceData(Get.find());
  // ProfileData profileData = ProfileData(Get.find());

  String? id;
  String? email;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    update();
    super.onInit();
  }

  @override
  getData() {
    statusRequest = StatusRequest.loading;
  }
}
