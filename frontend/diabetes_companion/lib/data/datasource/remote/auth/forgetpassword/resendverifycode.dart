import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class ReSendVerifyCodeData {
  Crud crud;
  ReSendVerifyCodeData(this.crud);
  postData(String email) async {
    var response = await crud.postData(LinkApp.resendVerifyCode, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
