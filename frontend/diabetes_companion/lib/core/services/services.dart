import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('sharedPreferences =========== $sharedPreferences ============');
    return this;
  }
}

initialServies() async {
  await Get.putAsync(() => MyServices().init());
}
