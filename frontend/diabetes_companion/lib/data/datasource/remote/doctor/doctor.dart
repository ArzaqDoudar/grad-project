import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class DoctorData {
  Crud crud;
  DoctorData(this.crud);
  postData(String id) async {
    var response = await crud.postData(LinkApp.getPatientDoctor, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllPatients(String id) async {
    var response = await crud.postData(LinkApp.getAllPatients, {
      'id': id,
    });
    print('response === ');
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  getDoctor(String id) async {
    var response = await crud.postData(LinkApp.getDoctor, {
      'id': id,
    });
    print('response === ');
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  addDoctor(String id, String doctorId) async {
    var response = await crud.postData(LinkApp.addDoctor, {
      'id': id, // patient id
      'doctorId': doctorId,
    });
    print('response === ');
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  editProfile(String id, String name, String phone, String specialty) async {
    var response = await crud.postData(LinkApp.editProfileDoctor, {
      'id': id,
      'name': name,
      'phone': phone,
      'specialty': specialty,
    });
    print('response === ');
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
