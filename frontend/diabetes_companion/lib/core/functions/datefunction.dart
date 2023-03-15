void dateFunction(dateController) async {
  if (dateController.text.isNotEmpty) {
    var loginBody = {
      "Date": dateController.text,
    };
    // var response = await http.post(
    //   Uri.parse('uri'),
    //   headers: {"Content-type": "application/json"},
    //   body: jsonEncode(loginBody),
    // );

    print(loginBody);
  } else {
    print('login ===> else ');
    // setState(() {
    //   _isNotValidate = false;
    // });
  }
}
