import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class LogsData {
  Crud crud;
  LogsData(this.crud);
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
    var response = await crud.postData(LinkApp.getGlocose, {
      'id': id,
      'timerange': time,
    });
    return response.fold((l) => l, (r) => r);
  }

  insertInsulin(String id, String doseUnits, String time) async {
    var response = await crud.postData(LinkApp.insertInsulin, {
      'id': id,
      'dose_units': doseUnits,
      'time': time,
    });
    return response.fold((l) => l, (r) => r);
  }

  getInsulin(String id, String time) async {
    var response = await crud.postData(LinkApp.getInsulin, {
      'id': id,
      'timerange': time,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllCarbs() async {
    var response = await crud.postData(LinkApp.getAllCarbs, {});
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