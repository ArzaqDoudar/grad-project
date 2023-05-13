import 'package:diabetes_companion/controller/patient/maincontrollers/homecontroller.dart';
import 'package:diabetes_companion/view/widget/bottombar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';

import '../../widget/advicecard.dart';
import '../../widget/datetime/basicdatetimefield.dart';
import 'package:flutter/material.dart';
import '../../widget/mydoctorline.dart';
import '../../widget/topbar.dart';
import '/data/datasource/static/staticadvice.dart';
// import 'auth/login.dart';

class Home extends StatelessWidget {
  Home({super.key});
  int index = 0;

  final TextEditingController dateController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final FocusNode textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(
            id: controller.id!,
            email: controller.email!,
          ),
        ),
        body: Container(
          // color: Colors.red,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    AdviceCard(
                      text: adviceModelList[1].text,
                      image: adviceModelList[1].image,
                    ),

                    // BasicDateField(),
                    BasicDateTimeField(
                      textEditingController: dateController,
                    ),

                    CustomDropDownTextField(
                        textFieldFocusNode: textFieldFocusNode,
                        searchFocusNode: searchFocusNode),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (BuildContext context) => const Login(),
                    //       ),
                    //     );
                    //   },
                    //   child: const Text('Open route'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
            id: controller.id!, email: controller.email!, index: index),
      ),
    );
  }
}

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.textFieldFocusNode,
    required this.searchFocusNode,
  });

  final FocusNode textFieldFocusNode;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      clearOption: true,
      textFieldFocusNode: textFieldFocusNode,
      searchFocusNode: searchFocusNode,
      // searchAutofocus: true,
      dropDownItemCount: 8,
      searchShowCursor: false,
      enableSearch: true,
      searchKeyboardType: TextInputType.number,
      dropDownList: const [
        DropDownValueModel(name: 'name1', value: "value1"),
        DropDownValueModel(name: 'name2', value: "value2"),
        DropDownValueModel(name: 'name3', value: "value3"),
        DropDownValueModel(name: 'name4', value: "value4"),
        DropDownValueModel(name: 'name5', value: "value5"),
        DropDownValueModel(name: 'name6', value: "value6"),
        DropDownValueModel(name: 'name7', value: "value7"),
        DropDownValueModel(name: 'name8', value: "value8"),
      ],
      onChanged: (val) {},
    );
  }
}
