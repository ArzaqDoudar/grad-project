import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String name, String email, String password) async {
    var response = await crud.postData(LinkApp.signupInsert, {
      'name': name,
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
