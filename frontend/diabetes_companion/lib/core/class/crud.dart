import 'dart:convert';
import 'package:dartz/dartz.dart';
import '/core/class/statusrequest.dart';
import '/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     if (await checkInternet()) {
//       var response = await http.post(Uri.parse(linkurl), body: data);
//       print('response.statusCode ====>');
//       print(response.statusCode);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map responsebody = jsonDecode(response.body);
//         print(responsebody);
//         return Right(responsebody);
//       } else {
//         return const Left(StatusRequest.serverfailure);
//       }
//     } else {
//       return const Left(StatusRequest.offlinefailure);
//     }
//   }
// }
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        print(data);

        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
