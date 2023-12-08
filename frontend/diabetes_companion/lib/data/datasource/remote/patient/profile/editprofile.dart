import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class EditProfileData {
  Crud crud;
  EditProfileData(this.crud);
  postData(
    String id,
    String name,
    String avatar,
    String phone,
    String birthdate,
    String gender,
    String diabetestype,
    String heartdisease,
    String bloodpressure,
    String kidneydisease,
    String greasy,
    String weight,
    String carbstoinsulin,
  ) async {
    var response = await crud.postData(LinkApp.editProfile, {
      'id': id,
      'name': name,
      'avatar': avatar,
      'phone': phone,
      'birthdate': birthdate,
      'gender': gender,
      'diabetes_type': diabetestype,
      'heartdisease': heartdisease,
      'bloodpressure': bloodpressure,
      'kidneydisease': kidneydisease,
      'greasy': greasy,
      'weight': weight,
      'carbstoinsulin': carbstoinsulin,
    });
    return response.fold((l) => l, (r) => r);
  }
}
