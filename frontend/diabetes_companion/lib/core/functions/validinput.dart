import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return false;
  }

  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return false;
    }
  } else if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return false;
    }
  } else if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return false;
    }
  } else if (type == 'number') {
    if (!GetUtils.isNumericOnly(val)) {
      return false;
    }
  }

  if (val.length >= min && val.length <= max) {
    return true;
  } else {
    return false;
  }
}
