import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class AdviceData {
  Crud crud;
  AdviceData(this.crud);
  getAdvice(String description) async {
    var response = await crud.postData(LinkApp.getAdvice, {
      // 'id': id,
      // 'data': data,
      // 'time': time,
      // 'tag': tag,
    });
    return response.fold((l) => l, (r) => r);
  }

  insertAdvice(String id, String text, String description, String diabetes_type,
      String tag) async {
    var response = await crud.postData(LinkApp.insertAdvice, {
      'doctor_id': id,
      'text': text,
      'description': description,
      'diabetes_type': diabetes_type,
      'tag': tag,
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