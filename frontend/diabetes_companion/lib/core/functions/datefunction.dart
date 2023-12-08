void dateFunction(dateController) async {
  if (dateController.text.isNotEmpty) {
    var loginBody = {
      "Date": dateController.text,
    };
    print(loginBody);
  } else {
    print('login ===> else ');
  }
}
