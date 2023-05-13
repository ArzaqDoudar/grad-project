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
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'المعلومات الشخصية',
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
                      // valid: (val) {},
                      lable: "الاسم",
                      passwordVisible: false,
                      textEditingController: userNameController,
                      type: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                      // valid: (val) {},
                      lable: "البريد الالكتروني",
                      passwordVisible: false,
                      textEditingController: userEmailController,
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                      // valid: (val) {},
                      lable: "رقم الجوال",
                      passwordVisible: false,
                      textEditingController: userEmailController,
                      type: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                      label: 'تغيير كلمة السر',
                      onPressedFun: () {
                        // Navigator.of(context, rootNavigator: true)
                        //     .pushAndRemoveUntil(
                        //         MaterialPageRoute(
                        //             builder: (context) => const ChangePass()),
                        //         (route) => true);
                      },
                    ),
                  ]),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                ButtonAuth(label: 'حفظ', onPressedFun: () {})
              ],
            ),
          ),
        ));
  }
}
