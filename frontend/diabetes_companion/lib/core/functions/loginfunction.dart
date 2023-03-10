import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> loginUser(emailController, passwordController) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var loginBody = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    var response = await http.post(
      Uri.parse('uri'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(loginBody),
    );

    print(response);
    return true;
  } else {
    return false;
    // setState(() {
    //   _isNotValidate = false;
    // });
  }
}