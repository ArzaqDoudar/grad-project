import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postData(String email, String code) async {
    var response = await crud.postData(LinkApp.checkCode, {
      'email': email,
      'code': code,
    });
    print('response from VerifyCodeSignUpData $response');
    return response.fold((l) => l, (r) => r);
  }
}
