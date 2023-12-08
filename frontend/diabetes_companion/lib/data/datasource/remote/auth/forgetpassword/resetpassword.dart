import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email, String newPassword) async {
    var response = await crud.postData(LinkApp.resetPassword, {
      'email': email,
      'newPassword': newPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
