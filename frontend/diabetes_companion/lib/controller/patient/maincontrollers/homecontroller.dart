import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getAdvice();
  getData();
}

class HomeControllerImp extends HomeController {
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
  getAdvice() {
    // TODO: implement getAdvice
    throw UnimplementedError();
  }

  @override
  getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }
}
