import '../../../../linkapi.dart';
import '/core/class/crud.dart';

class GetPatientDoctorData {
  Crud crud;
  GetPatientDoctorData(this.crud);
  postData(String id) async {
    var response = await crud.postData(LinkApp.getPatientsDoctors, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
