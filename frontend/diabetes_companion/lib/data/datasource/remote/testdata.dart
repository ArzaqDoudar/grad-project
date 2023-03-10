import 'package:get/get.dart';

import '../../../linkapi.dart';
import '/core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(LinkApp.patients, {});
    response.fold((l) => l, (r) => r);
  }
}
