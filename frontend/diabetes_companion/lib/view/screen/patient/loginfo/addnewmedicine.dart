import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/buttonauth.dart';
import '../../../widget/dropdownunit.dart';
import '../../../widget/sectopbar.dart';
import '../../../widget/textfieldauth.dart';

class AddNewMedicine extends StatelessWidget {
  AddNewMedicine({super.key});
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController addDoseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SecTopBar(
          label: 'اضافة جرعة جديدة',
        ),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage(ImageAsset.medicine),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                TextFieldAuth(
                  // valid: (val) {},
                  textEditingController: medicineNameController,
                  lable: "اسم الدواء",
                  passwordVisible: false,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldAuth(
                  // valid: (val) {},
                  textEditingController: addDoseController,
                  lable: "الكمية",
                  passwordVisible: false,
                  type: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDropdownMenuUnit(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: ButtonAuth(
                    label: 'حفظ',
                    onPressedFun: () {},
                  ),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
