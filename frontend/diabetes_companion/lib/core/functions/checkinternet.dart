import 'dart:io';
import 'package:http/http.dart' as http;

// Future<bool> checkInternet() async {
//   try {
//     print('test 1 ');
//     final result = await http.get(Uri.parse('google.com'));
//     print('test 2 ');
//     if (result.statusCode == 200) {
//       print('test 3 ');
//       return true;
//     } else {
//       print('test 4 ');
//       return false;
//     }
//   } on SocketException catch (_) {
//     print('test 5 ');
//     return false;
//   }
// }
Future<bool> checkInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
