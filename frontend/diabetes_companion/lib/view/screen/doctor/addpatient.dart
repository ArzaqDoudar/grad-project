import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/doctor/addpaitentcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/scanbarcode.dart';
import '../../widget/buttonauth.dart';
import '../../widget/textfieldauth.dart';
import '../../widget/topbardoctor.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});
  // Future<String> scanBarcodeNormal() async {
  //   String barcodeScanRes;
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print('barcodeScanRes=================');
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //   return barcodeScanRes;
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(AddPatientControllerImp());
    final screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<AddPatientControllerImp>(
      builder: (controller) => Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(50.0),
        //   child: TopBarDoctor(
        //     id: controller.id!,
        //     email: controller.email!,
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          title: const Text('المرضى'),
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'اضف مريض جديد',
                      style: TextStyle(fontSize: 35, color: ColorApp.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: controller.patientId,
                        style: const TextStyle(
                          fontSize: 20,
                          color: ColorApp.darkBlue,
                        ),
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: ColorApp.blue,
                              width: 2.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: ColorApp.blue,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "رقم المريض",
                              style: TextStyle(
                                fontSize: 20,
                                color: ColorApp.blue,
                              ),
                            ),
                          ),
                          iconColor: ColorApp.blue,
                          suffixIcon: !kIsWeb
                              ? IconButton(
                                  onPressed: () => controller.scanning(),
                                  icon: const Icon(
                                    Icons.qr_code_scanner_outlined,
                                    size: 30,
                                    color: ColorApp.darkBlue,
                                  ),
                                )
                              : Container(),
                          // prefixIcon: Icon(Icons.abc),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: ColorApp.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          textStyle: const TextStyle(fontSize: 24),
                        ),
                        onPressed: () => controller.addPatient(),
                        child: const Text('اضافة'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
