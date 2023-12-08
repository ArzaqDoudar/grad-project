import '/controller/doctor/addadvicecontroller.dart';
import '/view/widget/textfieldauth.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';

import '../../widget/buttonauth.dart';
import '../../widget/customdropdowntextfield.dart';
import '/view/widget/topbardoctor.dart';
import 'package:flutter/material.dart';
import '../../widget/bottombardoctor.dart';
import '/core/constant/color.dart';
// import 'package:date_field/date_field.dart';

class AddAdvice extends StatelessWidget {
  // final AddLogsControllerImp controller;
  const AddAdvice({super.key});
  static int index = 1;
  @override
  Widget build(BuildContext context) {
    Get.put(AddAdviceControllerImp());
    return GetBuilder<AddAdviceControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBarDoctor(
            id: controller.id!,
            email: controller.email!,
          ),
        ),
        body: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                const SizedBox(height: 10),
                const Text(
                  'اضف نصيحة جديدة',
                  style: TextStyle(fontSize: 35, color: ColorApp.blue),
                ),
                const SizedBox(height: 10),
                TextFieldAuth(
                  lable: 'العنوان',
                  textEditingController: controller.text,
                ),
                const SizedBox(height: 10),
                TextFieldAuth(
                  lable: 'الوصف',
                  textEditingController: controller.description,
                  type: TextInputType.multiline,
                  maxLinesNum: 5,
                ),
                const SizedBox(height: 10),
                CustomDropDownTextField(
                  controller: controller.diabetestype,
                  items: const [
                    DropDownValueModel(
                      name: 'اختر نوع السكري المناسب ',
                      value: "0",
                    ),
                    DropDownValueModel(name: 'النوع الأول', value: "1"),
                    DropDownValueModel(name: 'النوع الثاني', value: "2"),
                    DropDownValueModel(
                        name: 'النوع الأول و الثاني', value: "3"),
                  ],
                ),
                const SizedBox(height: 10),
                CustomDropDownTextField(
                  controller: controller.tag,
                  items: const [
                    DropDownValueModel(
                        name: 'سكري مرتفع', value: "high glocose"),
                    DropDownValueModel(
                        name: 'سكري منخفض ', value: "low glocose"),
                    DropDownValueModel(
                        name: 'سكري طبيعي ', value: "normal glocose"),
                    // DropDownValueModel(
                    //     name: 'سكري منخفض ', value: "low glocose"),
                    // DropDownValueModel(
                    //     name: 'سكري منخفض ', value: "low glocose"),
                  ],
                ),
                const SizedBox(height: 20),
                ButtonAuth(
                  label: 'حفظ',
                  onPressedFun: () => controller.addNewAdvice(),
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: BottomBarDoctor(
          id: controller.id!,
          email: controller.email!,
          index: index,
        ),
      ),
    );
  }
}






















// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// import '../../../../core/constant/color.dart';
// import '../../widget/buttonauth.dart';
// import '../../widget/textfieldauth.dart';
// import 'package:image_picker/image_picker.dart';

// class AddAdvicePage extends StatelessWidget {
//   const AddAdvicePage({super.key});

// //   @override
// //   State<AddAdvicePage> createState() => AddAdvicePageState();
// // }

// // class AddAdvicePageState extends State<AddAdvicePage> {
//   // TextEditingController dateController = TextEditingController();
//   // TextEditingController glocoseController = TextEditingController();

//   // @override
//   // void initState() {
//   //   dateController.text = ""; //set the initial value of text field
//   //   super.initState();
//   // }

//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(children: <Widget>[
//         // Container(
//         //   alignment: Alignment.center,
//         //   child: const Image(
//         //     image: AssetImage(ImageAsset.glucose),
//         //     fit: BoxFit.cover,
//         //     height: double.infinity,
//         //     width: double.infinity,
//         //   ),
//         // ),
//         Directionality(
//           textDirection: ui.TextDirection.rtl,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   const Text(
//                     'أضف نصيحة جديدة',
//                     style: TextStyle(fontSize: 30, color: ColorApp.red),
//                     maxLines: 2,
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFieldAuth(
//                     // valid: (val) {},
//                     lable: "النص",
//                     passwordVisible: false,
//                     type: TextInputType.number,
//                     textEditingController: glocoseController,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFieldAuth(
//                     // valid: (val) {},
//                     lable: "الوصف",
//                     passwordVisible: false,
//                     type: TextInputType.number,
//                     textEditingController: glocoseController,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         backgroundColor: ColorApp.blue),
//                     onPressed: () {
//                       myAlert();
//                     },
//                     child: const Text(
//                       'أضف صورة للنصيحة',
//                       style: TextStyle(
//                           fontFamily: 'Amiri',
//                           color: ColorApp.white,
//                           fontWeight: FontWeight.normal,
//                           fontSize: 25),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   // if image not null show the image
//                   // if image null show text
//                   image != null
//                       ? Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.file(
//                               //to show image, you type like this.
//                               File(image!.path),
//                               fit: BoxFit.cover,
//                               width: MediaQuery.of(context).size.width,
//                               height: 300,
//                             ),
//                           ),
//                         )
//                       : const Text(
//                           "لا يوجد صورة",
//                           style: TextStyle(
//                               fontSize: 20, color: ColorApp.lightblue),
//                         ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 110),
//                     child: ButtonAuth(
//                       label: 'حفظ',
//                       onPressedFun: () {},
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ]),
//     );
//   }
// }
