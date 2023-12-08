import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(LinkApp.login, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
