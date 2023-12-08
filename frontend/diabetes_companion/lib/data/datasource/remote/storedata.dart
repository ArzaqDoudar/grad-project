import '../../../../../linkapi.dart';
import '/core/class/crud.dart';

class StoreData {
  Crud crud;
  StoreData(this.crud);
  getAllStores() async {
    var response = await crud.postData(LinkApp.getAllStores, {});
    return response.fold((l) => l, (r) => r);
  }

  getStore(String id) async {
    var response = await crud.postData(LinkApp.getStore, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getProduct(String id) async {
    var response = await crud.postData(LinkApp.getProduct, {
      'id': id, // product id
    });
    return response.fold((l) => l, (r) => r);
  }

  getStoreProducts(String id) async {
    var response = await crud.postData(LinkApp.getStoreProducts, {
      'id': id, // store id
    });
    return response.fold((l) => l, (r) => r);
  }
}
