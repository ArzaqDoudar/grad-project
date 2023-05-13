import '/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import 'sectopbar.dart';

class PatientInfo extends StatefulWidget {
  final String patientName;
  final String diabetesType;
  final num patientAge;
  final String patientGender;
  final num patientPhone;

  const PatientInfo(
      {super.key,
      required this.patientName,
      required this.diabetesType,
      required this.patientAge,
      required this.patientGender,
      required this.patientPhone});

  @override
  State<PatientInfo> createState() => PatientInfoState();
}

class PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'معلومات المريض',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: AssetImage(ImageAsset.avatarPatient),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.patientName,
                          style: const TextStyle(
                              fontSize: 35, color: ColorApp.red),
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
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    const Text(
                                      'العمر : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: ColorApp.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${widget.patientAge} عام',
                                      style: const TextStyle(
                                          fontSize: 25, color: ColorApp.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                const Text(
                                  'الجنس : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorApp.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.patientGender,
                                  style: const TextStyle(
                                      fontSize: 25, color: ColorApp.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                const Text(
                                  'رقم الجوال : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorApp.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${widget.patientPhone}',
                                  style: const TextStyle(
                                      fontSize: 25, color: ColorApp.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                const Text(
                                  'نوع السكري : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorApp.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.diabetesType,
                                  style: const TextStyle(
                                      fontSize: 25, color: ColorApp.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 150,
                    child: ButtonAuth(
                      label: 'التقرير',
                      onPressedFun: () {},
                    )),
              ],
            ),
          ),
        ));
  }
}
