import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/buttonauth.dart';
import '../../../widget/sectopbar.dart';

class AddNewCarbs extends StatelessWidget {
  final AddLogsControllerImp controller;
  const AddNewCarbs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Get.put(AllCarbsControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: ColorApp.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'اضافة وجبة جديدة',
          ),
        ),
        body: Center(
          child: Stack(children: <Widget>[
            Padding(
              padding: (kIsWeb)
                  ? EdgeInsets.symmetric(horizontal: (screenWidth * 0.5) - 250)
                  : const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    // ButtonAuth(
                    //   label: 'حساب جرعة الأنسولين المناسبة',
                    //   onPressedFun: () => controller.saveMedicine(),
                    // ),
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
                      onPressed: () => controller.saveMedicine(),
                      // {
                      //   Navigator.of(context, rootNavigator: true)
                      //       .pushAndRemoveUntil(
                      //           MaterialPageRoute(
                      //               builder: (context) => const ScanBarcode()),
                      //           (route) => true);
                      // },
                      child: const Icon(Icons.qr_code_scanner),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: ColorApp.darkBlue,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: controller.allcarbslist,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        )
        // }),
        );
  }
}
