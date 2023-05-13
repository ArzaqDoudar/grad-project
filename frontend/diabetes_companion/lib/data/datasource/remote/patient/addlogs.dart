import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class AddLogsData {
  Crud crud;
  AddLogsData(this.crud);
  bloodGlocose(String id, int data, DateTime time, String tag) async {
    var response = await crud.postData(LinkApp.bloodglocose, {
      'id': id,
      'data': data,
      'time': time,
      'tag': tag,
    });
    return response.fold((l) => l, (r) => r);
  }
}
