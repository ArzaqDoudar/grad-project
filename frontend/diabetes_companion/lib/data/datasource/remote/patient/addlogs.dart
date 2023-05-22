import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class AddLogsData {
  Crud crud;
  AddLogsData(this.crud);
  insertGlocose(String id, String data, String time, String tag) async {
    var response = await crud.postData(LinkApp.insertGlocose, {
      'id': id,
      'data': data,
      'time': time,
      'tag': tag,
    });
    return response.fold((l) => l, (r) => r);
  }

  getGlocose(String id, String time) async {
    var response = await crud.postData(LinkApp.insertGlocose, {
      //TODO edit link
      'id': id,
      'time': time,
    });
    return response.fold((l) => l, (r) => r);
  }
}
/*
patientId
blood_glocose
time
description
tag 
*/