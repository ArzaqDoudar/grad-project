import 'package:diabetes_companion/controller/patient/profile/addnewdoctorcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/buttonauth.dart';
import '../../../widget/textfieldauth.dart';

class AddNewDoctor extends StatelessWidget {
  AddNewDoctor({super.key});
  // TextEditingController doctornamecontroller = TextEditingController();
  // TextEditingController specialitycontroller = TextEditingController();
  // TextEditingController phonecontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();
  // TextEditingController locationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewDoctorControllerImp());
    return GetBuilder<AddNewDoctorControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          title: const Text('اضافة طبيب جديد'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => controller.goToMyDoctors(),
          ),
        ),
        body: Center(
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                child: Column(children: [
                  const SizedBox(
                    height: 70,
                  ),
                  TextFieldAuth(
                    // valid: (val) {},
                    textEditingController: controller.name,
                    lable: "اسم الطبيب",
                    passwordVisible: false,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldAuth(
                    // valid: (val) {},
                    textEditingController: controller.specialty,
                    lable: "التخصص",
                    passwordVisible: false,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'معلومات الاتصال',
                    style: TextStyle(
                        fontFamily: 'Amiri',
                        color: ColorApp.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldAuth(
                    textEditingController: controller.phone,
                    lable: "رقم الهاتف المحمول",
                    // passwordVisible: false,
                    type: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldAuth(
                    textEditingController: controller.email,
                    lable: "البريد الالكتروني",
                    // passwordVisible: false,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldAuth(
                    // valid: (val) {},
                    textEditingController: controller.location,
                    lable: "العنوان",
                    type: TextInputType.streetAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonAuth(
                    label: 'حفظ',
                    onPressedFun: () => controller.addNewDoctor(),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
