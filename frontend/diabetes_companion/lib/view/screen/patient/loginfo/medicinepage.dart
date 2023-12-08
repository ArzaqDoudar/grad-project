import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '/core/constant/color.dart';
import 'adddose.dart';
// import 'package:date_field/date_field.dart';

class MedicinePage extends StatelessWidget {
  final AddLogsControllerImp controller;
  const MedicinePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            Form(
              child: Padding(
                padding: (kIsWeb)
                    ? EdgeInsets.symmetric(
                        horizontal: (screenWidth * 0.5) - 500)
                    : const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'أضف دواء جديد',
                            style:
                                TextStyle(color: ColorApp.blue, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 15,
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
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => AddNewDose(
                                    controller: controller,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          (kIsWeb)
                              ? const Text('')
                              : const Divider(
                                  color: Colors.blueGrey,
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Column(children: ,),
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
