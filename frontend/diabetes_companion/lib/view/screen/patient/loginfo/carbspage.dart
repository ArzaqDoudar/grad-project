import 'package:diabetes_companion/view/screen/patient/loginfo/adddose.dart';
import 'package:diabetes_companion/view/widget/carbsline.dart';
import 'package:diabetes_companion/view/widget/customdropdowntextfield.dart';
import 'package:get/get.dart';
import 'package:inc_dec_textfield/inc_dec_textfield.dart';

import '../../../../core/constant/routes.dart';
import '../../../widget/buttonauth.dart';
import '/core/class/carb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect/multiselect.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
import 'addnewcarbs.dart';
import 'scanbarcode.dart';

class CarbsPage extends StatelessWidget {
  final AddLogsControllerImp controller;

  final _multiSelectKey = GlobalKey<FormFieldState>();

  CarbsPage({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Stack(children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'أضف وجبة جديدة',
                        style: TextStyle(
                            fontFamily: 'Amiri',
                            color: ColorApp.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 30),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(fontSize: 20),
                          alignment: const Center().alignment,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScanBarcode()),
                                  (route) => true);
                        },
                        child: const Icon(Icons.qr_code_scanner),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropDownTextField(
                      controller: controller.carbDropdownController,
                      items: controller.carbsItems),
                  const SizedBox(
                    height: 10,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: IncDecTextField(
                      controller: controller.incDecController,
                      borderColor: ColorApp.blue,
                      currency: 'العدد',
                      isCurrency: false,
                      isNegativeRequired: false,
                      textStyle: const TextStyle(
                          color: ColorApp.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                      incIcon: const Icon(
                        Icons.add,
                        color: ColorApp.blue,
                      ),
                      decIcon: const Icon(
                        Icons.minimize,
                        color: ColorApp.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ButtonAuth(
                    label: 'اضافة',
                    onPressedFun: () => controller.addCarb(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (kIsWeb)
                      ? const Text('')
                      : const Divider(
                          color: Colors.blueGrey,
                        ),
                  SizedBox(
                    height: screenHeight * 0.29,
                    child: ListView.builder(
                      itemCount: controller.allcarbs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return controller.allcarbs.elementAt(index);
                      },
                    ),
                  ),
                  ButtonAuth(
                      label: 'حساب الجرعة المناسبة',
                      color: ColorApp.blue,
                      onPressedFun: () {
                        controller.dose =
                            controller.carbs / controller.carbstoinsulin;
                        controller.dose =
                            double.parse(controller.dose.toStringAsFixed(1));
                        print(
                            'total dose inside carbs page = ${controller.dose}');
                        // controller.calculateDose();
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => AddNewDose(
                              controller: controller,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
