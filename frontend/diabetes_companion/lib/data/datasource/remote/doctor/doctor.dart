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
}
