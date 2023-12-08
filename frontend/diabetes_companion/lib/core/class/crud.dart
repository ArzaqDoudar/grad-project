import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '/core/class/statusrequest.dart';
import '/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    print('link 1 $linkurl');
    print('data $data');

    try {
      print('link 2 $linkurl');
      if (kIsWeb) {
        print(data);
        print('link o $linkurl');
        var response = await http.post(Uri.parse(linkurl),
            headers: {"Accept": "*/*"}, body: data);
        print('response in Crud $response');
        print('link $linkurl');

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else if (await checkInternet()) {
        print(data);
        print('link 3 $linkurl');
        var response = await http.post(Uri.parse(linkurl),
            headers: {"Accept": "*/*"}, body: data);
        print('response in Crud $response');
        print('link $linkurl');

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("exception == ");
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }
}
