import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
// import '../widget/dropdownitems.dart';
import '../widget/sectopbar.dart';
import '../widget/textfieldauth.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //    String dropdownvalue = 'سكري نوع أول';
    //    var items = [
    //   'سكري نوع أول',
    //   'سكري نوع ثاني',
    //   'أخرى',
    // ];
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
                          image: AssetImage(ImageAsset.avatarPatient),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorApp.blue),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),
                // const Text(
                //   "فرح طوقان",
                //   style: TextStyle(fontSize: 35, color: ColorApp.darkBlue),
                // ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),

                Form(
                  child: Column(children: [
                    TextFieldAuth(
                      lable: "الاسم",
                      passwordVisible: false,
                      textEditingController: userNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                      lable: "البريد الالكتروني",
                      passwordVisible: false,
                      textEditingController: userEmailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                      lable: "رقم الجوال",
                      passwordVisible: false,
                      textEditingController: userPhoneController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // DropDownItems()
                    // TextFieldAuth(lable: "كلمة السر", passwordVisible: false,type: TextInputType.numberWithOptions(),),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
