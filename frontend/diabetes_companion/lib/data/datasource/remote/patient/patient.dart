import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class PatientData {
  Crud crud;
  PatientData(this.crud);
  getPatientDoctor(String id) async {
    var response = await crud.postData(LinkApp.getPatientDoctor, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getPatientDoctorData(String id) async {
    var response = await crud.postData(LinkApp.getPatientsDoctors, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  changePassword(String id, String oldPassword, String newPassword) async {
    var response = await crud.postData(LinkApp.changePassword, {
      'id': id,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
