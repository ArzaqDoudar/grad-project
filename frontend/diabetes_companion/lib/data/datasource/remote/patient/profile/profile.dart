import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  postData(String id) async {
    var response = await crud.postData(LinkApp.getPatient, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getPatientsDoctors(String id) async {
    var response = await crud.postData(LinkApp.getPatientsDoctors, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  addNewDoctor(String id, String name, String specialty, String email,
      String phone, String location) async {
    var response = await crud.postData(LinkApp.insertDoctor, {
      'patientId': id,
      'name': name,
      'speciality': specialty,
      'email': email,
      'phone': phone,
      'location': location,
    });
    return response.fold((l) => l, (r) => r);
  }
}
