import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

abstract class StoreController extends GetxController {
  getData();
}

class StoreControllerImp extends StoreController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  String? id;
  String? email;
  String? name;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    email = Get.arguments['email'];
  }

  @override
  getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }
}
