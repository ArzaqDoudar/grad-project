import 'package:get/get.dart';
import '../../../../controller/doctor/editprofiledoctorcontroller.dart';
import '/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/customtextbutton.dart';
import '../../../widget/sectopbar.dart';
import '../../../widget/textfieldauth.dart';

class EditProfileDoctor extends StatefulWidget {
  const EditProfileDoctor({super.key});

  @override
  State<EditProfileDoctor> createState() => EditProfileDoctorState();
}

class EditProfileDoctorState extends State<EditProfileDoctor> {
  // int id = 1;

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileDoctorControllerImp());

    return GetBuilder<EditProfileDoctorControllerImp>(
      builder: (controller) => Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'تعديل المعلومات الشخصية',
          ),
        ),
        body: SingleChildScrollView(
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
                        child: const Image(
                          image: AssetImage(ImageAsset.avatarDoctor),
                          // image: NetworkImage(ImageAsset.avatarDoctor),
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
                          onPressed: () {},
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
                      height: 20,
                    ),
                    TextFieldAuth(
                      lable: "التخصص",
                      passwordVisible: false,
                      textEditingController: controller.specialty,
                      type: TextInputType.emailAddress,
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
                    CustomTextButton(
                      label: 'تغيير كلمة السر',
                      onPressedFun: () {},
                    ),
                  ]),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                ButtonAuth(label: 'حفظ', onPressedFun: () => controller.edit())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
