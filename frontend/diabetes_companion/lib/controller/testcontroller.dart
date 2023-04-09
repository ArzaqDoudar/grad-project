import '../core/functions/handlingdatacontroller.dart';
import '/core/class/statusrequest.dart';
import '/data/datasource/remote/testdata.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("================== Controller $response ");
    statusRequest =
        handlingData(response); // this function from core/functions folder
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['result']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update(); // to refresh UI
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
