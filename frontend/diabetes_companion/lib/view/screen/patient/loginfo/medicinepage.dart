import 'package:flutter/material.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '/core/constant/color.dart';
import 'addnewmedicine.dart';
// import 'package:date_field/date_field.dart';

class MedicinePage extends StatelessWidget {
  final AddLogsControllerImp controller;
  const MedicinePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Stack(children: <Widget>[
          Form(
            child: Column(children: [
              Center(
                child: Column(
                  children: [
                    const Text(
                      'أضف دواء جديد',
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
                                    builder: (context) => AddNewMedicine()),
                                (route) => true);
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Divider(
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
