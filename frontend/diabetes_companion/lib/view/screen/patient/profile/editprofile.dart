import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../core/constant/routes.dart';
import '../../../widget/genderradiobutton.dart';
import '/controller/patient/profile/editprofilecontroller.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/customtextbutton.dart';
import '../../../widget/datetime/basicdatefield.dart';
import '../../../widget/customdropdowntextfield.dart';
import '../../../widget/sectopbar.dart';
import '../../../widget/textfieldauth.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileControllerImp());

    return GetBuilder<EditProfileControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          title: const Text('تعديل المعلومات الشخصية'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offNamed(RouteApp.profile, arguments: {
                'id': controller.id,
                'email': controller.email,
              });
            },
          ),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage(controller.gender == 'female'
                                ? ImageAsset.avatarPatientfemale
                                : ImageAsset.avatarPatient),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorApp.blue),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              print('edit image');
                              controller.myAlert(context);
                            },
                            style: ButtonStyle(
                              iconColor:
                                  MaterialStateProperty.all(ColorApp.white),
                              backgroundColor:
                                  MaterialStateProperty.all(ColorApp.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(children: [
                      TextFieldAuth(
                        lable: "الاسم",
                        passwordVisible: false,
                        textEditingController: controller.name,
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => controller.gender = 'male',
                              child: Row(
                                children: [
                                  Radio(
                                    value: 'male',
                                    groupValue: controller.gender,
                                    onChanged: (String? val) =>
                                        controller.gender = 'male',
                                    activeColor: ColorApp.blue,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('ذكر'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.gender = 'female',
                              child: Row(
                                children: [
                                  Radio(
                                    value: 'female',
                                    groupValue: controller.gender,
                                    onChanged: (String? val) =>
                                        controller.gender = 'female',
                                    activeColor: ColorApp.blue,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('انثى'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BasicDateField(
                        controller: controller.birthdate,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldAuth(
                        lable: "رقم الجوال",
                        passwordVisible: false,
                        textEditingController: controller.phone,
                        type: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDownTextField(
                        controller: controller.diabetestype,
                        items: const [
                          DropDownValueModel(name: 'النوع الأول', value: "1"),
                          DropDownValueModel(name: 'النوع الثاني', value: "2")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => controller.changeCheckBox(
                                    !controller.heartdisease, 1),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.heartdisease,
                                      fillColor: MaterialStateProperty.all(
                                          ColorApp.blue),
                                      onChanged: (bool? value) =>
                                          controller.changeCheckBox(value!, 1),
                                    ),
                                    const Text('امراض القلب',
                                        style: TextStyle(
                                            color: ColorApp.blue,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.changeCheckBox(
                                    !controller.bloodpressure, 1),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.bloodpressure,
                                      fillColor: MaterialStateProperty.all(
                                          ColorApp.blue),
                                      onChanged: (bool? value) =>
                                          controller.changeCheckBox(value!, 2),
                                    ),
                                    const Text('ضغط الدم',
                                        style: TextStyle(
                                            color: ColorApp.blue,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.changeCheckBox(
                                    !controller.kidneydisease, 1),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.kidneydisease,
                                      fillColor: MaterialStateProperty.all(
                                          ColorApp.blue),
                                      onChanged: (bool? value) =>
                                          controller.changeCheckBox(value!, 3),
                                    ),
                                    const Text('امراض الكلـى',
                                        style: TextStyle(
                                            color: ColorApp.blue,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.changeCheckBox(
                                    !controller.greasy, 1),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.greasy,
                                      fillColor: MaterialStateProperty.all(
                                          ColorApp.blue),
                                      onChanged: (bool? value) =>
                                          controller.changeCheckBox(value!, 4),
                                    ),
                                    const Text(
                                      'الدهنيات',
                                      style: TextStyle(
                                          color: ColorApp.blue, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                        label: 'تغيير كلمة السر',
                        onPressedFun: () => controller.goToResetPassword(),
                      ),
                    ]),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonAuth(
                      label: 'حفظ', onPressedFun: () => controller.edit())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
