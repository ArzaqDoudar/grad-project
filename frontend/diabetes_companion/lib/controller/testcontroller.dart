import '/core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '/data/datasource/remote/testdata.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest =
        handlingData(response); // this function from core/functions folder
    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
    }
    update(); // to refresh UI
  }
}
