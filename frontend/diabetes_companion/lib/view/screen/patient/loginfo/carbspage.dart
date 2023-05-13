import 'package:flutter/material.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
import 'addnewcarbs.dart';
import 'scanbarcode.dart';

class CarbsPage extends StatelessWidget {
  final AddLogsControllerImp controller;
  const CarbsPage({super.key, required this.controller});
  // final TextEditingController fatsController = TextEditingController();
  // final TextEditingController carbsController = TextEditingController();
  // final TextEditingController proteinController = TextEditingController();
  // final TextEditingController caloriesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Stack(children: <Widget>[
          Form(
            child: Column(children: [
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                                  builder: (context) => AddNewCarbs()),
                              (route) => true);
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 20,
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
                                  builder: (context) => const ScanBarcode()),
                              (route) => true);
                    },
                    child: const Icon(Icons.qr_code_scanner),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.blueGrey,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
