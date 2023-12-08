import 'package:get/get.dart';

// validInput(String val, String type, int? min, int? max) {
//   if (val.isEmpty) {
//     return 'this field must be nt empty';
//   }

//   if (type == 'username') {
//     if (!GetUtils.isUsername(val)) {
//       return 'invaled username';
//     }
//   } else if (type == 'name') {
//   } else if (type == 'email') {
//     if (!GetUtils.isEmail(val)) {
//       return 'invaled email';
//     }
//   } else if (type == 'phone') {
//     if (!GetUtils.isPhoneNumber(val)) {
//       return 'invaled phone number';
//     }
//   } else if (type == 'number') {
//     if (!GetUtils.isNumericOnly(val)) {
//       return 'this field must be number only';
//     }
//   } else if (type == 'password') {
//     if (val.length > max! || val.length < min!) {
//       return ' password must be between $min and  $max';
//     }
//   }
//   return 'else';

//   // if (val.length >= min && val.length <= max) {
//   //   return true;
//   // } else {
//   //   return false;
//   // }
// }

validInput(String val, String type, int min, int max) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
