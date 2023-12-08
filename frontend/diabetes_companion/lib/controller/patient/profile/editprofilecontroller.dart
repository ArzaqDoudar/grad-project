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
  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());
  EditProfileData editProfileData = EditProfileData(Get.find());

  late String? id;
  late String email;
  late TextEditingController name;
  late TextEditingController birthdate;
  late TextEditingController avatar;
  late TextEditingController phone;
  late TextEditingController weight;
  late TextEditingController carbstoinsulin;
  late SingleValueDropDownController diabetestype;
  late DropDownValueModel diabetestypemodel;
  bool heartdisease = false; // امراض القلب
  bool bloodpressure = false; // ضغط الدم
  bool kidneydisease = false; // امراض الكلى
  bool greasy = false;

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    update();
  }

  final ImagePicker picker = ImagePicker();
  XFile? image;

  String? namedata;
  String? birthdatedata;
  String? genderdata;
  String? diabetestypedata;
  String? phonedata;
  String? avatardata;
  String? weightdata;
  String? carbstoinsulindata;
  late String heartdiseasedata;
  late String bloodpressuredata;
  late String kidneydiseasedata;
  late String greasydata;

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
    weightdata = Get.arguments['weight'];
    carbstoinsulindata = Get.arguments['carbstoinsulin'];

    name = TextEditingController();
    birthdate = TextEditingController();
    avatar = TextEditingController();
    phone = TextEditingController();
    weight = TextEditingController();
    carbstoinsulin = TextEditingController();
    diabetestype = SingleValueDropDownController();

    if (diabetestypedata == "1") {
      diabetestype.setDropDown(
          const DropDownValueModel(name: 'النوع الأول', value: "1"));
    } else if (diabetestypedata == "2") {
      diabetestype.setDropDown(
          const DropDownValueModel(name: 'النوع الثاني', value: "2"));
    }
    if (birthdatedata != null && birthdatedata!.isNotEmpty) {
      List<String> date = birthdatedata!.split('T');
      birthdate.text = date[0];
    }
    if (namedata != null) {
      name.text = namedata!;
    }
    if (phonedata != null) {
      if (phonedata != "0") {
        phone.text = phonedata!;
      }
    }
    if (genderdata != null) {
      gender = genderdata!;
    }
    // print('weightdata $weightdata');
    if (weightdata != null) {
      weight.text = weightdata!;
    } else {
      weight.text = '0';
    }
    if (carbstoinsulindata != null) {
      carbstoinsulin.text = carbstoinsulindata!;
    } else {
      carbstoinsulin.text = '0';
    }
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
    heartdiseasedata = heartdisease ? 'true' : 'false';
    kidneydiseasedata = kidneydisease ? 'true' : 'false';
    bloodpressuredata = bloodpressure ? 'true' : 'false';
    greasydata = greasy ? 'true' : 'false';

    if (birthdate.text.isEmpty) {
      birthdate.text = '';
    }
    if (phone.text.isEmpty) {
      phone.text = "0";
    }
    if (weight.text.isEmpty) {
      weight.text = "0";
    }
    if (carbstoinsulin.text.isEmpty) {
      carbstoinsulin.text = "0";
    }
    if (diabetestype.dropDownValue != null) {
      diabetestypedata = diabetestype.dropDownValue!.value;
    } else {
      diabetestypedata = "0";
    }
    var response = await editProfileData.postData(
      id!,
      name.text,
      'avatar.png',
      phone.text,
      birthdate.text,
      gender,
      diabetestypedata!,
      heartdiseasedata,
      bloodpressuredata,
      kidneydiseasedata,
      greasydata,
      weight.text,
      carbstoinsulin.text,
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
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(RouteApp.resetpassword, arguments: {
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
}
