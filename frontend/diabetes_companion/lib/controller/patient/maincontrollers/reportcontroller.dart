import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/patient/addlogs.dart';

abstract class ReportController extends GetxController {
  getData();
}

class ReportControllerImp extends ReportController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  AddLogsData addLogsData = AddLogsData(Get.find());

  String? id;
  String? email;
  String? name;

  String _time = '1';
  String get time => _time;
  set time(String value) {
    _time = value;
    print("time $_time");
    update();
  }

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
