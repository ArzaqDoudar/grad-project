import 'package:get/get.dart';

class NoDoctorControllerImp extends GetxController {
  String? id;
  @override
  void onInit() {
    id = Get.arguments['id'];
    super.onInit();
  }
}
