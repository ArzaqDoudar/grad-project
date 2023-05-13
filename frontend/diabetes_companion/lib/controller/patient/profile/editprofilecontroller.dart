import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/editprofile.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class EditProfileController extends GetxController {
  edit();
  goToResetPassword();
  changeCheckBox(bool value, int index);
  // backToProfile();
}

class EditProfileControllerImp extends EditProfileController {
  late String? id;
  late String email;
  late TextEditingController name;
  // late TextEditingController gender;
  late TextEditingController birthdate;
  late TextEditingController avatar;
  late TextEditingController phone;
  late SingleValueDropDownController diabetestype;

  final ImagePicker picker = ImagePicker();
  XFile? image;

  String? namedata;
  String? birthdatedata;
  String? genderdata;
  String? diabetestypedata;
  String? phonedata;
  String? avatardata;

  bool heartdisease = false; // امراض القلب
  bool bloodpressure = false; // ضغط الدم
  bool kidneydisease = false; // امراض الكلى
  bool greasy = false;
  late String heartdiseasedata;
  late String bloodpressuredata;
  late String kidneydiseasedata;
  late String greasydata;

  String _gender = '';

  String get gender => _gender;

  set gender(String value) {
    // print('the gender type = $value');
    _gender = value;
    update();
    // print('the _gender type = $_gender');
  }

  String gendervalue = 'male';
  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());
  EditProfileData editProfileData = EditProfileData(Get.find());

  List data = [];
  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    namedata = Get.arguments['name'];
    birthdatedata = Get.arguments['birthdate'];
    genderdata = Get.arguments['gender'];
    diabetestypedata = Get.arguments['diabetestype'];
    phonedata = Get.arguments['phone'];
    avatardata = Get.arguments['avatar'];
    heartdiseasedata = Get.arguments['heartdisease'];
    bloodpressuredata = Get.arguments['bloodpressure'];
    kidneydiseasedata = Get.arguments['kidneydisease'];
    greasydata = Get.arguments['greasy'];

    if (heartdiseasedata == 'true') {
      heartdisease = true;
      update();
    }
    if (bloodpressuredata == 'true') {
      bloodpressure = true;
      update();
    }
    if (kidneydiseasedata == 'true') {
      kidneydisease = true;
      update();
    }
    if (greasydata == 'true') {
      greasy = true;
      update();
    }
    name = TextEditingController();
    // gender = TextEditingController();
    birthdate = TextEditingController();
    avatar = TextEditingController();
    phone = TextEditingController();
    diabetestype = SingleValueDropDownController();
    // getDate();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    birthdate.dispose();
    avatar.dispose();
    phone.dispose();
    diabetestype.dispose();
    super.dispose();
  }

  @override
  edit() async {
    statusRequest = StatusRequest.loading;
    update();
    if (name.text.isNotEmpty) {
      namedata = name.text;
    }
    if (phone.text.isNotEmpty) {
      phonedata = phone.text;
    }
    if (avatar.text.isNotEmpty) {
      avatardata = avatar.text;
    }
    if (greasy) {
      greasydata = 'true';
    } else {
      greasydata = 'false';
    }

    if (heartdisease) {
      heartdiseasedata = 'true';
    } else {
      heartdiseasedata = 'false';
    }

    if (kidneydisease) {
      kidneydiseasedata = 'true';
    } else {
      kidneydiseasedata = 'false';
    }

    if (bloodpressure) {
      bloodpressuredata = 'true';
    } else {
      bloodpressuredata = 'false';
    }

    if (gender != '') {
      genderdata = gender;
    }
    if (birthdate.value.text.isNotEmpty) {
      List<String> date = birthdate.value.text.split('-');

      birthdatedata = "${date[0]}-${date[1]}-${date[2]}";
    }
    if (diabetestype.dropDownValue != null) {
      diabetestypedata = diabetestype.dropDownValue!.value;
    }
    var response = await editProfileData.postData(
      id!,
      namedata!,
      'avatar.png',
      phonedata!,
      birthdatedata.toString(),
      genderdata!,
      diabetestypedata!,
      heartdiseasedata,
      bloodpressuredata,
      kidneydiseasedata,
      greasydata,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print('response $response');
      if (response['status'] == true) {
        Get.offNamed(RouteApp.profile, arguments: {
          'id': response['id'],
          'email': response['email'],
        });
      } else {
        Get.defaultDialog(
          title: 'حدث خطأ',
          middleText: response['msg'],
        );
      }
    } else {
      print('id = $id');
      print('statusRequest = $statusRequest');
      print('response error');
    }
  }

  @override
  goToResetPassword() {
    Get.offNamed(RouteApp.resetpassword, arguments: {
      'id': id,
      'email': email,
    });
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: ImageSource.gallery);
    // Image.file(File(img!.path));
    image = img;
    print(img!.path);

    update();
  }

  String myAlert(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return image!.path;
  }

  @override
  changeCheckBox(bool value, int index) {
    switch (index) {
      case 1:
        heartdisease = value;
        break;
      case 2:
        bloodpressure = value;
        break;
      case 3:
        kidneydisease = value;
        break;
      case 4:
        greasy = value;
        break;
    }
    update();
  }

  // @override
  // backToProfile() {
  //   Get.offNamed(RouteApp.profile, arguments: {
  //     'id': id,
  //     'email': email,
  //   });
  // }
}
